package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.ProductDto;

@Mapper
public interface IProductDao {
	
	public List<ProductDto> product_list();
	public List<ProductDto> viewProduct(String product_idx);
	public int productAdd(String product_type, 
			String product_name, 
			String product_brand, 
			String product_color, 
			String product_price, 
			String product_count, 
			String product_img1, 
			String product_img2 );
}
