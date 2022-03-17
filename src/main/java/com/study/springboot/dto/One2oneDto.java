package com.study.springboot.dto;

import java.util.Date;

import lombok.Data;

@Data
public class One2oneDto {
	
	private int one2one_idx;
	private String one2one_member_id;
	private String one2one_member_name;
	private String one2one_title;
	private String one2one_content;
	private Date one2one_date;
	
public One2oneDto() {
		
	}
	
	public One2oneDto(int one2one_idx, String one2one_member_id, String one2one_member_name, String one2one_title, String one2one_content, Date one2one_date) {
		super();
		this.one2one_idx = one2one_idx;
		this.one2one_member_id = one2one_member_id;
		this.one2one_member_name = one2one_member_name;
		this.one2one_title = one2one_title;
		this.one2one_content = one2one_content;
		this.one2one_date = one2one_date;
	}

}
