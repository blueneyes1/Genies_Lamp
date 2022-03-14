package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.Product_reviewDto;

@Mapper
public interface IProduct_reviewDao {
	
	public List<Product_reviewDto> viewReview(String review_product_idx);
	public int writeReview(String review_product_idx, String review_member_id, String review_title, String review_content);

}
