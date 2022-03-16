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
	
	// 마이페이지 회원정보 보기 (PYH)
	public MemberDto viewMember(String member_id);
	
	// 마이페이지 회원정보 수정 (PYH)
	public int memberUpdate(String member_id, String member_name, String member_phone, String member_email);
	
	// 마이페이지 비밀번호 보기 (PYH)
	public MemberDto viewPassword(String member_id);
	
	// 마이페이지 비밀번호 수정 (PYH)
	public int passwordChange(String member_id, String member_pw);
	
	// 관리자페이지 회원 리스트 (PYH)
	public List<MemberDto> list();
	
	// 관리자페이지 회원 정보 수정 페이지 (PYH)
	public MemberDto admin_view_member(String member_id);
	
	// 관리자페이지 회원 정보 수정 (PYH)
	public int admin_member_modify(String member_id, String member_name, String member_email, 
							String member_phone, String member_address1, String member_grade);
	
	// 관리자페이지 회원 정보 삭제 (PYH)
	public int admin_member_delete(String member_id);
	
}
