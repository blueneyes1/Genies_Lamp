package com.study.springboot.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Product_reviewDto {
	
	private int review_idx;
	private int review_product_idx;
	private String review_member_id;
	private String review_img;
	private String review_title;
	private String review_content;
	private Date review_date;
	
	public Product_reviewDto() {
		// TODO Auto-generated constructor stub
	}
	
	public Product_reviewDto(int review_idx, int review_product_idx, String review_member_id, String review_img,
			String review_title, String review_content, Date review_date) {
		super();
		this.review_idx = review_idx;
		this.review_product_idx = review_product_idx;
		this.review_member_id = review_member_id;
		this.review_img = review_img;
		this.review_title = review_title;
		this.review_content = review_content;
		this.review_date = review_date;
	}
	
	
	
	
	
	
	
	
	
	
	

}
