package com.example.demo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.orderService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class orderController {
	public final orderService orderservice;
	
	@PostMapping("/processOrder")
    @ResponseBody //requestData = order_id, product_id , receiver, phone, address, memo
    public Map<String, Object> processOrder(@RequestBody Map<String, Object> requestData, HttpSession session) {
    	String email = (String)session.getAttribute("email");
    	Map<String, Object> response = new HashMap<>();
        
        try {
        	//여기서 장바구니 테이블에서 삭제하고 totalorder에 insert
        	if(orderservice.Order(requestData,email)) {
        		response.put("success", true);
        		response.put("message", "주문 처리가 성공했습니다.");
        	}
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "주문 처리 중 오류가 발생했습니다.");
            response.put("error", e.getMessage());
        }
        return response;
    }
	
	@PostMapping("/deleteSelectedItems")
	@ResponseBody
	public ResponseEntity<?> deleteSelectedItems(@RequestBody Map<String, List<Long>> payload, HttpSession session) {
	    String email = (String)session.getAttribute("email");
		List<Long> productIds = payload.get("productIds");
	    boolean result = orderservice.delcart(productIds,email);
	    if (result) {
	        return ResponseEntity.ok().build();
	    } else {
	        return ResponseEntity.status(HttpStatus.SC_INTERNAL_SERVER_ERROR).build();
	    }
	}

}
