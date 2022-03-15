package com.study.springboot.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.study.springboot.dto.BasketDto;

@Mapper
public interface IBasketDao {
	
	// 사용자 장바구니 조회
	public ArrayList<BasketDto> user_cart_list(@Param("basket_member_id") String basket_member_id );
	
	// 사용자 장바구니 전체 삭제
	public int delete_user_cart(@Param("basket_member_id") String basket_member_id);
	
	// 장바구니 삭제
	public int cart_delete_action(String basket_product_idx,String basket_member_id);
	
	//장바구니 넣기 액션
	public int cart_insert_action(String basket_member_id,String basket_product_idx,int basket_count);
	
	//장바구니 이미 있는지 여부
	public int cart_count(String basket_product_idx, String basket_member_id);

	public BasketDto viewBasket(String basket_member_id);
	

}
