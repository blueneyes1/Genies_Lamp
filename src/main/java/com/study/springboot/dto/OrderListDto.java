package com.study.springboot.dto;

import java.util.List;

import lombok.Data;

@Data
public class OrderListDto {
	
	private List<OrderDto> orderList;
	
	public OrderListDto() {
		
	}
	
	@Override
	public String toString() {
		return "OrderListDto [orderList=" + orderList + "]";
	}

	

}
