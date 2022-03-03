package com.study.springboot.dto;

import lombok.Data;

@Data
public class PayDto {
	
	private int pay_idx;
	private String pay_member_id;
	private String pay_receiver;		// 받는사람
	private String pay_phone;
	private String pay_address;
	private String pay_message;
	private int pay_total;
	private int pay_delivery;
	
	public PayDto(int pay_idx, String pay_member_id, String pay_receiver, String pay_phone, String pay_address,
			String pay_message, int pay_total, int pay_delivery) {
		super();
		this.pay_idx = pay_idx;
		this.pay_member_id = pay_member_id;
		this.pay_receiver = pay_receiver;
		this.pay_phone = pay_phone;
		this.pay_address = pay_address;
		this.pay_message = pay_message;
		this.pay_total = pay_total;
		this.pay_delivery = pay_delivery;
	}
	
	

}
