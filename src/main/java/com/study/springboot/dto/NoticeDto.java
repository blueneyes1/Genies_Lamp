package com.study.springboot.dto;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeDto {
	
	private int notice_idx;
	private String notice_title;
	private String notice_content;
	private Date notice_date;
	
	public NoticeDto() {
		
	}

	public NoticeDto(int notice_idx, String notice_title, String notice_content, Date notice_date) {
		super();
		this.notice_idx = notice_idx;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_date = notice_date;
	}
	
	

}
