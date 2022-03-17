package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.Product_reviewDto;

@Mapper
public interface IProduct_reviewDao {
	
	// 제품 상세 페이지 - 리뷰 보기 (PYH)
	public List<Product_reviewDto> viewReview(String review_product_idx);
	
	// 제품 상세 페이지 - 리뷰 작성 (PYH)
	public int writeReview(String review_product_idx, String review_member_id, String review_img ,String review_title, String review_content);
	
	// 관리자 페이지 - 리뷰 관리 페이지 - 리뷰 보기 (PYH)
	public List<Product_reviewDto> admin_view_review();
	
	// 관리자 페이지 - 리뷰 관리 페이지 - 리뷰 삭제 (PYH)
	public int admin_review_delete(String review_idx);
	
	// 마이 페이지 - 내가 작성한 리뷰 페이지 - 리뷰 보기 (PYH)
	public List<Product_reviewDto> mypage_view_review(String review_member_id);
	
	// 마이 페이지 - 내가 작성한 리뷰 페이지 - 리뷰 수정 삭제 페이지 (PYH)
	public Product_reviewDto mypage_view_modify_review(String review_member_id, String review_idx);
	
	// 마이 페이지 - 내가 작성한 리뷰 페이지 - 리뷰 수정 (PYH)
	public int mypage_review_update(String review_member_id, String review_product_idx, String review_title, String review_content);
	
	// 마이 페이지 - 내가 작성한 리뷰 페이지 - 리뷰 삭제 (PYH)
	public int mypage_review_delete(String review_member_id , String review_product_idx);
}
