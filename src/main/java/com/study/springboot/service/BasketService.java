package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.study.springboot.dao.IBasketDao;
import com.study.springboot.dto.BasketDto;

@Component
public class BasketService {
	
	@Autowired
	IBasketDao basketDao;
	
	// 마이페이지 - 장바구니 보기 (PYH)
	public List<BasketDto> viewBasket(String basket_member_id) {
		
<<<<<<< HEAD
		List<BasketDto> viewBasket = basketDao.viewBasket(basket_member_id);
		
		return viewBasket;
=======
		List<BasketDto> basket_list = basketDao.viewBasket(basket_member_id);
		
		return basket_list;
>>>>>>> c584d6e1cfd37b767871cde3a964f75876130ee8
	}
	

	// 장바구니 비우기(PYH)
	public int basket_delete(String basket_member_id) {
		
		int result = basketDao.basket_delete(basket_member_id);
		
		return result;
	}
}
