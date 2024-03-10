package com.example.demo.dto;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ReviewDTO {
	private int product_id;
	private String email;
	private String content;
	private String review_img;
	private int star_score;
	private MultipartFile imgPath;
	private Date review_date;
	private int review_id;
	String size;
	int quantity;
	String name;
	
	public String getFormattedReviewDate() {
        if (review_date == null) {
            return ""; 
        }
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        return formatter.format(review_date);
    }
}
