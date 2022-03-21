package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.PayDto;

@Mapper
public interface IPayDao {
	
	// 관리자 페이지 - 주문관리 (PYH)
	public List<PayDto> delivery(String pay_delivery);
	
	// 단품결제액션 (LDG)
	public int singlePay( String pay_number, String member_id, String pay_receiver, String pay_phone, String pay_address1, 
			String pay_address2, String pay_address3, String pay_message, String pay_cost, String pay_total
			 );
	

}
