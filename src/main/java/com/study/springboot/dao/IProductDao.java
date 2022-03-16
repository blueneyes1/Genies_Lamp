package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartFile;

import com.study.springboot.dto.ProductDto;

@Mapper
public interface IProductDao {
	
	// 제품 리스트 (PYH)
	public List<ProductDto> product_list();
	
	// 제품 리스트 페이지 (PYH)
	public List<ProductDto> product_listPage(String product_type, String startRowNum, String endRowNum);
	
	// 제품 상세 페이지 (PYH)
	public List<ProductDto> viewProduct(String product_idx);
	
	// 관리자페이지 - 제품 등록 (PYH)
	public int productAdd(String product_type,
						String product_name,
						String product_brand,
						String product_color,
						String product_price,
						String product_count,
						String product_img1,
						String product_content);
	
	// 관리자 페이지 - 제품 정보 보기 (PYH)
	public ProductDto admin_view_product(String product_idx);
	
	// 관리자 페이지 - 제품 정보 수정 (PYH)
	public int admin_product_modify(String product_idx, String product_type, String product_name, String product_brand, String product_color, String product_price,
			String product_count, String product_content);
	
	// 관리자 페이지 - 제품 정보 삭제 (PYH)
	public int admin_product_delete(String product_idx);
}
