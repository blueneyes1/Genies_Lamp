package com.study.springboot;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.springboot.service.MemberService;

@Controller
public class MyControllerLDG {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping("/")
	public String root() {
		return "redirect:main";
	}
	
	@RequestMapping("/main")
	public String main( Model model) {
		
		model.addAttribute("mainPage", "main.jsp");
		
		return "index"; // "index.jsp" 디스패치함.
	}
	
	@RequestMapping("/login")
	public String login(HttpServletRequest request, Model model) {
		
		model.addAttribute("mainPage", "member/login.jsp");
		
		return "index"; // "member/login.jsp" 디스패치함.
	}
	
	@RequestMapping("/loginAction")
	@ResponseBody
	public String loginAction(@RequestParam("member_id") String member_id, 
								@RequestParam("member_pw") String member_pw,
								HttpServletRequest request) {
		
		int result = memberService.login(member_id, member_pw);
		if(result == 1) { // 로그인 성공
			
			// 로그인 세션 등록
			request.getSession().setAttribute( "member_id", member_id );
			
			return "<script>alert('로그인 성공!'); location.href='/';</script>";
		}else { // 로그인 실패
			return "<script>alert('로그인 실패!'); history.back(-1);</script>";
		}
	}
	
	@RequestMapping("/logoutAction")
	@ResponseBody
	public String logoutAction(HttpServletRequest request) {
		
		// 세션객체 초기화
		request.getSession().invalidate();
		
		return "<script>alert('로그아웃 되었습니다.'); location.href='/';</script>";
		
	}
	
	@RequestMapping("/join")
	public String join(HttpServletRequest request, Model model) {
		
		model.addAttribute("mainPage", "member/join.jsp");
		
		return "index"; // "member/join.jsp" 디스패치함.
	}
	
	@RequestMapping("join2Action")
	@ResponseBody
	public String join2Action(
			@RequestParam("member_id") String member_id,
			@RequestParam("member_pw") String member_pw,
			@RequestParam("member_name") String member_name,
			@RequestParam("member_email") String member_email,
			@RequestParam("member_email_receive") String member_email_receive,
			@RequestParam("member_pw_question") String member_pw_question,
			@RequestParam("member_pw_answer") String member_pw_answer,
			@RequestParam("member_phone") String member_phone,
			@RequestParam("member_address") String member_address
			) {
	
		int result = memberService.join(
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
		if( result == 1 ) {
			return "<script>alert('회원가입 되었습니다.'); location.href='/member/login';</script>";
		}
		else {		
			return "<script>alert('회원가입 실패'); history.back(-1);</script>";
		}
	}
	
	
	@RequestMapping("/join2")
	public String join2(HttpServletRequest request, Model model) {
		
		model.addAttribute("mainPage", "member/join2.jsp");
		
		return "index"; // "member/join2.jsp" 디스패치함.
	}

}
