package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.PayDto;

@Mapper
public interface IPayDao {
	
	public List<PayDto> delivery(String pay_delivery);

}
