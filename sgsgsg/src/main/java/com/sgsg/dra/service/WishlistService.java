package com.sgsg.dra.service;

import java.util.List;
import java.util.Map;

import com.sgsg.dra.domain.Wishlist;

public interface WishlistService {
    
    public void addToWishlist(Wishlist wishlist) throws Exception;
    
    public void removeFromWishlist(String userId, Long productNum) throws Exception;
    
    public List<Wishlist> listWishlist(String userId);
    
    public int getWishlistCount(String userId);
    
    public boolean isInWishlist(String userId, Long productNum);
    
    public int getProductWishlistCount(Long productNum);
    
    public Map<String, Object> toggleWishlist(String userId, Long productNum) throws Exception;
}