package com.example.demo.dto;

import lombok.Data;

@Data
public class cartDTO {
	int cart_id;
	String email;
	int product_id;
	int quantity = 1;
	String name;
	int price;
	String img1;
	String size;
}