package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

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
	
	
	// 제품리스트 (PYH)
	public List<ProductDto> product_list() {
		
		List<ProductDto> product_list = productDao.product_list();
		
		System.out.println(productDao);
		
		return product_list;
	}
	
	// 제품 리스트 페이지 (PYH)
	public List<ProductDto> product_listPage(String product_type, String startRowNum, String endRowNum) {
		
		List<ProductDto> product_listPage = productDao.product_listPage(product_type, startRowNum, endRowNum);
		
		return product_listPage;
	}
	
	// 제품 상세 페이지 (PYH)
	public List<ProductDto> viewProduct(String product_idx) {
		
		List<ProductDto> list = productDao.viewProduct(product_idx);
		
		System.out.println(productDao);
		
		return list;
	}
	
	// 제품 상세 페이지 - 리뷰 보기 (PYH)
	public List<Product_reviewDto> viewReview(String review_product_idx) {
		
		List<Product_reviewDto> review_list = product_reviewDao.viewReview(review_product_idx);
		
		return review_list;
	}
	
	// 제품 상세 페이지 - 리뷰 작성 (PYH)
	public int writeReview(String review_product_idx,String review_member_id, String review_title, String review_content) {
		
		int result = product_reviewDao.writeReview(review_product_idx, review_member_id, review_title, review_content);
		
		return result;
	}
	
	// 관리자페이지 - 제품 등록 (PYH)
	public int productAdd(String product_type,
			String product_name,
			String product_brand,
			String product_color,
			String product_price,
			String product_count,
			String product_img1,
			String product_content) {
		
		int result = productDao.productAdd(product_type, product_name, product_brand, product_color, product_price, product_count, product_img1, product_content);
	
	
		return result;
	}
	
	// 관리자페이지 - 제품 정보 보기 (PYH)
	public ProductDto admin_view_product(String product_idx) {
		
		ProductDto admin_view_product_dto = productDao.admin_view_product(product_idx);
		
		return admin_view_product_dto;
	}
	
	// 관리자페이지 - 제품 정보 수정 (PYH)
	public int admin_product_modify(String product_idx, String product_type, String product_name, String product_brand, String product_color, String product_price,
			String product_count, String product_content) {
		
		int result = productDao.admin_product_modify(product_idx, product_type, product_name, product_brand, product_color, product_price, product_count, product_content);
	
		return result;
	
	}
	
	// 관리자페이지 - 제품 정보 삭제 (PYH)
	public int admin_product_delete(String product_idx) {
		
		int result = productDao.admin_product_delete(product_idx);
		
		return result;
	}

}
