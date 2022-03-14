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
	
	public MemberDto login(String member_id, String member_pw, String member_grade ) {
		MemberDto member = memberDao.login(member_id, member_pw, member_grade);
		
		return member;
						
	}
	
	public String idFind( String member_name, String member_email ) {
		
		List<MemberDto> list = memberDao.idFind( member_name, member_email );
		if ( list != null ) {
			if( list.size() > 0 ) {
				return list.get(0).getMember_id();
			}
		}
		
		return "";
	}
	
	public String passwordFind( String member_id, String member_name, String member_pw_question, String member_pw_answer ) {
		
		List<MemberDto> list = memberDao.passwordFind( member_id, member_name, member_pw_question, member_pw_answer );
		if( list != null ) {
			if( list.size() > 0 ) {
				return list.get(0).getMember_pw();
			}
		}
		return "";
		
	}
	
	public int idCheckAjax( String member_id ) {
			
			int result = memberDao.idCheck( member_id );
			
			return result;
			
		}
	
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
	
	public MemberDto viewMember(String member_id) {
		
		MemberDto member = memberDao.viewMember(member_id);
		
		return member;
	}
	
	public int memberUpdate(String member_id, String member_name, String member_phone, String member_email) {
		
		int result = memberDao.memberUpdate(member_id, member_name, member_phone, member_email);
		
		return result;
	}
	
	public MemberDto viewPassword(String member_id) {
		
		MemberDto member = memberDao.viewPassword(member_id);
		
		return member;
	}
	
	
	public int passwordChange(String member_id, String member_pw) {
		
		int result = 0;
		
		int count = memberDao.passwordChange(member_id,member_pw);
		
		if(count>=1) {
			result = 1;
		}
		
		return result;
	}
	
	public List<MemberDto> list() {
		
		List<MemberDto> list = memberDao.list();
		
		return list;
	}
	

}
