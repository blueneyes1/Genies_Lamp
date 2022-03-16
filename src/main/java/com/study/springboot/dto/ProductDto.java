package com.study.springboot.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ProductDto {
	
	private int product_idx;
	private String product_type;
	private String product_name;
	private String product_brand;
	private String product_color;
	private int product_price;
	private int product_count; // 수량
	private String product_img1;
	private String product_content;
	private Date product_date;
	
	public ProductDto() {
		// TODO Auto-generated constructor stub
	}
	
	public ProductDto(int product_idx, String product_type, String product_name, String product_brand,
			String product_color, int product_price, int product_count, String product_img1, String product_content,
			Date product_date) {
		super();
		this.product_idx = product_idx;
		this.product_type = product_type;
		this.product_name = product_name;
		this.product_brand = product_brand;
		this.product_color = product_color;
		this.product_price = product_price;
		this.product_count = product_count;
		this.product_img1 = product_img1;
		this.product_content = product_content;
		this.product_date = product_date;
	}
	
	

	
	
	
	
	
	
	
	
	
	
	

}
