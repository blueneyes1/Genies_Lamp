package com.study.springboot.dto;

import java.util.List;

import lombok.Data;

@Data
public class PayDto {
	
	private List<OrderDto> orders;		// 주문상품 정보
	
	private int pay_idx;
	private String pay_number;			// 주문번호
	private String pay_member_id;
	private String pay_receiver;		// 받는사람
	private String pay_phone;
	private String pay_address1;
	private String pay_address2;
	private String pay_address3;
	private String pay_message;
	private int pay_cost;				// 배송비
	private int pay_total;				// 결제금액 (배송비포함)
	private int pay_delivery;
		
	public PayDto() {
		
	}

	public PayDto(List<OrderDto> orders, int pay_idx, String pay_number, String pay_member_id, String pay_receiver,
			String pay_phone, String pay_address1, String pay_address2, String pay_address3, String pay_message,
			int pay_cost, int pay_total, int pay_delivery) {
		super();
		this.orders = orders;
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
	}	
	
	@Override
	public String toString() {
		return "PayDto [orders=" + orders + "]";
	}
	
	
	

}
