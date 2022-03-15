package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.study.springboot.dao.IOrderDao;
import com.study.springboot.dto.OrderDto;

@Component
public class OrderService {
	
	@Autowired
	IOrderDao orderDao;
	
	public List<OrderDto> orderDetail(String member_id) {
		
		List<OrderDto> orderDetail = orderDao.orderDetail(member_id);
				
		return orderDetail;
		
	}

}
