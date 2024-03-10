package com.example.demo.service;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.dto.ProductDTO;
import com.example.demo.dto.ReviewDTO;
import com.example.demo.mapper.ProductMapper;
import com.example.demo.mapper.ReviewMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReviewService {
	private final ReviewMapper reviewMapper;
	private final ProductService productservice;
	
	public void addReview(ReviewDTO review) throws IOException {
		if(!review.getImgPath().isEmpty()) {
			 review.setReview_img(productservice.uploadFile(review.getImgPath(),"reviews"));
		}
		reviewMapper.insertReview(review);
	}
	public List<ProductDTO> NoReivew(String email){
		return reviewMapper.NoReview(email);
	}
	
	public List<ReviewDTO> YesReview(String email){
		return reviewMapper.YesReview(email);
	}
	
	public void ChangeReview(ReviewDTO review) throws IOException {
		if(review.getImgPath() != null && !review.getImgPath().isEmpty()) {
			 review.setReview_img(productservice.uploadFile(review.getImgPath(),"reviews"));
			 reviewMapper.ChengeReview(review);
		}
		else {
			reviewMapper.NoimgChengeReview(review);
		}
	}
	public List<ReviewDTO> getReview(int product_id) {	
		List<ReviewDTO> review = reviewMapper.getReview(product_id);
		return review;
		
	}
}
