package com.study.springboot;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.springboot.dto.MemberDto;
import com.study.springboot.dto.OrderDto;
import com.study.springboot.service.MemberService;
import com.study.springboot.service.OrderService;

@Controller
public class MyControllerLDG {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	OrderService orderService;
	
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
		
		String member_grade = null;
		MemberDto member = memberService.login(member_id, member_pw, member_grade);
		
		if( member != null  ) { // 로그인 성공
			
			
			// 로그인 세션 등록
			member_id = member.getMember_id();
			request.getSession().setAttribute( "member_id", member_id );
			member_grade = member.getMember_grade();
			request.getSession().setAttribute( "member_grade", member_grade );
			
			return "<script>alert('로그인 성공!'); location.href='/';</script>";
		}else { // 로그인 실패
			return "<script>alert('로그인 실패!'); history.back(-1);</script>";
		}
	}
	
	@RequestMapping("/idFind")
	public String idFind(@RequestParam(value="find_member_id", required=false) String find_member_id,
			             Model model) {
		model.addAttribute("find_member_id", find_member_id);
		return "/member/idFind"; // "idFind.jsp" 디스패치
	}
	
	@RequestMapping("/idFindAction") 
	@ResponseBody
	public String idFindAction(@RequestParam("member_name") String member_name,
								@RequestParam("member_email") String member_email,
								HttpServletRequest request) {
		
		String member_id = memberService.idFind(member_name, member_email);
		
		// hasText함수 : null체크? 문자열공백없이 의미있는 문자열있는지?
		if( StringUtils.hasText(member_id) ) {			
			return "<script>alert('아이디를 찾았습니다.'); location.href='/idFind?find_member_id=" + member_id + "';</script>";
		}else {
			return "<script>alert('아이디를 찾을 수 없습니다.'); history.back(-1);</script>";
		}
		
	}
	
	@RequestMapping("/passwordFind")
	public String passwordFind(@RequestParam(value="find_member_pw", required=false) String find_member_pw,
			             Model model) {
		model.addAttribute("find_member_pw", find_member_pw);
		return "/member/passwordFind"; // "passwordFind.jsp" 디스패치
	}
	
	@RequestMapping("/passwordFindAction") 
	@ResponseBody
	public String passwordFindAction(@RequestParam("member_id") String member_id,
									@RequestParam("member_name") String member_name,
								@RequestParam("member_pw_question") String member_pw_question,
								@RequestParam("member_pw_answer") String member_pw_answer,
								HttpServletRequest request) {
				
		String member_pw = memberService.passwordFind(member_id, member_name, member_pw_question, member_pw_answer);
		
		//hasText함수 : null체크? 문자열공백없이 의미있는 문자열있는지?
		if( StringUtils.hasText(member_pw) ) {			
			return "<script>alert('암호를 찾았습니다.'); location.href='/passwordFind?find_member_pw=" + member_pw + "';</script>";
		}else {
			return "<script>alert('암호를 찾을 수 없습니다.'); history.back(-1);</script>";
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
	
	@RequestMapping("/member/idCheckAjax")
	@ResponseBody
	public String idCheckAjax(@RequestParam("member_id") String member_id) {
		
		int result = memberService.idCheckAjax( member_id );
		System.out.println( "result:" + result );
		
		if( result >= 1 ) {
			return "1"; //아이디 중복됨.
		}else {
			return "0"; //아이디 중복안됨.
		}
	}
	
	@RequestMapping("/join2Action")
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
			@RequestParam("member_address1") String member_address1,
			@RequestParam("member_address2") String member_address2,
			@RequestParam("member_address3") String member_address3
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
				member_address1,
				member_address2,
				member_address3
				);
		if( result == 1 ) {
			return "<script>alert('회원가입 되었습니다.'); location.href='/login';</script>";
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
	
	@RequestMapping("/mypage/orderDetails")
	public String orderDetails(HttpServletRequest request, Model model) {
		
		String member_id = (String) request.getSession().getAttribute("member_id");
		
		List<OrderDto> orderDetail = orderService.orderDetail(member_id);
		int order_count = 0;
		
		if( orderDetail.size() > 0 ) {			
			order_count = 1;
		}else {
			order_count = 0;
		}
		
		model.addAttribute("order_count", order_count);
		model.addAttribute("orderDetail", orderDetail);
		
		System.out.println(order_count);
		System.out.println(orderDetail);
		
		model.addAttribute( "mainPage", "mypage/orderDetails.jsp");
		
		return "index"; // "mypage/orderDetails.jsp" 디스패치됨.
		
	}

}
























