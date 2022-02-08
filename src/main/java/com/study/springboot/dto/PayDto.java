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

}
