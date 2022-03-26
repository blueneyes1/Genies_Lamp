package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.study.springboot.dao.IProduct_reviewDao;
import com.study.springboot.dto.Product_reviewDto;

@Component
public class ProductReviewService {
	
	@Autowired
	IProduct_reviewDao product_reviewDao;
		
	// 메인페이지 최신 리뷰 4 ( LDG )
	public List<Product_reviewDto> main_review() {
			
		List<Product_reviewDto> main_review = product_reviewDao.main_review();
			
		return main_review;
		
	}

}
