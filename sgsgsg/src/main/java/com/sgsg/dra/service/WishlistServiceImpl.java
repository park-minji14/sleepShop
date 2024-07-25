package com.sgsg.dra.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sgsg.dra.domain.Wishlist;
import com.sgsg.dra.mapper.WishlistMapper;

@Service
public class WishlistServiceImpl implements WishlistService {
    
    @Autowired
    private WishlistMapper mapper;

    @Override
    public void addToWishlist(Wishlist wishlist) throws Exception {
        try {
            mapper.insertWishlist(wishlist);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }

    @Override
    public void removeFromWishlist(String userId, Long productNum) throws Exception {
        try {
        	Map<String, Object> map = new HashMap<String, Object>();
        	map.put("userId", userId);
        	map.put("productNum", productNum);
            mapper.deleteWishlist(map);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }

    @Override
    public List<Wishlist> listWishlist(String userId) {
        List<Wishlist> list = null;
        
        try {
            list = mapper.listWishlist(userId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }

    @Override
    public int getWishlistCount(String userId) {
        int result = 0;
        
        try {
            result = mapper.dataCountWishlist(userId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return result;
    }

    @Override
    public boolean isInWishlist(String userId, Long productNum) {
        boolean result = false;
        
        try {
            Map<String, Object> map = Map.of("userId", userId, "productNum", productNum);
            int count = mapper.isWishlistExist(map);
            result = count > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return result;
    }

    @Override
    public int getProductWishlistCount(Long productNum) {
        int result = 0;
        
        try {
            result = mapper.countWishlistByProduct(productNum);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return result;
    }

    
    @Override
    public Map<String, Object> toggleWishlist(String userId, Long productNum) throws Exception {
        Map<String, Object> result = new HashMap<>();
        
        try {
            boolean isInWishlist = isInWishlist(userId, productNum);
            if (isInWishlist) {
                removeFromWishlist(userId, productNum);
                result.put("isAdded", false);
            } else {
                Wishlist wishlist = new Wishlist();
                wishlist.setProductNum(productNum);
                wishlist.setUserId(userId);
                addToWishlist(wishlist);
                result.put("isAdded", true);
            }
            result.put("state", "true");
        } catch (Exception e) {
            result.put("state", "false");
            result.put("message", e.getMessage());
        }
        
        return result;
    }
}