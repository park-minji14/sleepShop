package com.sgsg.dra.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
			list=mapper.listProductFile(productNum);
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
    public Product getCategoryById(long categoryNum) {
        Product category = null;
        try {
            category = mapper.getCategoryById(categoryNum);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return category;
    }

    @Override
    public List<Product> getProductsByCategory(long categoryNum) {
        List<Product> list = null;
        try {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("categoryNum", categoryNum);
            list = mapper.listProduct(map);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Product> searchProducts(Map<String, Object> map) {
        List<Product> list = null;
        try {
            list = mapper.searchProducts(map);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    @Override
    public int searchProductsCount(Map<String, Object> map) {
        int count = 0;
        try {
            count = mapper.searchProductsCount(map);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    @Override
    public Product getCategoryById(Long categoryNum) {
        Product category = null;
        try {
            category = mapper.getCategoryById(categoryNum);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return category;
    }

    @Override
    public List<Product> getProductsByCategory(Long categoryNum) {
        List<Product> products = null;
        try {
            products = mapper.getProductsByCategory(categoryNum);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }
}