package com.sgsg.dra.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sgsg.dra.domain.Specials;
import com.sgsg.dra.domain.SpecialsProduct;
import com.sgsg.dra.mapper.SpecialsMapper;



@Service
public class SpecialsServiceImpl implements SpecialsService {

    @Autowired
    private SpecialsMapper mapper;

    @Override
    public int dataCountSpecials(Map<String, Object> map) {
        int result = 0;
        
        try {
            result = mapper.dataCountSpecials(map);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return result;
    }

    @Override
    public List<Specials> listSpecials(Map<String, Object> map) {
        List<Specials> list = null;
        
        try {
            list = mapper.listSpecials(map);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public Specials findById(long num) {
        Specials dto = null;
        
        try {
            dto = mapper.findById(num);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dto;
    }

    @Override
    public int dataCountProduct(Map<String, Object> map) {
        int result = 0;
        
        try {
            result = mapper.dataCountProduct(map);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return result;
    }

    @Override
    public List<SpecialsProduct> listProduct(Map<String, Object> map) {
        List<SpecialsProduct> list = null;
        
        try {
            list = mapper.listProduct(map);
            int discountPrice;
            for(SpecialsProduct dto : list) {
                discountPrice = 0;
                if(dto.getDiscountRate() > 0) {
                    discountPrice = (int)(dto.getPrice() * (dto.getDiscountRate()/100.0));
                }
                
                dto.setSalePrice(dto.getPrice() - discountPrice);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public String getSpecialEndTime() {
        String endTime = null;
        try {
            endTime = mapper.getSpecialEndTime();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return endTime;
    }

    @Override
    public List<SpecialsProduct> listSpecialProducts(Map<String, Object> map) {
        List<SpecialsProduct> list = null;
        try {
            list = mapper.listSpecialProducts(map);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
