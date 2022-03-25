package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.study.springboot.dao.IMemberDao;
import com.study.springboot.dto.MemberDto;

@Component
public class MemberService {
	
	@Autowired
	IMemberDao memberDao;
	
	// 로그인 (LDG)
	public MemberDto login(String member_id, String member_pw, String member_grade ) {
		MemberDto member = memberDao.login(member_id, member_pw, member_grade);
		
		return member;
						
	}
	
	// 아이디찾기 (LDG)
	public String idFind( String member_name, String member_email ) {
		
		List<MemberDto> list = memberDao.idFind( member_name, member_email );
		if ( list != null ) {
			if( list.size() > 0 ) {
				return list.get(0).getMember_id();
			}
		}
		
		return "";
	}
	
	// 비밀번호 찾기 (LDG)
	public String passwordFind( String member_id, String member_name, String member_pw_question, String member_pw_answer ) {
		
		List<MemberDto> list = memberDao.passwordFind( member_id, member_name, member_pw_question, member_pw_answer );
		if( list != null ) {
			if( list.size() > 0 ) {
				return list.get(0).getMember_pw();
			}
		}
		return "";
		
	}
	
	// 아이디 중복체크 (LDG)
	public int idCheckAjax( String member_id ) {
			
			int result = memberDao.idCheck( member_id );
			
			return result;
			
		}
	
	// 회원가입  (LDG)
	public int join( String member_id, String member_pw, String member_name,
			String member_email, String member_email_receive, String member_pw_question,
			String member_pw_answer, String member_phone, String member_address1, 
			String member_address2, String member_address3 ) {
		int result = memberDao.join(
				member_id,
				member_pw,
				member_name,
				member_email,
				member_email_receive,
				member_pw_question,
				member_pw_answer,
				member_phone,
				member_address1,
				member_address2,
				member_address3
				);
		return result;		
	}
	
	// 마이페이지 회원정보 보기 (PYH)
	public MemberDto viewMember(String member_id) {
		
		MemberDto member = memberDao.viewMember(member_id);
		
		return member;
	}
	
	// 마이페이지 회원정보 수정 (PYH)
	public int memberUpdate(String member_id, String member_name, String member_phone, String member_email
			,String member_address1,String member_address2,String member_address3) {
		
		int result = memberDao.memberUpdate(member_id, member_name, member_phone, member_email, 
											member_address1, member_address2, member_address3);
		
		return result;
	}
	
	// 마이페이지 비밀번호 보기 (PYH)
	public MemberDto viewPassword(String member_id) {
		
		MemberDto member = memberDao.viewPassword(member_id);
		
		return member;
	}
	
	// 마이페이지 비밀번호 수정 (PYH)
	public int passwordChange(String member_id, String member_pw) {
		
		int result = 0;
		
		int count = memberDao.passwordChange(member_id,member_pw);
		
		if(count>=1) {
			result = 1;
		}
		
		return result;
	}
	
	// 관리자페이지 회원 리스트 (PYH)
	public List<MemberDto> list() {
		
		List<MemberDto> list = memberDao.list();
		
		return list;
	}
	
	// 관리자페이지 회원정보 수정 페이지 (PYH)
	public MemberDto admin_view_member(String member_id) {
		
		MemberDto admin_member_dto = memberDao.admin_view_member(member_id);
		
		return admin_member_dto;
	}
	
	// 관리자페이지 회원정보 수정 (PYH)
	public int admin_member_modify(String member_id, String member_name, String member_email, 
			String member_phone, String member_address1,String member_address2,String member_address3, String member_grade) {
		
		int result = memberDao.admin_member_modify(member_id, member_name, member_email, member_phone,
				member_address1, member_address2, member_address3, member_grade);
		
		return result;
		
	}
	
	// 관리자페이지 회원정보 삭제 (PYH)
	public int admin_member_delete(String member_id) {
		
		int result = memberDao.admin_member_delete(member_id);
		
		return result;
	}
}
