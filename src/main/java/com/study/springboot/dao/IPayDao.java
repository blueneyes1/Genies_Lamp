package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.PayDto;

@Mapper
public interface IPayDao {
	
	// 관리자 페이지 - 주문관리 (PYH)
	public List<PayDto> delivery(String pay_delivery);
	

}
