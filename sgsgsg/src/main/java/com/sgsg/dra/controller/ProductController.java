package com.sgsg.dra.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.sgsg.dra.common.MyUtil;
import com.sgsg.dra.domain.Product;
import com.sgsg.dra.service.ProductService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    private ProductService service;
    
	@Autowired
	private MyUtil myUtil;
    
    @GetMapping("listAllCategory")
	@ResponseBody
	public Map<String, Object> listAllCategory() {
		Map<String, Object> model = new HashMap<String, Object>();
		
		List<Product> listMain = service.listCategory();
		List<Product> listAll = service.listAllCategory();
		
		model.put("listMain", listMain);
		model.put("listAll", listAll);
		
		return model;
	}
    
    @GetMapping("listCategory")
	@ResponseBody
	public List<Product> listCategory() {
		List<Product> list = service.listCategory();
		return list;
	}

	@GetMapping("listSubCategory")
	@ResponseBody
	public List<Product> listSubCategory(@RequestParam long parentNum) {
		List<Product> list = service.listSubCategory(parentNum);
		return list;
	}
	
	@GetMapping("listOptionDetail2")
	@ResponseBody
	public List<Product> listOptionDetail2(@RequestParam long optionNum,
			@RequestParam long optionNum2, @RequestParam long detailNum) {
		List<Product> list = service.listOptionDetail(optionNum2);
		return list;
	}
	
	@GetMapping("listOptionDetailStock")
	@ResponseBody
	public List<Product> listOptionDetailStock(@RequestParam Map<String, Object> map) {
		List<Product> list = service.listOptionDetailStock(map);
		
		return list;
	}


    @GetMapping("/details/{productNum}")
    public String productDetail(@PathVariable Long productNum, Model model) throws Exception {
    	try {    
            Product dto = service.findById(productNum);
            if (dto == null) {
                return "redirect:/home";
            }
            
            List<Product> listFile = service.listProductFile(productNum);
           
            List<Product> listOption = service.listProductOption(productNum);
            
            
            List<Product>listOptionDetail=null;
            if(listOption.size()>0) {
            	listOptionDetail=service.listOptionDetail(listOption.get(0).getOptionNum());
            }
      
         
            Map<String, Object> map = new HashMap<String, Object>();
            List<Product> listStock=null;
            if(dto.getOptionCount()<2) {
            	map.put("productNum", dto.getProductNum());
            	listStock=service.listOptionDetailStock(map);
            	
            	if(dto.getOptionCount()==0&&listStock.size()>0) {
            		dto.setStockNum(listStock.get(0).getSpecialNum());
            		dto.setTotalStock(listStock.get(0).getTotalStock());
            	}else if(dto.getOptionCount()>0) {
            		for(Product vo :listOptionDetail) {
            			for(Product ps : listStock) {
            				if(vo.getDetailNum()==ps.getDetailNum()) {
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
            
            System.out.println(model.addAttribute( listOptionDetail));
            
        } catch (Exception e) {
            e.printStackTrace();
           
        }
        return ".product.details";
    }

    @GetMapping("/category/{categoryNum}")
    public String categoryView(@PathVariable Long categoryNum, 
                               @RequestParam(required = false) Long subCategoryNum,
                               Model model) {
        // 현재 카테고리 정보 가져오기
        Product category = service.getCategoryById(categoryNum);
        
        // 메인 카테고리 목록 가져오기
        List<Product> mainCategories = service.selectCategoryList();
        
        // 서브 카테고리 목록 가져오기
        List<Product> subCategories = service.listSubCategory(categoryNum);
        
        // 해당 카테고리의 상품 목록 가져오기 (서브 카테고리가 선택된 경우 해당 상품만)
        List<Product> products;
        if (subCategoryNum != null) {
            products = service.getProductsByCategory(subCategoryNum);
        } else {
            products = service.getProductsByCategory(categoryNum);
        }
        
        model.addAttribute("category", category);
        model.addAttribute("mainCategories", mainCategories);
        model.addAttribute("subCategories", subCategories);
        model.addAttribute("subCategoryNum", subCategoryNum);
        model.addAttribute("products", products);
        
        return ".product.category";
    }
    
    @GetMapping("/search")
    public String searchProducts(
            @RequestParam String searchTerm,
            @RequestParam(value = "pageNo", defaultValue = "1") int current_page,
            Model model) {
        
        try {
            Map<String, Object> map = new HashMap<String, Object>();
            int size = 10;  // 페이지당 표시할 상품 수
            
            map.put("searchTerm", searchTerm.trim());
            
            int dataCount = service.searchProductsCount(map);
            
            int total_page = myUtil.pageCount(dataCount, size);
            if (current_page > total_page) {
                current_page = total_page;
            }
            
            int offset = (current_page - 1) * size;
            if (offset < 0) offset = 0;
            
            map.put("offset", offset);
            map.put("size", size);
            
            List<Product> list = service.searchProducts(map);
            
            String paging = myUtil.pagingFunc(current_page, total_page, "searchProducts");
            
            model.addAttribute("list", list);
            model.addAttribute("dataCount", dataCount);
            model.addAttribute("size", size);
            model.addAttribute("pageNo", current_page);
            model.addAttribute("paging", paging);
            model.addAttribute("total_page", total_page);
            model.addAttribute("searchTerm", searchTerm);
            
        } catch (Exception e) {
            e.printStackTrace();
            // 에러 처리 로직 추가
        }
        
        return ".product.searchResults";
    }
}