package com.study.springboot;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.springboot.dao.IPayNumber_seqDao;
import com.study.springboot.dto.MemberDto;
import com.study.springboot.dto.OrderDto;
import com.study.springboot.dto.OrderListDto;
import com.study.springboot.service.BasketService;
import com.study.springboot.service.MemberService;
import com.study.springboot.service.OrderService;
import com.study.springboot.service.payService;

@Controller
public class MyControllerLDG {

	@Autowired
	MemberService memberService;

	@Autowired
	OrderService orderService;

	@Autowired
	payService payService;
	
	@Autowired
	BasketService basketService;

	@Autowired
	IPayNumber_seqDao payNumber_seqDao;

	/* 트랜잭션 매니저 초기화1 */
	@Autowired
	PlatformTransactionManager transactionManager;

	/* 트랜잭션 매니저 초기화2 */
	@Autowired
	TransactionDefinition definition;

	@RequestMapping("/")
	public String root() {
		return "redirect:main";
	}

	// 메인 페이지
	@RequestMapping("/main")
	public String main(Model model) {

		model.addAttribute("mainPage", "main.jsp");

		return "index"; // "index.jsp" 디스패치함.
	}

	// 로그인 페이지
	@RequestMapping("/login")
	public String login(HttpServletRequest request, Model model) {

		model.addAttribute("mainPage", "member/login.jsp");

		return "index"; // "member/login.jsp" 디스패치함.
	}

	// 로그인액션
	@RequestMapping("/loginAction")
	@ResponseBody
	public String loginAction(@RequestParam("member_id") String member_id, @RequestParam("member_pw") String member_pw,
			HttpServletRequest request) {

		String member_grade = null;
		MemberDto member = memberService.login(member_id, member_pw, member_grade);

		if (member != null) { // 로그인 성공

			// 로그인 세션 등록
			member_id = member.getMember_id();
			request.getSession().setAttribute("member_id", member_id);
			member_grade = member.getMember_grade();
			request.getSession().setAttribute("member_grade", member_grade);

			return "<script>alert('로그인 성공!'); location.href='/';</script>";
		} else { // 로그인 실패
			return "<script>alert('로그인 실패!'); history.back(-1);</script>";
		}
	}

	// 아이디찾기 페이지
	@RequestMapping("/idFind")
	public String idFind(@RequestParam(value = "find_member_id", required = false) String find_member_id, Model model) {
		model.addAttribute("find_member_id", find_member_id);
		return "/member/idFind"; // "idFind.jsp" 디스패치
	}

	// 아이디찾기 액션
	@RequestMapping("/idFindAction")
	@ResponseBody
	public String idFindAction(@RequestParam("member_name") String member_name,
			@RequestParam("member_email") String member_email, HttpServletRequest request) {

		String member_id = memberService.idFind(member_name, member_email);

		// hasText함수 : null체크? 문자열공백없이 의미있는 문자열있는지?
		if (StringUtils.hasText(member_id)) {

			return "<script>alert('아이디를 찾았습니다.'); location.href='/idFind?find_member_id=" + member_id + "';</script>";
		} else {
			return "<script>alert('아이디를 찾을 수 없습니다.'); history.back(-1);</script>";
		}

	}

	// 비밀번호찾기 페이지
	@RequestMapping("/passwordFind")
	public String passwordFind(@RequestParam(value = "find_member_pw", required = false) String find_member_pw,
			Model model) {
		model.addAttribute("find_member_pw", find_member_pw);
		return "/member/passwordFind"; // "passwordFind.jsp" 디스패치
	}

	// 비밀번호찾기 액션
	@RequestMapping("/passwordFindAction")
	@ResponseBody
	public String passwordFindAction(@RequestParam("member_id") String member_id,
			@RequestParam("member_name") String member_name,
			@RequestParam("member_pw_question") String member_pw_question,
			@RequestParam("member_pw_answer") String member_pw_answer, HttpServletRequest request) {

		String member_pw = memberService.passwordFind(member_id, member_name, member_pw_question, member_pw_answer);

		// hasText함수 : null체크? 문자열공백없이 의미있는 문자열있는지?
		if (StringUtils.hasText(member_pw)) {
			return "<script>alert('암호를 찾았습니다.'); location.href='/passwordFind?find_member_pw=" + member_pw
					+ "';</script>";
		} else {
			return "<script>alert('암호를 찾을 수 없습니다.'); history.back(-1);</script>";
		}

	}

	// 로그아웃 액션
	@RequestMapping("/logoutAction")
	@ResponseBody
	public String logoutAction(HttpServletRequest request) {

		// 세션객체 초기화
		request.getSession().invalidate();

		return "<script>alert('로그아웃 되었습니다.'); location.href='/';</script>";

	}

	// 이용약관 페이지
	@RequestMapping("/join")
	public String join(HttpServletRequest request, Model model) {

		model.addAttribute("mainPage", "member/join.jsp");

		return "index"; // "member/join.jsp" 디스패치함.
	}

	// 아이디 중복여부 확인
	@RequestMapping("/member/idCheckAjax")
	@ResponseBody
	public String idCheckAjax(@RequestParam("member_id") String member_id) {

		int result = memberService.idCheckAjax(member_id);

		if (result >= 1) {
			return "1"; // 아이디 중복됨.
		} else {
			return "0"; // 아이디 중복안됨.
		}
	}

	// 회원가입 페이지
	@RequestMapping("/join2")
	public String join2(HttpServletRequest request, Model model) {

		model.addAttribute("mainPage", "member/join2.jsp");

		return "index"; // "member/join2.jsp" 디스패치함.
	}

	// 회원가입 액션
	@RequestMapping("/join2Action")
	@ResponseBody
	public String join2Action(@RequestParam("member_id") String member_id, @RequestParam("member_pw") String member_pw,
			@RequestParam("member_name") String member_name, @RequestParam("member_email") String member_email,
			@RequestParam("member_email_receive") String member_email_receive,
			@RequestParam("member_pw_question") String member_pw_question,
			@RequestParam("member_pw_answer") String member_pw_answer,
			@RequestParam("member_phone") String member_phone, @RequestParam("member_address1") String member_address1,
			@RequestParam("member_address2") String member_address2,
			@RequestParam("member_address3") String member_address3) {

		int result = memberService.join(member_id, member_pw, member_name, member_email, member_email_receive,
				member_pw_question, member_pw_answer, member_phone, member_address1, member_address2, member_address3);
		if (result == 1) {
			return "<script>alert('회원가입 되었습니다.'); location.href='/login';</script>";
		} else {
			return "<script>alert('회원가입 실패'); history.back(-1);</script>";
		}
	}

	// 마이페이지 - 주문내역
	@RequestMapping("/mypage/orderDetails")
	public String orderDetails(HttpServletRequest request, Model model) {

		String member_id = (String) request.getSession().getAttribute("member_id");

		List<OrderDto> orderDetail = orderService.orderDetail(member_id);
		//int order_count = 0;

		//if (orderDetail.size() > 0) {
		//	order_count = 1;
		//} else {
		//	order_count = 0;
		//}

		//model.addAttribute("order_count", order_count);
		model.addAttribute("orderDetail", orderDetail);

		
		model.addAttribute("mainPage", "mypage/orderDetails.jsp");

		return "index"; // "mypage/orderDetails.jsp" 디스패치됨.

	}

	// 단건구매
	@RequestMapping("/singlePay_{member_id}")
	public String singlePay(@RequestParam("product_idx") String product_idx,
			@RequestParam("product_name") String product_name, @RequestParam("product_price") String product_price,
			@RequestParam("product_count") String product_count, HttpServletRequest request, Model model) {

		// String member_id = (String) request.getSession().getAttribute("member_id");

		List<String> list = new ArrayList<String>();
		ArrayList<String> dto = new ArrayList<>();

		dto.add(product_idx);
		dto.add(product_name);
		dto.add(product_price);
		dto.add(product_count);

		list = dto;

		model.addAttribute("list", list);

		model.addAttribute("mainPage", "order/singlePay.jsp");

		return "index"; // "order/singlepay.jsp" 디스패치함.

	}

	// 단품결제액션
	@RequestMapping("/singlePayAction")
	@ResponseBody
	public String singlePayAction(@RequestParam("pay_receiver") String pay_receiver,
			@RequestParam("pay_phone") String pay_phone, @RequestParam("pay_address1") String pay_address1,
			@RequestParam("pay_address2") String pay_address2, @RequestParam("pay_address3") String pay_address3,
			@RequestParam("pay_message") String pay_message, @RequestParam("pay_cost") String pay_cost,
			@RequestParam("pay_total") String pay_total, @RequestParam("order_product_idx") String order_product_idx,
			@RequestParam("order_product_name") String order_product_name,
			@RequestParam("order_count") String order_count, @RequestParam("order_price") String order_price,
			HttpServletRequest request, Model model) {

		// 트랜잭션 매니저 초기화
		TransactionStatus status = transactionManager.getTransaction(definition);

		String member_id = (String) request.getSession().getAttribute("member_id");

		// 주문번호 Merge
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Calendar cal = Calendar.getInstance();

		// 주문번호 앞 날짜
		String dateOfPayNumber = sdf.format(cal.getTime());

		// 주문번호 뒤 시퀀스
		String seqOfPayNumber = payNumber_seqDao.get_payNumber_seq(dateOfPayNumber).getPay_number_seq();

		// 주문번호 생성
		String pay_number = "S" + dateOfPayNumber + seqOfPayNumber;

		int result = payService.payAction(pay_number, member_id, pay_receiver, pay_phone, pay_address1, pay_address2,
				pay_address3, pay_message, pay_cost, pay_total);

		// insert fail : RollBack
		if (result == 0) {

			transactionManager.rollback(status);
			return "<script>alert('서비스에러1 : 다시 시도해 주세요.'); history.back(-1);</script>";
		}
		
		int result1 = orderService.singleOrder(pay_number, order_product_idx, order_product_name, order_count,
				order_price);
		if (result1 == 0) {
			transactionManager.rollback(status);
			return "<script>alert('서비스에러2 : 다시 시도해 주세요.'); history.back(-1);</script>";

		}

		return "<script>alert('구매해주셔서 감사합니다.'); location.href='/product/productDetail?product_idx=" + order_product_idx
				+ "'; </script>";

	}

	// 결제 페이지
	@RequestMapping("/multiPay_{member_id}")
	public String multiPay(OrderListDto odl, HttpServletRequest request, Model model) {

		model.addAttribute("dto", orderService.orders(odl.getOrderList()));

		model.addAttribute("mainPage", "order/multiPay.jsp");

		return "index"; // "order/multipay.jsp" 디스패치함.
	}

	// 다중구매 액션
	@RequestMapping("/multiPayAction")
	public String multiPayAction(@RequestParam("pay_receiver") String pay_receiver,
									@RequestParam("pay_phone") String pay_phone,
									@RequestParam("pay_address1") String pay_address1,
									@RequestParam("pay_address2") String pay_address2,
									@RequestParam("pay_address3") String pay_address3,
									@RequestParam("pay_message") String pay_message,
									@RequestParam("pay_cost") String pay_cost,
									@RequestParam("pay_total") String pay_total,
									OrderListDto odl, HttpServletRequest request, Model model) {

		// 트랜잭션 매니저 초기화
		TransactionStatus status = transactionManager.getTransaction(definition);

		String member_id = (String) request.getSession().getAttribute("member_id");

		// 주문번호 Merge
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Calendar cal = Calendar.getInstance();

		// 주문번호 앞 날짜
		String dateOfPayNumber = sdf.format(cal.getTime());

		// 주문번호 뒤 시퀀스
		String seqOfPayNumber = payNumber_seqDao.get_payNumber_seq(dateOfPayNumber).getPay_number_seq();

		// 주문번호 생성
		String pay_number = "M" + dateOfPayNumber + seqOfPayNumber;
		System.out.println(pay_number);
		int result = payService.payAction(pay_number, member_id, pay_receiver, pay_phone, pay_address1, pay_address2,
				pay_address3, pay_message, pay_cost, pay_total);

		// insert fail : RollBack
		if (result == 0) {

			transactionManager.rollback(status);
			return "<script>alert('서비스에러1 : 다시 시도해 주세요.'); history.back(-1);</script>";
		}
		
		// model.addAttribute("result", orderService.ods(odl.getOrderList(), pay_number));
		
		
		int result1 = orderService.ods( odl, pay_number);
		
		if (result1 == 0) {
			transactionManager.rollback(status);
			return "<script>alert('서비스에러2 : 다시 시도해 주세요.'); history.back(-1);</script>";

		}
		
		System.out.println(pay_number);

		model.addAttribute("mainPage", "order/confrimOrder.jsp");

		return "index";
	}
	
	@RequestMapping("/mypage_delete_basket")
	public String delete_basket (@RequestParam("basket_idx") String basket_idx) {
		
		int result = basketService.delete_basket(basket_idx);
		if(result == 1) {			
			return "redirect:/mypage/basket";
		}else {
			return "redirect:/mypage/basket";
			//return "<script>alert('장바구니 비우기에 실패했습니다.'); history.back(-1);</script>";
		}
		
	}

}



















