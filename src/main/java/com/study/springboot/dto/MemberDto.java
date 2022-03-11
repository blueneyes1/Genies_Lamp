package com.study.springboot.dto;

import java.util.Date;

import lombok.Data;

@Data
public class MemberDto {
	
	private int member_idx;
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_email;
	private int member_email_receive;
	private int member_pw_question;
	private String member_pw_answer;
	private String member_phone;
	private String member_address1;
	private String member_address2;
	private String member_address3;
	private String member_grade;
	private Date member_join_date;
	
	public MemberDto() {
		
	}
	
	
	public MemberDto(int member_idx, String member_id, String member_pw, String member_name, String member_email,
			int member_email_receive, int member_pw_question, String member_pw_answer, String member_phone,
			String member_address1, String member_address2, String member_address3, String member_grade,
			Date member_join_date) {
		super();
		this.member_idx = member_idx;
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_name = member_name;
		this.member_email = member_email;
		this.member_email_receive = member_email_receive;
		this.member_pw_question = member_pw_question;
		this.member_pw_answer = member_pw_answer;
		this.member_phone = member_phone;
		this.member_address1 = member_address1;
		this.member_address2 = member_address2;
		this.member_address3 = member_address3;
		this.member_grade = member_grade;
		this.member_join_date = member_join_date;
	}
	
	

}
