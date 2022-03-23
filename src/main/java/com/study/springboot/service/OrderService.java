package com.study.springboot.service;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.study.springboot.dao.IOrderDao;
import com.study.springboot.dto.OrderDto;

@Component
public class OrderService {
	
	@Autowired
	IOrderDao orderDao;
	
	// 마이페이지 - 주문내역 (LDG)
	public List<OrderDto> orderDetail(String member_id) {
		
		List<OrderDto> orderDetail = orderDao.orderDetail(member_id);
				
		return orderDetail;
		
	}
	
	// 단건구매 - 구매제품등록 (LDG)
	public int singleOrder( String pay_number, String order_product_idx, String order_product_name, 
			String order_count, String order_price ) {
		
		int result1 = orderDao.singleOrder( pay_number, order_product_idx, order_product_name, 
				order_count, order_price );
		
		return result1;
	}
	

	
	public List<OrderDto> orders(List<OrderDto> orderList) {
				
		 List <OrderDto> result = new ArrayList<>();
		 
		 for(OrderDto odl : orderList ) {
			 
			 
			 OrderDto dto = odl;
			 dto.setOrder_product_idx(odl.getOrder_product_idx());
			 dto.setOrder_product_name(odl.getOrder_product_name());
			 dto.setOrder_count(odl.getOrder_count());
			 dto.setOrder_price(odl.getOrder_price());
			 
			 result.add(dto);
			 
		 }
		 
		 
		return result;
		
	}
	

}














