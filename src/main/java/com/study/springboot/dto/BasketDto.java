package com.study.springboot.dto;

import java.util.Date;

import lombok.Data;

@Data
public class BasketDto {
	
	private int basket_idx;
	private String basket_member_id;
	private int basket_product_idx;
	private int basket_count;
	private int basket_price;
			
	private int product_idx;
	private String product_type;
	private String product_name;
	private String product_brand;
	private String product_color;
	private int product_price;
	private int product_count; // 수량
	private String product_img1;
	private String product_img2;
	private String product_img3;
	private Date product_date;
	
	public BasketDto() {
			
	}

	public BasketDto(int basket_idx, String basket_member_id, int basket_product_idx, int basket_count,
			int basket_price, int product_idx, String product_type, String product_name, String product_brand,
			String product_color, int product_price, int product_count, String product_img1, String product_img2,
			String product_img3, Date product_date) {
		super();
		this.basket_idx = basket_idx;
		this.basket_member_id = basket_member_id;
		this.basket_product_idx = basket_product_idx;
		this.basket_count = basket_count;
		this.basket_price = basket_price;
		this.product_idx = product_idx;
		this.product_type = product_type;
		this.product_name = product_name;
		this.product_brand = product_brand;
		this.product_color = product_color;
		this.product_price = product_price;
		this.product_count = product_count;
		this.product_img1 = product_img1;
		this.product_img2 = product_img2;
		this.product_img3 = product_img3;
		this.product_date = product_date;
	}
	
	
	
	
	
	
	
	

}
