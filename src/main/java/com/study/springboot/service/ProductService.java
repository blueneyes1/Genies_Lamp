package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.study.springboot.dao.IProductDao;
import com.study.springboot.dao.IProduct_reviewDao;
import com.study.springboot.dto.ProductDto;
import com.study.springboot.dto.Product_reviewDto;

@Component
public class ProductService {
	
	@Autowired
	IProductDao productDao;
	
	@Autowired
	IProduct_reviewDao product_reviewDao;
	
	
	public List<ProductDto> viewProduct(String product_idx) {
		
		List<ProductDto> list = productDao.viewProduct(product_idx);
		
		System.out.println(productDao);
		
		return list;
	}
	
	public List<Product_reviewDto> viewReview(String review_product_idx) {
		
		List<Product_reviewDto> review_list = product_reviewDao.viewReview(review_product_idx);
		
		return review_list;
	}
	
	public int writeReview(String review_product_idx,String review_member_id, String review_title, String review_content) {
		
		int result = product_reviewDao.writeReview(review_product_idx, review_member_id, review_title, review_content);
		
		return result;
	}

}
