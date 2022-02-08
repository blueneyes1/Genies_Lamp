package com.study.springboot.dto;

import lombok.Data;

@Data
public class BasketDto {
	
	private int basket_idx;
	private String basket_member_id;
	private String basket_product_idx;
	private int basket_count;
	private int basket_price;
	
	public BasketDto(int basket_idx, String basket_member_id, String basket_product_idx, int basket_count,
			int basket_price) {
		super();
		this.basket_idx = basket_idx;
		this.basket_member_id = basket_member_id;
		this.basket_product_idx = basket_product_idx;
		this.basket_count = basket_count;
		this.basket_price = basket_price;
	}
	
	

}
