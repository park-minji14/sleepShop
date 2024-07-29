package com.sgsg.dra.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sgsg.dra.admin.mapper.ReturnManageMapper;
import com.sgsg.dra.domain.Return;
import com.sgsg.dra.state.OrderState;

@Service
public class ReturnManageServiceImpl implements ReturnManageService{
	@Autowired
	private ReturnManageMapper mapper;

	@Override
	public void insertReturnRequest(Map<String, Object> map) throws Exception {
		try {
			mapper.insertReturnRequest(map);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public List<Return> listReturnRequest(Map<String, Object> map) throws Exception {
		List<Return> list = null;
		
		try {
			list = mapper.listReturnRequest(map);
			for (Return return1 : list) {
				int ids = Integer.parseInt(return1.getDetail_status());
				return1.setDetailStatusInfo(OrderState.fromInt(ids).getKorean());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		int result = 0;
		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public void updateRetrunRequest(Map<String, Object> map) throws Exception {
		try {
			
			String status = map.get("detail_status").toString();
			if (status.equals("13")) {
				Return returnRequest = mapper.findReturnNum(map);
				map.put("refund_amount", returnRequest.getRefund_amount());
			}
			if(! status.equals("16")) {
				mapper.cancelProductStock(map);
			}
			mapper.updateRetrunRequest(map);
		} catch (Exception e) {
			throw e;
		}
		
	}
	
}
