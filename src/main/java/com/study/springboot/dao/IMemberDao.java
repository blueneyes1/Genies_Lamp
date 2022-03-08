package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.MemberDto;

@Mapper
public interface IMemberDao {
	
	public int login(String member_id, String member_pw);
	public int join( String member_id, String member_pw, String member_name,
			String member_email, String member_email_receive, String member_pw_question,
			String member_pw_answer, String member_phone, String member_address);
	
	public List<MemberDto> viewMember(String member_id);
	
	public int memberUpdate(String member_id, String member_name, String member_phone, String member_email);

}
