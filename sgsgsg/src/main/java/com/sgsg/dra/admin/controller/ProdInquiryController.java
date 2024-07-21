package com.sgsg.dra.admin.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("adminManagement/supportManage/*")
public class ProdInquiryController {
	
	  @GetMapping("inquiryList")
	    public String inquiryList(Model model) {
	        try {
	              
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return ".adminLeft.support.inquiryList";
	    }
}
