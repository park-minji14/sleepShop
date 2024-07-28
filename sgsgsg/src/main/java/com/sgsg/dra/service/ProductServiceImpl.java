package com.sgsg.dra.service;


import java.util.ArrayList;
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
    public Map<String, List<Product>> listProduct() {
        Map<String, List<Product>> categorizedProducts = new HashMap<>();
        List<Product> recommendedProducts = new ArrayList<>();
        List<Product> regularProducts = new ArrayList<>();

        try {
            List<Product> allProducts = mapper.listProduct();
            if (allProducts != null) {
                for (Product product : allProducts) {
                    // 할인된 가격 계산
                    double discountedPrice = product.getPrice() * (1 - product.getDiscountRate() / 100.0);
                    // 백원 단위로 반올림
                    long roundedPrice = Math.round(discountedPrice / 100.0) * 100;
                    product.setSalePrice(roundedPrice);

                    // 제품 번호로 상세 정보를 조회
                    Product detailedProduct = findById(product.getProductNum());
                    if (detailedProduct != null) {
                        // 상세 정보에서 리뷰 수와 평균 점수를 가져와 설정
                        product.setReviewCount(detailedProduct.getReviewCount());
                        product.setScore(detailedProduct.getScore());
                    }

                    // 상품 분류에 따라 리스트에 추가
                    if (product.getClassify() == 2) { // 추천 상품
                        recommendedProducts.add(product);
                    } else { // 일반 상품
                        regularProducts.add(product);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        categorizedProducts.put("recommended", recommendedProducts);
        categorizedProducts.put("regular", regularProducts);

        return categorizedProducts;
    }
    @Override
    public Product findById(long productNum) {
        Product dto = null;
        try {
            dto = mapper.findById(productNum);
            if (dto != null) {
                double discountedPrice = dto.getPrice() * (1 - dto.getDiscountRate() / 100.0);
                // 백원 단위로 반올림
                long roundedPrice = Math.round(discountedPrice / 100.0) * 100;
                dto.setSalePrice(roundedPrice);
            }
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
            if (list != null) {
                for (Product product : list) {
                    // 할인된 가격 계산
                    double discountedPrice = product.getPrice() * (1 - product.getDiscountRate() / 100.0);
                    // 백원 단위로 반올림
                    long roundedPrice = Math.round(discountedPrice / 100.0) * 100;
                    product.setSalePrice(roundedPrice);

                    // 제품 번호로 상세 정보를 조회
                    Product detailedProduct = findById(product.getProductNum());
                    if (detailedProduct != null) {
                        // 상세 정보에서 리뷰 수와 평균 점수를 가져와 설정
                        product.setReviewCount(detailedProduct.getReviewCount());
                        product.setScore(detailedProduct.getScore());
                    }
                }
            }
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
            if (products != null) {
                for (Product product : products) {
                    // 할인된 가격 계산
                    double discountedPrice = product.getPrice() * (1 - product.getDiscountRate() / 100.0);
                    // 백원 단위로 반올림
                    long roundedPrice = Math.round(discountedPrice / 100.0) * 100;
                    product.setSalePrice(roundedPrice);

                    // 제품 번호로 상세 정보를 조회
                    Product detailedProduct = findById(product.getProductNum());
                    if (detailedProduct != null) {
                        // 상세 정보에서 리뷰 수와 평균 점수를 가져와 설정
                        product.setReviewCount(detailedProduct.getReviewCount());
                        product.setScore(detailedProduct.getScore());
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }
    
    
    @Override
    public List<Product> listLatestProducts(int limit) {
        List<Product> list = null;
        try {
            Map<String, Object> map = new HashMap<>();
            map.put("limit", limit);
            list = mapper.listLatestProducts(map);
            
            if (list != null) {
                for (Product product : list) {
                    // 할인된 가격 계산
                    double discountedPrice = product.getPrice() * (1 - product.getDiscountRate() / 100.0);
                    // 백원 단위로 반올림
                    long roundedPrice = Math.round(discountedPrice / 100.0) * 100;
                    product.setSalePrice(roundedPrice);

                    // 제품 번호로 상세 정보를 조회
                    Product detailedProduct = findById(product.getProductNum());
                    if (detailedProduct != null) {
                        // 상세 정보에서 리뷰 수와 평균 점수를 가져와 설정
                        product.setReviewCount(detailedProduct.getReviewCount());
                        product.setScore(detailedProduct.getScore());
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}