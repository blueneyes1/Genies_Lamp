package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.Product_reviewDto;

@Mapper
public interface IProduct_reviewDao {
	
	// 제품 상세 페이지 - 리뷰 보기 (PYH)
	public List<Product_reviewDto> viewReview(String review_product_idx);
	
	// 제품 상세 페이지 - 리뷰 작성 (PYH)
	public int writeReview(String review_product_idx, String review_member_id, String review_title, String review_content);

}
