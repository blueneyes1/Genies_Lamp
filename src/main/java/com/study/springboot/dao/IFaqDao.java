package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.FaqDto;

@Mapper
public interface IFaqDao {

	public List<FaqDto> faq_list();
	
	public List<FaqDto> listPage(String startRowNum,String endRowNum);
	
	public FaqDto faq_content(String faq_idx);
	
	public int writefaq(String faq_idx, String faq_title, String faq_content);

	public FaqDto viewDto(String faq_idx);
	
	public int updatefaq(String faq_idx, String faq_title, String faq_content);

	public int delete(String faq_idx);
}
