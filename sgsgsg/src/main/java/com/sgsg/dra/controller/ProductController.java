package com.sgsg.dra.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.sgsg.dra.domain.Product;
import com.sgsg.dra.service.ProductService;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/product/*")
public class ProductController {

    @Autowired
    private ProductService productService;

    @GetMapping("/details/{productNum}")
    public String productDetail(@PathVariable Long productNum, Model model) throws Exception {
        
    	try {    
            Product dto = productService.findById(productNum);
            if (dto == null) {
                return "redirect:/home";
            }
            
            List<Product> listFile = productService.listProductFile(productNum);
            List<Product> listOption = productService.listProductOption(productNum);
            
            List<Product> listOptionDetail = null;
            List<Product> listOptionDetail2 = null;
           
            
            if (listOption != null && !listOption.isEmpty()) {
                listOptionDetail = productService.getDistinctOptionDetails(listOption.get(0).getOptionNum());
                if (listOption.size() > 1) {
                    listOptionDetail2 = productService.getDistinctOptionDetails(listOption.get(1).getOptionNum());
                }
            }
            
            Map<String, Object> map = new HashMap<>();
            map.put("productNum", productNum);
            List<Product> listStock = productService.listOptionDetailStock(map);
            
            if (dto.getOptionCount() == 0 && listStock != null && !listStock.isEmpty()) {
                dto.setStockNum(listStock.get(0).getStockNum());
                dto.setTotalStock(listStock.get(0).getTotalStock());
            } else if (dto.getOptionCount() >= 1) {
                productService.processOptionStock(listOptionDetail, listStock, false);
                if (dto.getOptionCount() >= 2) {
                    productService.processOptionStock(listOptionDetail2, listStock, true);
                }
            }
            
            System.out.println();
           
            model.addAttribute("dto", dto);
            model.addAttribute("listFile", listFile);
            model.addAttribute("listOption", listOption);
            model.addAttribute("listOptionDetail", listOptionDetail);
            model.addAttribute("listOptionDetail2", listOptionDetail2);
            model.addAttribute("listStock", listStock);
            
        
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "상품 정보를 불러오는 중 오류가 발생했습니다.");
        }
        return ".product.details";
    }

    @GetMapping("/getOptionDetails")
    @ResponseBody
    public List<Product> getOptionDetails(@RequestParam Long productNum, @RequestParam Long detailNum) {
        return productService.getSecondOptionDetails(productNum, detailNum);
    }
    
}