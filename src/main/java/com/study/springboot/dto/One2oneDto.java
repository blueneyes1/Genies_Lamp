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

}
