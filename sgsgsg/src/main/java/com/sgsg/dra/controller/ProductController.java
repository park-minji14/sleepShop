package com.sgsg.dra.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sgsg.dra.domain.Product;
import com.sgsg.dra.service.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {
    
    @Autowired
    private ProductService service;

    @RequestMapping("home")
    public String home(Model model) {
        // 필요한 상품 목록을 가져옵니다.
        List<Product> list = service.listProduct();
        model.addAttribute("list", list);
        return ".product.home";
    }


    @GetMapping("/details/{productNum}")
    public String productDetail(@PathVariable Long productNum, Model model) {
        try {
            Product dto = service.findById(productNum);
            if (dto == null) {
                return "redirect:/product/home";
            }
            List<Product> listFile = service.listProductFile(productNum);
            model.addAttribute("dto", dto);
            model.addAttribute("listFile", listFile);
            return ".product.details";
        } catch (Exception e) {
            // 로그 기록
            return "redirect:/error";
        }
    }
}