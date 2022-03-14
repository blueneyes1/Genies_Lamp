package com.study.springboot.dao;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.BasketDto;

@Mapper
public interface IBasketDao {
	
	public BasketDto viewBasket(String basket_member_id);
	

}
