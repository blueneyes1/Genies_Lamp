package com.study.springboot.dto;

import lombok.Data;

@Data
public class FaqDto {
	
	private int faq_idx;
	private String faq_title;
	private String faq_content;
	
	
	public FaqDto() {
		
	}
	
	public FaqDto(int faq_idx, String faq_title, String faq_content) {
		super();
		this.faq_idx = faq_idx;
		this.faq_title = faq_title;
		this.faq_content = faq_content;
	}

}
