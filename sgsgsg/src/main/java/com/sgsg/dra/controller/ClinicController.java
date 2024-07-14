package com.sgsg.dra.controller;

import java.io.File;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sgsg.dra.common.FileManager;
import com.sgsg.dra.common.MyUtil;
import com.sgsg.dra.domain.Clinic;
import com.sgsg.dra.domain.ClinicAnswer;
import com.sgsg.dra.service.ClinicService;
import com.sgsg.dra.domain.SessionInfo;

@Controller
@RequestMapping("/clinic/*")
public class ClinicController {
	@Autowired
	private ClinicService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private FileManager fileManager;
	
	// 질문 리스트
	@RequestMapping("list")
	public String list(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			@RequestParam(defaultValue = "all") String category,
			HttpServletRequest req,
			Model model) throws Exception {
		
		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equals("GET")) {
			kwd = URLDecoder.decode(kwd, "utf-8");
		}
		
		// 데이터 개수 / 전체 페이지수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd", kwd);
		map.put("category", category);
				
		dataCount = service.dataCount(map);
		if(dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		// 리스트
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		map.put("offset", offset);
		map.put("size", size);
				
		List<Clinic> list = service.listClinic(map);
				
		String query = "";
		String cp = req.getContextPath();
		String listUrl;
		String articleUrl;
		if(kwd.length() != 0) {
			query = "schType=" + schType + "&kwd=" +
					URLEncoder.encode(kwd, "utf-8");
		}
		
		listUrl = cp + "/clinic/list";
		articleUrl = cp + "/clinic/article?page=" + current_page;
		if(query.length() != 0) {
			listUrl += "?" + query;
			articleUrl += "&" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		// 포워딩할 JSP에 전달할 모델
		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		model.addAttribute("category", category);
		model.addAttribute("paging", paging);
		
		
		return ".clinic.list";
	}
	
	/*
	// AJAX-JSON
	@GetMapping("listCategory")
	@ResponseBody
	public Map<String, Object> listCategory() throws Exception {

		List<Clinic> listCategory = service.listClinicCategory();

		Map<String, Object> model = new HashMap<>();
		model.put("listCategory", listCategory);
		return model;
	}
	*/
	
	
	@GetMapping("write")
	public String writeForm(Model model) throws Exception {
		List<Clinic> listCategory = service.listClinicCategory();
	    model.addAttribute("listCategory", listCategory);
	    model.addAttribute("mode", "write");
	    return ".clinic.write";    
	}
	
	@PostMapping("write")
	public String writeSubmit(Clinic dto, HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "clinic";
		
		try {
			dto.setUserId(info.getUserId());
			
			service.insertClinic(dto, pathname);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/clinic/list";	
	}
	
	
	// 질문글 보기
	@GetMapping("article")
	public String article(@RequestParam long num,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpSession session,
			Model model) throws Exception {
		
		kwd = URLDecoder.decode(kwd, "utf-8");
		
		String query = "page=" + page;
		if(kwd.length() != 0) {
			query += "&schType=" + schType + 
					"&kwd=" + URLEncoder.encode(kwd, "utf-8");
		}
		
		Clinic dto = service.findById(num);
		if(dto == null) {
			return "redirect:/clinic/list?" + query;
		}
		
		dto.setUserName(myUtil.nameMasking(dto.getUserName()));
		// dto.setContent(myUtil.htmlSymbols(dto.getContent())); // 스마트에디터 사용하므로
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd", kwd);
		map.put("question_id", num);
		
		Clinic prevDto = service.findByPrev(map);
		Clinic nextDto = service.findByNext(map);
		
	
		model.addAttribute("dto", dto);
		model.addAttribute("prevDto", prevDto);
		model.addAttribute("nextDto", nextDto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		
		return ".clinic.article";
		
	}
	
	
	// 질문글 수정
	@GetMapping("update")
	public String updateForm(@RequestParam("num") long num,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		Clinic dto = service.findById(num);
		if(dto==null || !info.getUserId().equals(dto.getUserId())) {
			return "redirect:/clinic/list?page="+page;
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		
		return ".clinic.write";
	}
	
	
	@PostMapping("update")
	public String updateSubmit(Clinic dto,
			@RequestParam String page,
			HttpSession session) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "clinic";
		
		try {
			service.updateClinic(dto, pathname);
		} catch (Exception e) {
		}
		
		return "redirect:/clinic/list?page="+page;
	}
	
	
	@GetMapping("deleteFile")
	public String deleteFile(@RequestParam long num,
			@RequestParam String page,
			HttpSession session) throws Exception {
		// 수정에서 파일삭제
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "clinic";
		
		Clinic dto = service.findById(num);
		
		if(dto==null|| !dto.getUserId().equals(info.getUserId())) {
			return "redirect:/clinic/list?page="+page;
		}
		
		try {
			if(dto.getSaveFilename() != null) {
				// 실제 파일 삭제
				fileManager.doFileDelete(dto.getSaveFilename(), pathname);

				// 테이블 정보 변경
				dto.setSaveFilename("");
				dto.setOriginalFilename("");
				service.updateClinic(dto, pathname);
			}
		} catch (Exception e) {
		}
		
		return "redirect:/clinic/update?num="+num+"&page="+page;
	}
	
	
	// 질문글 삭제
	@GetMapping("delete")
	public String delete(@RequestParam long num,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		kwd = URLDecoder.decode(kwd, "utf-8");
		String query = "page=" + page;
		if(kwd.length() != 0) {
			query += "&schType="+schType+
					"&kwd="+URLEncoder.encode(kwd, "utf-8");
		}
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "clinic";

		service.deleteClinic(num, pathname, info.getUserId(), 
				info.getMembership());
		
		return "redirect:/clinic/list?" + query;
	}
	
	
	// 질문글 파일 다운로드
	@GetMapping("download")
	public String download(@RequestParam long num,
			HttpServletRequest req,
			HttpServletResponse resp,
			HttpSession session) throws Exception {

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "clinic";
		
		Clinic dto = service.findById(num);
		
		if(dto != null) {
			boolean b = fileManager.doFileDownload(dto.getSaveFilename(),
					dto.getOriginalFilename(), pathname, resp);
			if(b) {
				/*
				 - 리턴 타입이 void 이거나 null 을 반환하는 메소드에서
				   메소드의 인수에
				   HttpServletResponse, OutputStream 나
				   @ResponseStatus 주석이 있는 경우
				   응답을 완전히 처리 한것으로 간주
				 */
				return null;
			}
		}
		
		return ".error.filedownloadFailure";
	}
	
	
	
	
	// 답변 작성 폼
	@GetMapping("writeanswer")
	public String writeanswerForm(@RequestParam long num, 
	                              @RequestParam String page, 
	                              HttpSession session, 
	                              Model model) throws Exception {
	    // 로그인 사용자 정보
	    SessionInfo info = (SessionInfo)session.getAttribute("member");
	    if (info == null) {
	        return "redirect:/member/login";
	    }

	    // 질문 정보 가져오기
	    Clinic dto = service.findById(num);
	    if (dto == null) {
	        return "redirect:/clinic/list?page=" + page;
	    }

	    model.addAttribute("dto", dto);
	    model.addAttribute("page", page);
	    model.addAttribute("mode", "writeanswer");
	    return ".clinic.writeanswer";
	}

	// 답변 작성 처리
	@PostMapping("writeanswer")
	public String insertClinicAnswerSubmit(ClinicAnswer dto, 
	                                @RequestParam String page, 
	                                HttpSession session) throws Exception {
	    SessionInfo info = (SessionInfo)session.getAttribute("member");
	    if (info == null) {
	        return "redirect:/member/login";
	    }
	    
	    dto.setUserId(info.getUserId());

	    try {
	        service.insertClinicAnswer(dto);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return "redirect:/clinic/article?num=" + dto.getQuestion_id() + "&page=" + page;
	}

	
	
	


	// 답변 리스트
	@GetMapping("listanswer")
	public String listClinicAnswer(@RequestParam long num,
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			HttpSession session,
			Model model) throws Exception {
		
		
		int size = 5;
		int total_page = 0;
		int dataCount = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("question_id", num);
		
		dataCount = service.ClinicAnswerCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		if (current_page > total_page) {
			current_page = total_page;
		}
		
		int offset = (current_page-1)*size;
		if (offset < 0) offset = 0;
		map.put("offset", offset);
		map.put("size", size);
		
		List<ClinicAnswer> list = service.listClinicAnswer(map);
		
		// AJAX용 페이징
		String paging = myUtil.pagingMethod(current_page, total_page, "listpage");
		
		// 포워딩할 JSP로 넘길 모델(데이터)
		model.addAttribute("listanswer", list);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("answerCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("question_id", num);
		
		// ".clinic.listReply" 로 반환하면 안됨(메뉴가 생성됨)
		return "clinic/listanswer";
	}
	
	
	
	// 답변 삭제 : POST 방식
	@PostMapping("deleteAnswer")
	public String deleteAnswer(@RequestParam long answer_num,
	                           @RequestParam long question_id,
	                           @RequestParam String page,
	                           HttpSession session) throws Exception {
	    SessionInfo info = (SessionInfo) session.getAttribute("member");

	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("answer_num", answer_num);
	    paramMap.put("userId", info.getUserId());

	    service.deleteClinicAnswer(paramMap);

	    return "redirect:/clinic/article?num=" + question_id + "&page=" + page;
	}
		
	
	
	@PostMapping("likeAnswer")
	public String insertClinicAnswerComment(@RequestParam long answer_num,
	                                        @RequestParam long question_id,
	                                        @RequestParam String content2,
	                                        @RequestParam String page) throws Exception {
	    ClinicAnswer dto = new ClinicAnswer();
	    dto.setAnswer_num(answer_num);
	    dto.setQuestion_id(question_id);
	    dto.setContent2(content2);
	    dto.setPickup(1);

	    service.insertClinicAnswerComment(dto);

	    return "redirect:/clinic/article?num=" + question_id + "&page=" + page;
	}
	

	
	
	
	 @GetMapping("listanswercomment")
	    public String listClinicAnswerComment(@RequestParam long num,
	                                   @RequestParam(value = "pageNo", defaultValue = "1") int current_page,
	                                   HttpSession session,
	                                   Model model) throws Exception {
	        int size = 5;
	        int total_page = 0;
	        int dataCount = 0;

	        Map<String, Object> map = new HashMap<>();
	        map.put("question_id", num);

	        dataCount = service.ClinicAnswerCount(map);
	        total_page = myUtil.pageCount(dataCount, size);
	        if (current_page > total_page) {
	            current_page = total_page;
	        }

	        int offset = (current_page - 1) * size;
	        if (offset < 0) offset = 0;
	        map.put("offset", offset);
	        map.put("size", size);

	        List<ClinicAnswer> list = service.listClinicAnswer(map);
	        ClinicAnswer likedAnswer = service.findLikedAnswer(num);
	        for (ClinicAnswer answer : list) {
	            if (likedAnswer != null && likedAnswer.getAnswer_num() == answer.getAnswer_num()) {
	                answer.setPickup(1);
	                answer.setContent2(likedAnswer.getContent2());
	            }
	        }

	        // AJAX용 페이징
	        String paging = myUtil.pagingMethod(current_page, total_page, "listpage");

	        // 포워딩할 JSP로 넘길 모델(데이터)
	        model.addAttribute("listanswercomment", list);
	        model.addAttribute("pageNo", current_page);
	        model.addAttribute("answerCount", dataCount);
	        model.addAttribute("total_page", total_page);
	        model.addAttribute("paging", paging);
	        model.addAttribute("question_id", num);

	        // ".clinic.listReply" 로 반환하면 안됨(메뉴가 생성됨)
	        return "clinic/listanswercomment";
	    }
}
	
	

	
	
	
	
	/*
	// 답변의 코멘트(채택)
	@GetMapping("listClinicAnswerComment")
	public String listClinicAnswerComment(
			@RequestParam Map<String, Object> paramMap,
			HttpSession session,
			Model model) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		paramMap.put("membership", info.getMembership());
		paramMap.put("userId", info.getUserId());
		
		List<ClinicAnswer> list = service.listClinicAnswerComment(paramMap);
		
		model.addAttribute("listClinicAnswerComment", list);
		
		return "clinic/listClinicAnswerComment";
	}
}
	
	
	/*
	// 채택 코멘트 등록
	@PostMapping("insertClinicAnswerComment")
	@ResponseBody
	public Map<String, Object> insertClinicAnswerComment(
	        @RequestParam Map<String, Object> paramMap,
	        HttpSession session) throws Exception {
	    String state = "true";
	    SessionInfo info = (SessionInfo)session.getAttribute("member");

	    try {
	        paramMap.put("userId", info.getUserId());
	        service.insertClinicAnswerComment(paramMap);
	    } catch (Exception e) {
	        state = "false";
	    }

	    Map<String, Object> model = new HashMap<String, Object>();
	    model.put("state", state);
	    return model;
	}
	
	
	/*
	// 답변의 코멘트 개수
	@PostMapping("countClinicAnswerComment")
	@ResponseBody
	public Map<String, Object> countClinicAnswerComment (
			@RequestParam Map<String, Object> paramMap,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		paramMap.put("membership", info.getMembership());
		paramMap.put("userId", info.getUserId());
		
		int count = service.ClinicAnswerCommentCount(paramMap);
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("count", count);
		return model;
				
	}
	
	
	// 답변의 좋아요
	@PostMapping("insertClinicAnswerLike")
	@ResponseBody
	public Map<String, Object> insertClinicAnswerLike(
			@RequestParam Map<String, Object> paramMap,
			HttpSession session) throws Exception {
		String state = "true";
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		try {
			paramMap.put("userId", info.getUserId());
			service.insertClinicAnswerLike(paramMap);
		} catch (DuplicateKeyException e) {
			state = "liked";
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> countMap = service.ClinicAnswerLikeCount(paramMap);
		
		// 마이바티스에서 resultType이 map인 경우 int는 BigDecimal로 넘어옴
		int likeCount = ((BigDecimal)countMap.get("LIKECOUNT")).intValue();
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		model.put("likeCount", likeCount);
		
		return model;
		
	}
	
	
	
	// 댓글 좋아요/싫어요 개수
	@PostMapping("countClinicAnswerLike")
	@ResponseBody
	public Map<String, Object> countClinicAnswerLike(
			@RequestParam Map<String, Object> paramMap,
			HttpSession session) throws Exception {
		
		Map<String, Object> countMap = service.ClinicAnswerLikeCount(paramMap);
		
		// 마이바티스에서 resultType이 map인 경우 int는 BigDecimal로 넘어옴
		int likeCount = ((BigDecimal)countMap.get("LIKECOUNT")).intValue();
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("likeCount", likeCount);
		
		return model;
	}
	*/
	
	


