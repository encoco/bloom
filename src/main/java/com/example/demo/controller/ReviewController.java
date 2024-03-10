package com.example.demo.controller;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.dto.ReviewDTO;
import com.example.demo.service.ReviewService;
import com.example.demo.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ReviewController {
	private ReviewService service;
	
	public ReviewController(ReviewService service) {
		this.service = service;
	}
	
	@GetMapping("/review")
	public String review(@RequestParam int productId, Model model){
		model.addAttribute("product_id", productId);
		return "review";
	}
	
	@PostMapping("/review")
	public String review(@RequestParam int product_id,ReviewDTO review ,HttpSession session) throws IOException {
		String email = (String) session.getAttribute("email");
		review.setEmail(email);
		service.addReview(review);
		return "redirect:/MyPage";
	}
	@GetMapping("/ChangeReview")
	public String chReview(ReviewDTO review, Model model,HttpSession session) throws IOException {
        review.setEmail((String)session.getAttribute("email"));
        model.addAttribute("review", review); 
	    return "reviewChangePage"; 
	}
	@PostMapping("/ChangeReview")
	public String chanReview(ReviewDTO review, HttpSession session) throws IOException {
		System.out.println(review);
		return "redirect:/MyPage";
	}
}
