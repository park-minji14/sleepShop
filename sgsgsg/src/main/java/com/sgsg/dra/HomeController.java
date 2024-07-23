package com.sgsg.dra;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.sgsg.dra.domain.Product;
import com.sgsg.dra.service.ProductServiceImpl;
import com.sgsg.dra.service.SpecialsService;
import com.sgsg.dra.domain.SpecialsProduct;

@Controller
public class HomeController {
    @Autowired
    private ProductServiceImpl productService;
    
    @Autowired
    private SpecialsService specialsService;
    
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Model model) {
        try {
            List<Product> categoryList = productService.selectCategoryList();
            model.addAttribute("categoryList", categoryList);
            
            List<Product> listProduct = productService.listProduct();
            model.addAttribute("list", listProduct);
            
            // Special 상품 리스트 가져오기
            Map<String, Object> map = new HashMap<>();
            
            map.put("size", 3); // 표시할 특가 상품의 개수
            
            List<SpecialsProduct> specialList = specialsService.listSpecialProducts(map);
            model.addAttribute("specialList", specialList);
            
            // 특가 종료 시간 가져오기
            String specialEndTime = specialsService.getSpecialEndTime();
            model.addAttribute("specialEndTime", specialEndTime);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return ".home";
    }
}