package com.sgsg.dra.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


import com.sgsg.dra.common.MyUtil;
import com.sgsg.dra.domain.Question;
import com.sgsg.dra.domain.SessionInfo;
import com.sgsg.dra.service.QuestionService;

@RestController
@RequestMapping("/question/*")
public class QuestionController {
	@Autowired
	private QuestionService service;

	@Autowired
	private MyUtil myUtil;

	//상품문의 글작성
	@PostMapping("write")
	public Map<String, Object> createQuestion(Question dto,HttpSession session) throws Exception {

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "question";
		String state = "true";

		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			dto.setUserId(info.getUserId());

			service.insertQuestion(dto, pathname);

		} catch (Exception e) {
			state = "false";
		}

		Map<String, Object> model = new HashMap<String,Object>();
		model.put("state", state);
		return model;
	}

	//상품 페이지의 문의 리스트 
	@GetMapping("list")
	public Map<String, Object> list(
			@RequestParam long productNum,
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page, 
			HttpSession session)throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");


		Map<String, Object> model = new HashMap<String,Object>();

		try {
			Map<String, Object> map = new HashMap<String,Object>();

			int size = 5;
			int dataCount = 0;

			map.put("productNum", productNum);

			dataCount = service.dataCount(map);
			int total_page = myUtil.pageCount(dataCount, size);
			if (current_page > total_page) {
				current_page = total_page;
			}

			int offset = (current_page - 1) * size;
			if (offset < 0) offset = 0;

			map.put("offset", offset);
			map.put("size", size);
			
			List<Question> list = service.listQuestion(map);
			for (Question dto : list) {
				//비공개로 작성했으면서 멤버십이 50미만면서 작성한 글 유저가 아니라면
				if (dto.getSecret() == 0 && (info == null || (info.getMembership() < 50 && !dto.getUserId().equals(info.getUserId()))))  {
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
	
	//마이페이지 상품문의 섹션 
	@GetMapping("list2")
	public Map<String, Object> list2(@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		Map<String, Object> model = new HashMap<String, Object>();

		try {
			Map<String, Object> map = new HashMap<String, Object>();
		
			int size = 5;
			int dataCount = 0;
			
			map.put("memberIdx", info.getMemberIdx());

			dataCount = service.dataCount2(map);
			int total_page = myUtil.pageCount(dataCount, size);
			if (current_page > total_page) {
				current_page = total_page;
			}

			int offset = (current_page - 1) * size;
			if (offset < 0) offset = 0;

			map.put("offset", offset);
			map.put("size", size);

			List<Question> list = service.listQuestion2(map);

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