package com.example.demo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.http.impl.execchain.RequestAbortedException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.dto.orderDTO;
import com.example.demo.mapper.orderMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class orderService {
	public final orderMapper ordermapper;
	
	
	@Transactional
	public boolean Order(Map<String, Object> requestData, String email) {
	    try {
	        Integer orderId = (Integer) requestData.get("order_id");
	        createOrder(requestData, email, orderId);

	        List<Map<String, Object>> productIdList = (List<Map<String, Object>>) requestData.get("product_id");
	        for (Map<String, Object> product : productIdList) {
	            Map<String, Object> delCartParams = new HashMap<>();
	            delCartParams.put("email", email);
	            delCartParams.put("product_id", product.get("id"));
	            delCartParams.put("quantity", product.get("quantity"));
	            delCartParams.put("size", product.get("size"));
	            delCartParams.put("name", product.get("name"));
	            ordermapper.delCart(delCartParams);
	            ordermapper.delStock(delCartParams);
	            ordermapper.addsales(delCartParams);

	            product.put("order_id", orderId);
	            ordermapper.addOrderDetail(product);
	        }
	        return true;
	    } catch (Exception e) {
	        // 모든 변경 사항을 롤백
	        throw new RuntimeException("Order transaction failed, rolling back", e);
	    }
	}
	
	private void createOrder(Map<String, Object> requestData, String email, Integer orderId) {
	    // 여기서 Orders 테이블에 주문 데이터를 삽입하는 로직을 수행합니다.
	    Map<String, Object> orderParams = new HashMap<>(requestData);
	    orderParams.put("email", email);
	    orderParams.put("order_id", orderId); // requestData에서 받은 orderId 사용
	    // ... MyBatis 매퍼를 사용하여 Orders 테이블에 주문을 삽입 ...
	    ordermapper.addOrder(orderParams);
	}
	
	
	
	public boolean delcart(List<Long> productIds, String userEmail) {
	    try {
	        for (Long productId : productIds) {
	        	Map<String, Object> params = new HashMap<>();
	            params.put("email", userEmail);
	            params.put("product_id", productId);
	            ordermapper.delCart(params);
	        }
	        return true;
	    } catch (Exception e) {
	        // 예외 처리 로직
	        return false;
	    }
	}
	
	
	public List<orderDTO> allbuyproduct(String email) {
		return ordermapper.allbuyproduct(email);
	}
}
