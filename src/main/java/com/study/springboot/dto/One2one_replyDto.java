package com.study.springboot.dto;

import java.util.Date;

import lombok.Data;

@Data
public class One2one_replyDto {
	
	private int one2one_reply_idx;
	private String one2one_reply_one2one_idx;
	private String one2one_reply_member_id;
	private String one2one_reply_member_name;
	private String one2one_reply_title;
	private String one2one_reply_content;
	private Date one2one_reply_date;
	
	public One2one_replyDto(int one2one_reply_idx, String one2one_reply_one2one_idx, String one2one_reply_member_id, String one2one_reply_member_name,
			String one2one_reply_title, String one2one_reply_content, Date one2one_reply_date) {
		super();
		this.one2one_reply_idx = one2one_reply_idx;
		this.one2one_reply_one2one_idx = one2one_reply_one2one_idx;
		this.one2one_reply_member_id = one2one_reply_member_id;
		this.one2one_reply_member_name = one2one_reply_member_name;
		this.one2one_reply_title = one2one_reply_title;
		this.one2one_reply_content = one2one_reply_content;
		this.one2one_reply_date = one2one_reply_date;
	}
	

}
