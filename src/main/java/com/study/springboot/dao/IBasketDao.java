package com.study.springboot.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;


import com.study.springboot.dto.BasketDto;

@Mapper
public interface IBasketDao {

	// 마이페이지 장바구니 보기 (PYH)
	public List<BasketDto> viewBasket(String basket_member_id);
	
	// 장바구니 비우기 (PYH)
	public int basket_delete(String basket_member_id);
	
	// 제품 상세 페이지에서 장바구니 추가 하기 (PYH)
	public int basketAdd(String basket_member_id, String basket_product_idx, String basket_count, String basket_price);
	

}
