package com.study.springboot.dto;

import lombok.Data;

@Data
public class OrderDto {
	
	private int order_idx;
	private int order_pay_idx;
	private int order_product_idx;
	private String order_product_name;
	private int order_count;
	private int order_price;
	
	private int pay_idx;
	private int pay_date;
	private int pay_delivery;
	private int pay_total;
	
	
	public OrderDto() {
		
	}


	public OrderDto(int order_idx, int order_pay_idx, int order_product_idx, String order_product_name, int order_count,
			int order_price, int pay_idx, int pay_date, int pay_delivery, int pay_total) {
		super();
		this.order_idx = order_idx;
		this.order_pay_idx = order_pay_idx;
		this.order_product_idx = order_product_idx;
		this.order_product_name = order_product_name;
		this.order_count = order_count;
		this.order_price = order_price;
		this.pay_idx = pay_idx;
		this.pay_date = pay_date;
		this.pay_delivery = pay_delivery;
		this.pay_total = pay_total;
	}
	
	
	

}
