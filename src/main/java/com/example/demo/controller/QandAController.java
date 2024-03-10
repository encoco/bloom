package com.example.demo.controller;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.demo.dto.QandADTO;
import com.example.demo.service.QandAService;
import com.example.demo.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class QandAController {
	private QandAService service;
	
	public QandAController(QandAService service) {
		this.service = service;
	}
	
	@GetMapping("/QandA")
	public String QandA(){
		return "QandA";
	}
	
	@PostMapping("/QandA")
	public String QandA(QandADTO QandA ,HttpSession session) throws IOException {
		QandA.setEmail((String) session.getAttribute("email"));
		QandA.setProduct_id((int)session.getAttribute("product_id"));
		System.out.println(QandA);
		service.addQandA(QandA);
		return "QandA";
	}
	
	
}
