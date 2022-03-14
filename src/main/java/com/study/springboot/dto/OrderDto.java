package com.study.springboot.dto;

import lombok.Data;

@Data
public class OrderDto {
	
	public int order_idx;
	public int order_pay_idx;
	public int order_product_idx;
	public int order_count;
	public int order_price;
	
	public OrderDto(int order_idx, int order_pay_idx, int order_product_idx, int order_count, int order_price) {
		super();
		this.order_idx = order_idx;
		this.order_pay_idx = order_pay_idx;
		this.order_product_idx = order_product_idx;
		this.order_count = order_count;
		this.order_price = order_price;
	}
	
	

}
