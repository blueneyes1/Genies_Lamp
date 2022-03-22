package com.study.springboot.dto;



import lombok.Data;

@Data
public class OrderDto {
	
	private int order_idx;
	private String order_pay_number;
	private int order_product_idx;
	private String order_product_name;
	private int order_count;
	private int order_price;
	private String order_review;
	
	private int pay_idx;
	private String pay_number;
	private String pay_member_id;
	private String pay_receiver;
	private String pay_phone;
	private String pay_address1;
	private String pay_address2;
	private String pay_address3;
	private String pay_message;
	private int pay_cost;
	private int pay_total;
	private int pay_delivery;
	private int pay_date;
	
	public OrderDto() {
		
	}

	public OrderDto(int order_idx, String order_pay_number, int order_product_idx, String order_product_name,
			int order_count, int order_price, String order_review, int pay_idx, String pay_number, String pay_member_id,
			String pay_receiver, String pay_phone, String pay_address1, String pay_address2, String pay_address3,
			String pay_message, int pay_cost, int pay_total, int pay_delivery, int pay_date) {
		super();
		this.order_idx = order_idx;
		this.order_pay_number = order_pay_number;
		this.order_product_idx = order_product_idx;
		this.order_product_name = order_product_name;
		this.order_count = order_count;
		this.order_price = order_price;
		this.order_review = order_review;
		this.pay_idx = pay_idx;
		this.pay_number = pay_number;
		this.pay_member_id = pay_member_id;
		this.pay_receiver = pay_receiver;
		this.pay_phone = pay_phone;
		this.pay_address1 = pay_address1;
		this.pay_address2 = pay_address2;
		this.pay_address3 = pay_address3;
		this.pay_message = pay_message;
		this.pay_cost = pay_cost;
		this.pay_total = pay_total;
		this.pay_delivery = pay_delivery;
		this.pay_date = pay_date;
	}

	
	@Override
	public String toString() {
		return "OrderDto [order_product_idx=" + order_product_idx + 
				", order_product_name=" + order_product_name + ", order_count=" 
				+ order_count + ", order_price=" + order_price + "]";
	}	
	
	
	

}
