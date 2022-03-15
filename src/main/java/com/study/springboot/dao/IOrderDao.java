package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.OrderDto;

@Mapper
public interface IOrderDao {
	
	public List<OrderDto> orderDetail(String member_id);

}
