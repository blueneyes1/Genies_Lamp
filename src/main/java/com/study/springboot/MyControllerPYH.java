package com.study.springboot;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.springboot.dto.PayDto;
import com.study.springboot.service.payService;

@Controller
public class MyControllerPYH {
	
	
	@Autowired
	payService payservice;
	
	// 관리자페이지 메인
	@RequestMapping("/admin/adminMain")
	public String adminMain(Model model) {
		
		return "/admin/adminMain";
	}
	
	// 관리자페이지 - 주문관리 페이지
	@RequestMapping("/admin/selectlist")
	public String selectlist(Model model) {
		
		model.addAttribute("mainPage", "admin/selectlist.jsp");
		
			return "/admin/selectlist";
	}
	
	// 관리자페이지 - 주문관리 페이지
	@RequestMapping("/admin/orderlist")
	public String delivery(@RequestParam(value= "pay_delivery") String pay_delivery,
			Model model) {
		
		System.out.println(pay_delivery);
		
		List<PayDto> list = payservice.delivery(pay_delivery);
		model.addAttribute("list", list);
		
		
		return "/admin/orderlist";
	}
	
	// 상품 상세 페이지
	@RequestMapping("/product/productDetail")
	public String productDetail(Model model) {
		
	
		
		return "/product/productDetail";
	}
	
	// 상품 리뷰 페이지
	@RequestMapping("/product/reviewActionForm")
	public String reviewActionForm(Model model) {
		
	
		return "/product/reviewActionForm";
	}
	
	// 리뷰
	@RequestMapping("/reviewAction")
	@ResponseBody
	public String reviewAction() {
		

		
		return "/product/productDetail";
			
	}
	
	// 마이페이지 메인
	@RequestMapping("/mypage/mypageMain")
	public String mypageMain(Model model) {
		
	
		return "/mypage/mypageMain";
	}
	
	// 마이페이지 - 회원정보수정
	@RequestMapping("/mypage/memberInfo")
	public String memberInfo(Model model) {
		
		
		return "/mypage/memberInfo";
	}

}
