package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.MemberDto;

@Mapper
public interface IMemberDao {
	
	public MemberDto login( String member_id, String member_pw, String member_grade );
	public int idCheck( String member_id );
	public List<MemberDto> idFind( String member_name, String member_email );
	public List<MemberDto> passwordFind( String member_id, String member_name, String member_pw_question, String member_pw_answer );
	public int join( String member_id, String member_pw, String member_name,
			String member_email, String member_email_receive, String member_pw_question,
			String member_pw_answer, String member_phone, String member_address1, String member_address2,
			String member_address3 );
	public MemberDto viewMember(String member_id);
	
	public int memberUpdate(String member_id, String member_name, String member_phone, String member_email);
	
	public MemberDto viewPassword(String member_id);
	public int passwordChange(String member_id, String member_pw);

}
