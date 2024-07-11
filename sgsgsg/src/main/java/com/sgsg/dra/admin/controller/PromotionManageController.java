package com.sgsg.dra.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("adminManagement/promotionManage/*")
public class PromotionManageController {

	@RequestMapping("main")
	public String promotionManage() {

		return ".adminLeft.promotion.main";
	}

}
