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
	

	public List<PayDto> delivery(String pay_delivery) {
		
		System.out.println(payDao);
		 
		 List<PayDto> list = payDao.delivery(pay_delivery);
		 
		
		return list;
	}

}
