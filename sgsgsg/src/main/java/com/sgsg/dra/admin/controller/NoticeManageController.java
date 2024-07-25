package com.sgsg.dra.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sgsg.dra.admin.domain.NoticeManage;
import com.sgsg.dra.admin.service.NoticeManageService;
import com.sgsg.dra.common.MyUtil;
import com.sgsg.dra.domain.SessionInfo;

@Controller
@RequestMapping("adminManagement/noticeManage/*")
public class NoticeManageController {
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private NoticeManageService service;
	
	@GetMapping("main")
	public String main(
			@RequestParam(value = "state", defaultValue = "0") int state,
			Model model) {
		
		model.addAttribute("state", state);
		
		return ".adminLeft.notice.noticeList";
	}
	
	// AJAX - JSON
	@PostMapping("noticeInsert")
	@ResponseBody
	public Map<String, Object> noticeInsert(
			NoticeManage dto,
			HttpSession session) throws Exception{
		String state = "true";
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		try {
			dto.setUserid(info.getUserId());
			dto.setUserNickname(info.getUserName());
			dto.setContent(dto.getContent().replaceAll("(\r\n|\n|\r)", "<br>"));
			//System.out.println(dto.getContent());
			service.insertNotice(dto);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}
	
	// AJAX - JSON
	@GetMapping("noticeList")
	@ResponseBody
	public Map<String, Object> noticeList(
			@RequestParam(value = "state", defaultValue = "0") int state,
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page) throws Exception {
		
		int size = 10;
		int total_page;
		int dataCount;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("state", state);
		
		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		if(current_page > total_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) {
			offset = 0;
		}
		map.put("offset", offset);
		map.put("size", size);
		
		List<NoticeManage> list = service.listNotice(map);
		
		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("list", list);
		model.put("dataCount", dataCount);
		model.put("page", current_page);
		model.put("total_page", total_page);
		model.put("size", size);
		model.put("paging", paging);
		
		return model;
	}
	
	// AJAX - JSON
	@GetMapping("noticeView")
    @ResponseBody
    public Map<String, Object> noticeView(
    		@RequestParam("num") int num) throws Exception {
        NoticeManage dto = service.findById(num);
        
        Map<String, Object> model = new HashMap<String, Object>();
        if (dto != null) {
            model.put("title", dto.getTitle());
            model.put("userNickname", dto.getUserNickname());
            model.put("created_date", dto.getCreated_date());
            model.put("updated_date", dto.getUpdated_date() != null ? dto.getUpdated_date() : "");
            model.put("status", dto.getStatus());
            
            String content = dto.getContent().replaceAll("(\r\n|\n|\r)", "<br>");
            model.put("content", content);
        }
        
        return model;
    }
	
	// AJAX - JSON
    @PostMapping("noticeUpdate")
    @ResponseBody
    public Map<String, Object> noticeUpdate(NoticeManage dto) throws Exception {
        String state = "true";
        try {
            service.updateNotice(dto);
        } catch (Exception e) {
            state = "false";
        }
        
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("state", state);
        return model;
    }
    
    // AJAX - JSON
    @PostMapping("noticeDelete")
    @ResponseBody
    public Map<String, Object> noticeDelete(@RequestParam int num) throws Exception {
        String state = "true";
        try {
            service.deleteNotice(num);
        } catch (Exception e) {
            state = "false";
        }
        
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("state", state);
        return model;
    }
    
    // AJAX - JSON
    @GetMapping("noticeSearch")
    @ResponseBody
    public Map<String, Object> noticeSearch(
            @RequestParam(value = "state", defaultValue = "0") int state,
            @RequestParam(value = "pageNo", defaultValue = "1") int current_page,
            @RequestParam(value = "keyword", required = false) String keyword,
            @RequestParam(value = "searchType", defaultValue = "all") String searchType) throws Exception {

        int size = 10;
        int total_page;
        int dataCount;
        //System.out.println("Received Search Parameters - State: " + state + ", Page: " + current_page + ", Search Type: " + searchType + ", Keyword: " + keyword);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("state", state);
        map.put("keyword", keyword);
        map.put("searchType", searchType);

        dataCount = service.dataCount(map);
        total_page = myUtil.pageCount(dataCount, size);
        if (current_page > total_page) {
            current_page = total_page;
        }

        int offset = (current_page - 1) * size;
        if (offset < 0) {
            offset = 0;
        }
        map.put("offset", offset);
        map.put("size", size);

        List<NoticeManage> list = service.listNotice(map);

        String paging = myUtil.pagingMethod(current_page, total_page, "listPage");

        Map<String, Object> model = new HashMap<String, Object>();
        model.put("list", list);
        model.put("dataCount", dataCount);
        model.put("page", current_page);
        model.put("total_page", total_page);
        model.put("size", size);
        model.put("paging", paging);

        return model;
    }

}
