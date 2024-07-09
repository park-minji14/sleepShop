package com.sgsg.dra.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @GetMapping("/details/{productNum}")
    public String productDetail(@PathVariable Long productNum, Model model) throws Exception {
        try {    
            Product dto = service.findById(productNum);
            if (dto == null) {
                return "redirect:/product/home";
            }
            
            // 이미지
            List<Product> listFile = service.listProductFile(productNum);
            // 옵션명 
            List<Product> listOption = service.listProductOption(productNum);
            
            // 첫 번째 옵션 상세 옵션 목록 조회
            List<Product> listOptionDetail = null;
            List<Product> listOptionDetail2 = null;
            if (listOption.size() > 0) {
                listOptionDetail = service.listOptionDetail(listOption.get(0).getOptionNum());
                System.out.println("listOptionDetail: " + listOptionDetail); // 디버그 출력
                if (listOption.size() > 1) {
                    listOptionDetail2 = service.listOptionDetail(listOption.get(1).getOptionNum());
                    System.out.println("listOptionDetail2: " + listOptionDetail2); // 디버그 출력
                }
            }
            
            // 재고 정보 
            Map<String, Object> map = new HashMap<>();
            List<Product> listStock = null;
           
            // 옵션이 2개 미만인 경우 
            if (dto.getOptionCount() < 2) {
                map.put("productNum", dto.getProductNum());
                listStock = service.listOptionDetailStock(map);
                
                if (dto.getOptionCount() == 0 && listStock.size() > 0) {
                    // 옵션이 없는 경우 재고 수량 설정
                    dto.setStockNum(listStock.get(0).getStockNum());
                    dto.setTotalStock(listStock.get(0).getTotalStock());
                } else if (dto.getOptionCount() > 0) {
                    // 옵션이 하나인 경우 각 옵션별 재고 수량 
                    for (Product vo : listOptionDetail) {
                        for (Product ps : listStock) {
                            if (vo.getDetailNum() == ps.getDetailNum()) {
                                vo.setStockNum(ps.getStockNum());
                                vo.setTotalStock(ps.getTotalStock());
                                break;
                            }
                        }
                    }
                }
            }
           
            model.addAttribute("dto", dto);
            model.addAttribute("listFile", listFile);
            model.addAttribute("listOption", listOption);
            model.addAttribute("listOptionDetail", listOptionDetail);
            model.addAttribute("listOptionDetail2", listOptionDetail2);
            
        } catch (Exception e) {
          e.printStackTrace();
        }
        return ".product.details";
    }
}