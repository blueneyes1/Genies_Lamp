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

		List<BasketDto> viewBasket = basketDao.viewBasket(basket_member_id);
		
		return viewBasket;

	}
	

	// 장바구니 비우기(PYH)
	public int basket_delete(String basket_member_id) {
		
		int result = basketDao.basket_delete(basket_member_id);
		
		return result;
	}
	
	// 제품 상세 페이지에서 장바구니 추가하기 (PYH)
	public int basketAdd(String basket_member_id, String basket_product_idx, String basket_count, String basket_price) {
		
		int result = basketDao.basketAdd(basket_member_id, basket_product_idx, basket_count, basket_price);
		
		return result;
	}
}
