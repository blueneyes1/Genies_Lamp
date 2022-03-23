package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.study.springboot.dao.IPayDao;
import com.study.springboot.dto.PayDto;

@Component
public class payService {
	
	@Autowired
	IPayDao payDao;
	
	
	// 관리자 페이지 - 주문관리 (PYH)
	public List<PayDto> delivery(String pay_delivery) {
		
		System.out.println(payDao);
		 
		 List<PayDto> list = payDao.delivery(pay_delivery);
		 
		
		return list;
	}
	
	// 결제 액션 (LDG)
	public int payAction( String pay_number, String member_id, String pay_receiver, String pay_phone, String pay_address1, 
			String pay_address2, String pay_address3, String pay_message, String pay_cost, String pay_total
			) {
		
		int result = payDao.payAction( pay_number, member_id, pay_receiver, pay_phone, pay_address1, pay_address2, 
				pay_address3, pay_message, pay_cost, pay_total );
		
		return result;
		
	}
	

}
