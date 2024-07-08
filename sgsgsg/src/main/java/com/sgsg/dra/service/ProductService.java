package com.sgsg.dra.service;

import java.util.List;
import com.sgsg.dra.domain.Product;

public interface ProductService {


    List<Product> listProduct();
    Product findById(Long productNum);
    List<Product> listProductFile(Long productNum);
    
    }

