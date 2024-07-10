package com.sgsg.dra.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sgsg.dra.domain.Product;
import com.sgsg.dra.mapper.ProductMapper;

@Service
public class ProductServiceImpl implements ProductService  {
    @Autowired
    private ProductMapper mapper;

    @Override
    public List<Product> listProduct() {
    	List<Product> list = null;
    	try {
			list=mapper.listProduct();
		} catch (Exception e) {
			e.printStackTrace();
		}
        return list;
    }

	@Override
	public Product findById(long productNum) {
		Product dto = null;
		try {
			dto=mapper.findById(productNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		 return dto;

	}
	@Override
	public List<Product> listProductFile(long productNum) {
		List<Product> list = null;
		try {
			list=mapper.listCategory();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<Product> listProductOption(long productNum) {
		List<Product>list = null;
		try {
			list=mapper.listProductOption(productNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	@Override
	public List<Product> selectCategoryList() {
		List<Product> list = null;	
		try {
			list=mapper.selectCategoryList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public List<Product> listProduct(Map<String, Object> map) {
		
		return null;
	}
	
	@Override
	public List<Product> listAllCategory() {
		List<Product> list = null;
		try {
			list=mapper.listAllCategory();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<Product> listSubCategory(long parentNum) {
		List<Product> list = null;
		try {
			list=mapper.listSubCategory(parentNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<Product> listOptionDetail(long optionNum) {
		List<Product> list = null;
		try {
			list=mapper.listOptionDetail(optionNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<Product> listOptionDetailStock(Map<String, Object> map) {
		List<Product> list = null;
		try {
			list=mapper.listOptionDetailStock(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Product> listCategory() {
		List<Product> list = null;
		try {
			list=mapper.listAllCategory();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public void processOptionStock(List<Product> optionList, List<Product> stockList, boolean isSecondOption) {
		   if (optionList == null || stockList == null) return;
		    
	        for (Product option : optionList) {
	            for (Product stock : stockList) {
	                if (!isSecondOption) {
	                    if (option.getDetailNum() != 0 && option.getDetailNum() == stock.getDetailNum()) {
	                        option.setStockNum(stock.getStockNum());
	                        option.setTotalStock(stock.getTotalStock());
	                        break;
	                    }
	                } else {
	                    if (option.getDetailNum2() != 0 && option.getDetailNum2() == stock.getDetailNum2()) {
	                        option.setStockNum(stock.getStockNum());
	                        option.setTotalStock(stock.getTotalStock());
	                        break;
	                    }
	                }
	            }
	        }
	    }

	@Override
	public List<Product> getDistinctOptionDetails(Long optionNum) {
	    List<Product> options = mapper.listOptionDetail(optionNum);
	    List<Product> distinctOptions = new ArrayList<>();
	    Set<String> uniqueOptionValues = new HashSet<>();

	    for (Product option : options) {
	        if (uniqueOptionValues.add(option.getOptionValue())) {
	            distinctOptions.add(option);
	        }
	    }

	    return distinctOptions;
	}

	@Override
	public List<Product> getSecondOptionDetails(Long productNum, Long detailNum) {
	    Map<String, Object> map = new HashMap<>();
	    map.put("productNum", productNum);
	    map.put("detailNum", detailNum);
	    return mapper.listOptionDetailStock(map);
	}
	}