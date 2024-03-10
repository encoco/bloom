package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.ProductDTO;
import com.example.demo.dto.ReviewDTO;

@Mapper
public interface ReviewMapper {
	void insertReview(ReviewDTO review);
	List<ProductDTO> NoReview(String email);
	List<ReviewDTO> YesReview(String email);
	void ChengeReview(ReviewDTO review);
	void NoimgChengeReview(ReviewDTO review);
	void delreview(int review_id);
	List<ReviewDTO> getReview(int product_id);
}
