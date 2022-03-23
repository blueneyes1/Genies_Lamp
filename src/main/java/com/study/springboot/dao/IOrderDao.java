package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.OrderDto;
import com.study.springboot.dto.OrderListDto;


@Mapper
public interface IOrderDao {
	
	// 주문내역 (LDG)
	public List<OrderDto> orderDetail(String member_id);
	
	// 단건구매 - 제품등록 (LDG)
	public int singleOrder( String pay_number, String order_product_idx, String order_product_name, 
			String order_count, String order_price );
	
	// 멀티구매 - 리스트 (LDG)
	public List<OrderDto> orders(List<OrderListDto> orderList);
	
}
