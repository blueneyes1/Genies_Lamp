package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.study.springboot.dao.IFaqDao;
import com.study.springboot.dto.FaqDto;


@Component
public class FaqService {
	
	@Autowired
	private IFaqDao faqDao;

	public List<FaqDto> faq_list(){
		List<FaqDto> faq_list = faqDao.faq_list();
		return faq_list;
	}
	public List<FaqDto> listPage(String startRowNum, String endRowNum) {
		
		List<FaqDto> listPage = faqDao.listPage(startRowNum, endRowNum);
		
		return listPage;
	}

	public FaqDto faq_content(String faq_idx) {
		FaqDto faq_dto = faqDao.faq_content(faq_idx);
		return faq_dto;
	}
	
	public int writefaq(String faq_idx, String faq_title, String faq_content) {
		
		int result = faqDao.writefaq(faq_idx, faq_title, faq_content);
		
		return result;
	}
	public FaqDto viewDto(String faq_idx) {
		FaqDto viewDto = faqDao.viewDto(faq_idx);
		return viewDto;
	
	}
	public int updatefaq(String faq_idx, String faq_title, String faq_content) {
		
		int result = faqDao.updatefaq(faq_idx, faq_title, faq_content);
		
		return result;
	}
	public int delete(String faq_idx) {
		
		int result = faqDao.delete(faq_idx);
		
		return result;
	}

}

