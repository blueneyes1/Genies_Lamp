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
	
	public int login(String member_id, String member_pw) {
		
		int result = 0;
		
		int count = memberDao.login(member_id, member_pw);
		if (count>=1) {
			result = 1;
		}
		
		return result;
		
	}
	
	public int join( String member_id, String member_pw, String member_name,
			String member_email, String member_email_receive, String member_pw_question,
			String member_pw_answer, String member_phone, String member_address) {
		int result = memberDao.join(
				member_id,
				member_pw,
				member_name,
				member_email,
				member_email_receive,
				member_pw_question,
				member_pw_answer,
				member_phone,
				member_address
				);
		return result;		
	}
	
	public List<MemberDto> viewMember(String member_id) {
		
		List<MemberDto> list = memberDao.viewMember(member_id);
		
		return list;
	}
	
	public int memberUpdate(String member_id, String member_name, String member_phone, String member_email) {
		
		int result = memberDao.memberUpdate(member_id, member_name, member_phone, member_email);
		
		return result;
	}
	

}
