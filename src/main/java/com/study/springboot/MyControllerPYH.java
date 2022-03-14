package com.study.springboot;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.springboot.dto.MemberDto;
import com.study.springboot.dto.PayDto;
import com.study.springboot.dto.ProductDto;
import com.study.springboot.dto.Product_reviewDto;
import com.study.springboot.service.MemberService;
import com.study.springboot.service.ProductService;
import com.study.springboot.service.payService;

@Controller
public class MyControllerPYH {
	
	
	@Autowired
	payService payservice;
	
	@Autowired
	MemberService memberservice;
	
	@Autowired
	ProductService productservice;

//---------------------------------------------------------------------------------------------------------------------
    // 관리자페이지 메인
	@RequestMapping("/admin/adminMain")
	public String adminMain(Model model) {
		
		return "/admin/adminMain";
	}
//----------------------------------------------------------------------------------------------------------------------	
    // 관리자페이지 - 주문관리 선택 페이지
	@RequestMapping("/admin/selectlist")
	public String selectlist(Model model) {
		
		model.addAttribute("mainPage", "admin/selectlist.jsp");
		
			return "/admin/selectlist";
	}
//-----------------------------------------------------------------------------------------------------------------------	
	// 관리자페이지 - 주문관리 페이지
	@RequestMapping("/admin/orderlist")
	public String delivery(@RequestParam(value= "pay_delivery") String pay_delivery,
							Model model) {
		
		System.out.println(pay_delivery);
		
		List<PayDto> list = payservice.delivery(pay_delivery);
		model.addAttribute("list", list);
		
		
		return "/admin/orderlist";
	}
//------------------------------------------------------------------------------------------------------------------------
	// 상품 리스트 페이지 - 스탠드등
	@RequestMapping("/product/productList01")
	public String productList01(Model mode) {
		
		return "/product/productList01";
	}
//------------------------------------------------------------------------------------------------------------------------	
	// 상품 리스트 페이지 - 레일등
	@RequestMapping("/product/productList02")
	public String productList02(Model mode) {
		
		return "/product/productList02";
	}
//------------------------------------------------------------------------------------------------------------------------	
	// 상품 리스트 페이지 - 천장등
	@RequestMapping("/product/productList03")
	public String productList03(Model mode) {
		
		return "/product/productList03";
	}
//------------------------------------------------------------------------------------------------------------------------	
	// 상품 리스트 페이지 - 벽등
	@RequestMapping("/product/productList04")
	public String productList04(Model mode) {
		
		return "/product/productList04";
	}
//------------------------------------------------------------------------------------------------------------------------	
	// 상품 상세 페이지
	@RequestMapping("/product/productDetail")
	public String productDetail(@RequestParam(value="product_idx") String product_idx,
								Model model) {
		
		// 상품 상세 보기
		List<ProductDto> list = productservice.viewProduct(product_idx);
		model.addAttribute("list", list);
		
		// 리뷰 보기
		List<Product_reviewDto> review_list = productservice.viewReview(product_idx);
		model.addAttribute("review_list", review_list);
		
		return "/product/productDetail";
	}
//-------------------------------------------------------------------------------------------------------------------------	
	// 상품 리뷰 페이지
	@RequestMapping("/product/reviewActionForm")
	public String reviewActionForm(Model model) {
		
	
		return "/product/reviewActionForm";
	}
//-------------------------------------------------------------------------------------------------------------------------	
	// 리뷰 작성
	@RequestMapping("/reviewAction")
	@ResponseBody
	public String reviewAction(@RequestParam("review_member_id") String review_member_id,
								@RequestParam("review_title") String review_title,
								@RequestParam("review_content") String review_content,
								@RequestParam("review_product_idx") String review_product_idx) {
		

		int result = productservice.writeReview(review_member_id, review_title, review_content, review_product_idx);
		
		if( result == 1 ) {
			return "<script>alert('리뷰작성을 완료하였습니다.'); location.href='/product/productDetail';</script>";
		}
		else {		
			return "<script>alert('리뷰작성에 실패하였습니다.'); history.back(-1);</script>";
		}
	}
//--------------------------------------------------------------------------------------------------------------------------			
	// 마이페이지 메인
	@RequestMapping("/mypage/mypageMain")
	public String mypageMain(Model model) {
		
	
		return "/mypage/mypageMain";
	}
//---------------------------------------------------------------------------------------------------------------------------	
	// 마이페이지 - 회원정보수정페이지
	@RequestMapping("/mypage/memberInfo")
	public String memberInfo(@RequestParam(value="member_id") String member_id,
							  Model model) {
		
		List<MemberDto> list = memberservice.viewMember(member_id);
		model.addAttribute("list", list);
		
		return "/mypage/memberInfo";
	}
//---------------------------------------------------------------------------------------------------------------------------
	// 마이페이지 - 회원정보 수정
	@RequestMapping("/memberUpdateAction")
	@ResponseBody
	public String memberUpdateAction(@RequestParam("member_id") String member_id, 
							  @RequestParam("member_name") String member_name,
							  @RequestParam("member_phone") String member_phone, 
							  @RequestParam("member_email") String member_email) {
		
		int result = memberservice.memberUpdate(member_id, member_name, member_phone, member_email);
		if(result == 1) {
			
			return "<script>alert('회원정보수정에 성공했습니다.'); location.href='/mypage/memberInfo';</script>";
		}else {
			return "<script>alert('회원정보수정에 실패했습니다.'); history.back(-1);</script>";
		}
	}



}
