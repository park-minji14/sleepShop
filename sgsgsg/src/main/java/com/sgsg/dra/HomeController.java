package com.sgsg.dra;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.sgsg.dra.domain.Product;
import com.sgsg.dra.service.ProductServiceImpl;

@Controller
public class HomeController {
    
    @Autowired
    private ProductServiceImpl productService;
    
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Model model) {
        try {
            List<Product> categoryList = productService.selectCategoryList();
            model.addAttribute("categoryList", categoryList);

            List<Product> listProduct = productService.listProduct();
            model.addAttribute("list", listProduct);
            
        } catch (Exception e) {
        	e.printStackTrace();
        }
        
        return ".home";
    }
}