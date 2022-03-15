package com.study.springboot;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.springboot.dao.IBasketDao;
import com.study.springboot.dto.BasketDto;
import com.study.springboot.dto.MemberDto;
import com.study.springboot.dto.PayDto;
import com.study.springboot.dto.ProductDto;
import com.study.springboot.dto.OrderDto;

import com.study.springboot.service.BasketService;
import com.study.springboot.service.MemberService;
import com.study.springboot.service.payService;
import com.study.springboot.service.ProductService;
import com.study.springboot.service.OrderService;




@Controller
public class MyControllerPJW {

	@Autowired
	private IBasketDao shoppingCartDao;
	
	@Autowired
	payService payservice;
	
	@Autowired
	MemberService memberservice;
	
	@Autowired
	ProductService productservice;
	
	@Autowired
	BasketService basketservice;
	
	@Autowired
	OrderService orderService;
	

	//장바구니
	
	@RequestMapping("/cart")
	public String cart(Model model,HttpServletRequest request) {
		
		System.out.println("  line: " + new Throwable().getStackTrace()[0].getLineNumber() + " [MyControllerPJW] cart");
		
		String uid = (String) request.getSession().getAttribute("member_id");
		
		if(uid==null) {
			return "<script>alert('로그인이 필요한 기능입니다');</script>";
		}else {
			model.addAttribute("mainPage", "mypage/basket.jsp");
			return "index";
		}
	}
	
	
	//빈장바구니 폼
	
	@RequestMapping("/emptyCart")
	public String emptyCart(Model model, HttpServletRequest request) {
		
		System.out.println("  line: " + new Throwable().getStackTrace()[0].getLineNumber() + " [MyControllerPJW] emptyCart");
		String uid = (String) request.getSession().getAttribute("basket_member_id");
		
		if(uid==null) {
			return "<script>alert('로그인이 필요한 기능입니다');</script>";
		}else {
			model.addAttribute("mainPage", "mypage/basket.jsp");
			return "index";
			
		}
		
	}

	//장바구니 - 추가
	
	@RequestMapping("/cart_insert_action")
	public String cart_insert_action(@RequestParam("basket_product_idx") String basket_product_idx,
									 @RequestParam("number_of_products") int number_of_products,
									 HttpServletRequest request) {
		
		System.out.println("  line: " + new Throwable().getStackTrace()[0].getLineNumber() + " [MyControllerPJW] cart_insert_action");
		
		String uid = (String) request.getSession().getAttribute("basket_member_id");
		//상품이 이미 장바구니에 담겼을경우
		
		if(shoppingCartDao.cart_count(basket_product_idx,uid)==1) {
			return "<script>alert('이미 추가한 상품입니다');</script>";
		//비로그인 사용자
			
		}else if(uid==null){
			return "<script>alert('로그인이 필요한 기능입니다');</script>";
		}else {
			int result = shoppingCartDao.cart_insert_action(uid, basket_product_idx, number_of_products);
			System.out.println(result);
			
			return "<script>alert('상품이 장바구니에 담겼습니다');</script>";
		}
		
	}
	
	// ********************************************
	// *            장바구니 - 삭제               *
	// ********************************************
	@RequestMapping("/cart_delete_action")
	public String cart_delete_action(@RequestParam("basket_product_idx") List<String> basket_product_idxs,
									 HttpServletRequest request) {
		
		System.out.println("  line: " + new Throwable().getStackTrace()[0].getLineNumber() + " [MyControllerPJW] cart_delete_action");
		
		String uid = (String) request.getSession().getAttribute("basket_member_id");
		
		System.out.println(basket_product_idxs);
		
		for(String basket_product_idx : basket_product_idxs) {
			shoppingCartDao.cart_delete_action(basket_product_idx,uid);
		}
		
		return "redirect:/cart";
		
	}
	
	

}
