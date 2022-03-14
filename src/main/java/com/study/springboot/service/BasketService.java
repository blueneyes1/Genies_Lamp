package com.study.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.study.springboot.dao.IBasketDao;
import com.study.springboot.dto.BasketDto;

@Component
public class BasketService {
	
	@Autowired
	IBasketDao basketDao;
	
	public BasketDto viewBasket(String basket_member_id) {
		
		BasketDto basket = basketDao.viewBasket(basket_member_id);
		
		return basket;
	}
	

}
