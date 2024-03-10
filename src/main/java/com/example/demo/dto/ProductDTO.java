package com.example.demo.dto;


import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductDTO {
	int product_id;
	int category_id;
	String name;
	private String img1;
	private String img2;
	private String img3;
	private String img4;
	private MultipartFile img1Path;
	private MultipartFile img2Path;
	private MultipartFile img3Path;
	private MultipartFile img4Path;
	String product_content;
	int price;
	int sale;
	Date rdate = new Date();
	int stock_xs;
	int stock_s;
	int stock_m;
	int stock_l;
	int stock_xl;
	private int quantity;
    private String size;
}
