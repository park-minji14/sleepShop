package com.sgsg.dra.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.sgsg.dra.common.MyUtil;
import com.sgsg.dra.domain.Question;
import com.sgsg.dra.domain.SessionInfo;
import com.sgsg.dra.service.QuestionService;

@RestController
@RequestMapping("/question")
public class QuestionController {
	private final Log log = LogFactory.getLog(this.getClass());

	@Autowired
	private QuestionService service;

	@Autowired
	private MyUtil myUtil;

	// 상품문의 글작성
	@PostMapping("write")
	public Map<String, Object> createQuestion(@ModelAttribute Question dto,
			@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request,
			HttpSession session) throws Exception {

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "question";
		String state = "true";

		log.info("Received question: " + dto.getQuestion());
		log.info("Received file: " + (file != null ? file.getOriginalFilename() : "No file"));

		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			if (info == null) {
				throw new Exception("세션 정보가 없습니다.");
			}
			dto.setUserId(info.getUserId());

			if (file != null && !file.isEmpty()) {
				List<MultipartFile> files = new ArrayList<>();
				files.add(file);
				dto.setSelectFile(files);
				log.info("File added to dto: " + file.getOriginalFilename());
			} else {
				log.info("No file received or file is empty");
			}

			service.insertQuestion(dto, pathname);
			log.info("Question inserted successfully");

		} catch (Exception e) {
			state = "false";
			log.error("Error in createQuestion: ", e);
		}

		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}

	// 상품문의 리스트
	@GetMapping("/list")
	@ResponseBody
	public Map<String, Object> list(@RequestParam long productNum,
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page, HttpSession session)
			throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		Map<String, Object> model = new HashMap<>();

		try {
			Map<String, Object> map = new HashMap<>();

			int size = 5;
			int dataCount = 0;

			map.put("productNum", productNum);

			dataCount = service.dataCount(map);
			int total_page = myUtil.pageCount(dataCount, size);
			if (current_page > total_page) {
				current_page = total_page;
			}

			int offset = (current_page - 1) * size;
			if (offset < 0)
				offset = 0;

			map.put("offset", offset);
			map.put("size", size);

			List<Question> list = service.listQuestion(map);
			for (Question dto : list) {
				if (dto.getSecret() == 0 && (info == null || !dto.getUserId().equals(info.getUserId()))) {
					dto.setQuestion("비공개 문의글 <img src='https://img.icons8.com/ios/20/000000/lock--v1.png' alt='lock'>");
					dto.setAnswer("");
					dto.setListFilename(null);
				}
			}
			String paging = myUtil.pagingFunc(current_page, total_page, "listQuestion");

			model.put("list", list);
			model.put("dataCount", dataCount);
			model.put("size", size);
			model.put("pageNo", current_page);
			model.put("paging", paging);
			model.put("total_page", total_page);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}
}