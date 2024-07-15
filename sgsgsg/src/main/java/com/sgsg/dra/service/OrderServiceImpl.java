package com.sgsg.dra.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicLong;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sgsg.dra.domain.Delivery;
import com.sgsg.dra.domain.Order;
import com.sgsg.dra.domain.Product;
import com.sgsg.dra.domain.UserPoint;
import com.sgsg.dra.mapper.OrderMapper;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper mapper;
	
	private static AtomicLong count = new AtomicLong(0);
	
	@Override
	public String productOrderNumber() {
		// 상품 주문 번호 생성
		String result = "";
		
		try {
			Calendar cal = Calendar.getInstance();
			String y =String.format("%04d", cal.get(Calendar.YEAR));
			String m = String.format("%02d", (cal.get(Calendar.MONTH) + 1));
			String d = String.format("%03d", cal.get(Calendar.DATE) * 7);
			
			String preNumber = y + m + d;
			String savedPreNumber = "0";
			long savedLastNumber = 0;
			String maxOrderNumber = mapper.findByMaxOrderNumber();
			if(maxOrderNumber != null && maxOrderNumber.length() > 9) {
				savedPreNumber = maxOrderNumber.substring(0, 9);
				savedLastNumber = Long.parseLong(maxOrderNumber.substring(9));
			}
			
			long lastNumber = 1;
			if(! preNumber.equals(savedPreNumber)) {
				count.set(0);
				lastNumber = count.incrementAndGet();
			} else {
				lastNumber = count.incrementAndGet();
				
				if( savedLastNumber >= lastNumber )  {
					count.set(savedLastNumber);
					lastNumber = count.incrementAndGet();
				}
			}
			
			result = preNumber + String.format("%09d", lastNumber);
			
		} catch (Exception e) {
		}
		
		return result;
	}

	@Override
	public void insertOrder(Order dto) throws Exception {

		try {
			mapper.insertOrder(dto);
			
			// 결제 내역 저장
			mapper.insertPayDetail(dto);
			
			// 주문 상세
			for (int i = 0; i < dto.getStockNums().size(); i++) {
				dto.setStockNum(dto.getStockNums().get(i));
				dto.setQty(dto.getQtys().get(i));
				dto.setProductMoney(dto.getProductMoneys().get(i));
				dto.setPrice(dto.getPrices().get(i));
				dto.setSalePrice(dto.getSalePrices().get(i));
				dto.setSavedMoney(dto.getSavedMoneys().get(i));
				
				mapper.insertOrderDetail(dto);
				
				// 재고 감소
				mapper.updateProductStock(dto);
			}
			
			// 사용 포인트 저장(포인트 적립은 구매 확정에서)
			if(dto.getUsedSaved() > 0) {
				UserPoint before = findByUserPoint(dto.getUserId());
				
				LocalDateTime now = LocalDateTime.now();
				String dateTime = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
				
				UserPoint up = new UserPoint();
				up.setUserId(dto.getUserId());
				up.setOrderNum(dto.getOrderNum());
				up.setChange_points(-dto.getUsedSaved());
				up.setRemain_points(before.getRemain_points() - dto.getUsedSaved());
				up.setChange_date(dateTime);
				up.setReason("구매");
				mapper.insertUserPoint(up);
			}
			
		} catch (Exception e) {
			throw e;
		}

	}
	
	
	@Override
	public List<Product> findByStockNum(Map<String, Object> map) throws Exception {
		List<Product> product = null;
		try {
			product = mapper.findByStockNum(map);
		} catch (Exception e) {
			throw e;
		}
		
		return product;
	}
	

	@Override
	public Delivery findByDest(String userId) throws Exception {
		Delivery delivery = null;

		try {
			delivery = mapper.findByDest(userId);
		} catch (Exception e) {
			throw e;
		}
		return delivery;
	}

	@Override
	public List<Delivery> selectAllDest(String userId) throws Exception {
		List<Delivery> deliverys = null;
		
		try {
			deliverys = mapper.selectAllDest(userId);
		} catch (Exception e) {
		}
		return deliverys;
	}

	@Override
	public UserPoint findByUserPoint(String userId) throws Exception {
		UserPoint point = null;
		
		try {
			point = mapper.findByUserPoint(userId);
		} catch (Exception e) {
			throw e;
		}
		return point;
	}


}
