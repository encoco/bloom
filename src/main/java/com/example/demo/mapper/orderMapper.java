package com.example.demo.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.orderDTO;

@Mapper
public interface orderMapper {
	void delCart(Map<String, Object> products);
	void delStock(Map<String, Object> products);
	void addOrder(Map<String, Object> products);
	void addOrderDetail(Map<String, Object> product); // 주문 상세 정보를 추가합니다.
	void addsales(Map<String, Object> product);
	List<orderDTO> allbuyproduct(String email); 
	
}
