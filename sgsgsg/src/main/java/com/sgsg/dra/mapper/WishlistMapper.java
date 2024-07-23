package com.sgsg.dra.mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import com.sgsg.dra.domain.Wishlist;

@Mapper
public interface WishlistMapper {
    
    // 위시리스트에 상품 추가
    public void insertWishlist(Wishlist wishlist);
    
    // 위시리스트에서 상품 제거
    public void deleteWishlist(Map<String, Object> map);
    
    // 사용자의 위시리스트 조회
    public List<Wishlist> listWishlist(String userId);
    
    // 특정 상품의 위시리스트 등록 수 조회
    public int countWishlistByProduct(Long productNum);
    
    // 사용자의 위시리스트 개수 조회
    public int dataCountWishlist(String userId);
    
    // 특정 상품이 사용자의 위시리스트에 있는지 확인
    public int isWishlistExist(Map<String, Object> map);
}