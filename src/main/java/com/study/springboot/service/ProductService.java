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
	
	public List<ProductDto> product_list() {
		
		List<ProductDto> product_list = productDao.product_list();
		
		System.out.println(productDao);
		
		return product_list;
	}
	
	
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
	
	public int productAddAction(String product_type, String product_name, String product_brand, String product_color,
			String product_price, String product_count, String product_img1, String product_img2, String product_img3) {
		
		int result = productDao.productAddAction(product_type, 
				product_name, 
				product_brand, 
				product_color, 
				product_price, 
				product_count, 
				product_img1, product_img2, product_img3);
		
		return result;
	}

}
