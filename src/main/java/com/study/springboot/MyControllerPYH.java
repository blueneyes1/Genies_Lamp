package com.study.springboot;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.study.springboot.dto.PayDto;
import com.study.springboot.service.payService;

@Controller
public class MyControllerPYH {
	
	
	@Autowired
	payService payservice;
	
	
	@RequestMapping("/admin/selectlist")
	public String selectlist(Model model) {
		
		model.addAttribute("mainPage", "admin/selectlist.jsp");
		
			return "/admin/selectlist";
	}
	
	@RequestMapping("/admin/orderlist")
	public String delivery(@RequestParam(value= "pay_delivery") String pay_delivery,
			Model model) {
		
		System.out.println(pay_delivery);
		
		List<PayDto> list = payservice.delivery(pay_delivery);
		model.addAttribute("list", list);
		
		
		return "/admin/orderlist";
	}

}
