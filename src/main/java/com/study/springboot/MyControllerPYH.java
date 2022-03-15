package com.study.springboot;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.study.springboot.dto.MemberDto;
import com.study.springboot.dto.PayDto;
import com.study.springboot.dto.ProductDto;
import com.study.springboot.dto.Product_reviewDto;
import com.study.springboot.service.BasketService;
import com.study.springboot.service.MemberService;
import com.study.springboot.service.ProductService;
import com.study.springboot.service.fileUploadService;
import com.study.springboot.service.payService;

@Controller
public class MyControllerPYH {
	
	
	@Autowired
	payService payservice;
	
	@Autowired
	MemberService memberservice;
	
	@Autowired
	ProductService productservice;
	
	@Autowired
	BasketService basketservice;
	
	@Autowired
	fileUploadService fileUploadService;
	
//-----------------------------------------------------------------------------------------------------------	
	//파일업로드 설정
	@Bean(name = "multipartResolver")
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		multipartResolver.setMaxUploadSize(200000000);
		multipartResolver.setMaxInMemorySize(200000000);
		multipartResolver.setDefaultEncoding("utf-8");
		return multipartResolver;
	}

	@RequestMapping(value="/uploadMultiFileOk", method = RequestMethod.POST)
	public String uploadMultiFileOk( 
			
			@RequestParam(value="filename", required=false) MultipartFile[] filelist,
			Model model) {
		
		System.out.println("filelist:" + filelist);
		for( MultipartFile file : filelist) {
			System.out.println("filename:" + file);
		}
		
		return "productAddForm"; 
	}
	
	@RequestMapping(value="/uploadOk", method = RequestMethod.POST)
	//required=false : 파라미터가 null로 들어와도 에러발생안함.
	public String uploadOk( @RequestParam(value="user_id", required=false, defaultValue="") String user_id,
							@RequestParam(value="user_pw", required=false, defaultValue="") String user_pw,
							@RequestParam(value="filename", required=false) MultipartFile file,
							Model model) {
		
		System.out.println("user_id:" + user_id);
		System.out.println("user_pw:" + user_pw);
		System.out.println("filename:" + file);
		
		//업로드 파일 처리
		String upload_url = fileUploadService.restore(file);
		// "/upload/20210114121803123.jpg"
		System.out.println( "upload_url:" + upload_url );
		
		if( upload_url != null ) {
			if( upload_url.length() > 0 ) {
				System.out.println("업로드 성공!");
			}else {
				System.out.println("업로드 실패!");	
			}
		}else {
			System.out.println("업로드 실패!");
		}
		
		model.addAttribute("upload_url", upload_url);
		
		
		return "productAddForm"; 
	}
	
//-------------------------------------------------------------------------------------------------------------------	
	
	// 회사 소개  - 회사소개 페이지
	@RequestMapping("/company/company") 
	public String company(Model model) {
		
		return "/company/company";
	}
//---------------------------------------------------------------------------------------------------------------------
	// 회사 소개  - 오시는길 페이지
	@RequestMapping("/company/companyMap") 
	public String companyMap(Model model) {
		
		return "/company/companyMap";
	}

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
	// 관리자 페이지 - 멤버 리스트 페이지
	@RequestMapping("admin/memberList")
	public String memberList(Model model) {
		
		List<MemberDto> list = memberservice.list();
		model.addAttribute("list", list);
		
		return "/admin/memberList";
	}
//------------------------------------------------------------------------------------------------------------------------
	// 관리자 페이지 - 상품 리스트 페이지
	@RequestMapping("admin/product")
	public String product(Model model) {
		
		List<ProductDto> product_list = productservice.product_list();
		model.addAttribute("product_list", product_list);
		
		return "/admin/product";
	}
//------------------------------------------------------------------------------------------------------------------------
	// 관리자 페이지 - 상품 등록 페이지
	@RequestMapping("/admin/productAddForm")
	public String productAdd(Model model) {
		
		return "/admin/productAddForm";
	}
//------------------------------------------------------------------------------------------------------------------------
	// 관리자 페이지 - 상품 이미지 업로드 페이지
		@RequestMapping("/admin/productImgAddForm")
		public String productImgAdd(Model model) {
			
			return "/admin/productImgAddForm";
		}
	
//------------------------------------------------------------------------------------------------------------------------
	// 관리자 페이지 - 상품 등록
	@RequestMapping("/productAddAction")
	@ResponseBody
	public String productAddAction(@RequestParam("product_type") String product_type,
									@RequestParam("product_name") String product_name,
									@RequestParam("product_brand") String product_brand,
									@RequestParam("product_color") String product_color,
									@RequestParam("product_price") String product_price,
									@RequestParam("product_count") String product_count,
									@RequestParam("product_img1") String product_img1,
									@RequestParam("product_img2") String product_img2,
									Model model
									) {
		

		int result = productservice.productAdd
				(product_type, 
				product_name, 
				product_brand, 
				product_color, 
				product_price, 
				product_count, 
				product_img1, 
				product_img2);
		
		if( result == 1 ) {
			return "<script>alert('상품등록을 완료하였습니다.'); location.href='/admin/product';</script>";
		}
		else {		
			return "<script>alert('상품등록에 실패하였습니다.'); history.back(-1);</script>";
		}
		
		

	}
	

//------------------------------------------------------------------------------------------------------------------------
	// 상품 리스트 페이지 - 스탠드등
	@RequestMapping("/product/productList01")
	public String productList01(Model model) {
		
		return "/product/productList01";
	}
//------------------------------------------------------------------------------------------------------------------------	
	// 상품 리스트 페이지 - 레일등
	@RequestMapping("/product/productList02")
	public String productList02(Model model) {
		
		return "/product/productList02";
	}
//------------------------------------------------------------------------------------------------------------------------	
	// 상품 리스트 페이지 - 천장등
	@RequestMapping("/product/productList03")
	public String productList03(Model model) {
		
		
		return "/product/productList03";
	}
//------------------------------------------------------------------------------------------------------------------------	
	// 상품 리스트 페이지 - 벽등
	@RequestMapping("/product/productList04")
	public String productList04(Model model) {
		
		
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
		
		System.out.println(product_idx);
		
		model.addAttribute("product_idx" , product_idx);
		
		
		// 리뷰 보기
		List<Product_reviewDto> review_list = productservice.viewReview(product_idx);
		model.addAttribute("review_list", review_list);
		
		return "/product/productDetail";
	}
//-------------------------------------------------------------------------------------------------------------------------	
	// 리뷰 작성 페이지
	@RequestMapping("/product/reviewActionForm")
	public String reviewActionForm(@RequestParam("review_product_idx") String review_product_idx,
									Model model) {
		
		model.addAttribute("review_product_idx", review_product_idx);
	
		return "/product/reviewActionForm";
	}
//-------------------------------------------------------------------------------------------------------------------------	
	// 리뷰 작성
	@RequestMapping("/reviewAction")
	@ResponseBody
	public String reviewAction(@RequestParam("review_product_idx") String review_product_idx,
								@RequestParam("review_member_id") String review_member_id,
								@RequestParam("review_title") String review_title,
								@RequestParam("review_content") String review_content
								) {
		

		int result = productservice.writeReview(review_product_idx, review_member_id, review_title, review_content);
		
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
	public String mypageMain(HttpServletRequest request,Model model) {
		
		String member_id = (String) request.getSession().getAttribute("member_id");
		
		model.addAttribute("member_id", member_id);
	
		return "/mypage/mypageMain";
	}
//---------------------------------------------------------------------------------------------------------------------------	
	// 마이페이지 - 회원정보수정페이지
	@RequestMapping("/mypage/memberInfo")
	public String memberInfo(HttpServletRequest request, Model model) {
		
		
		String member_id = (String) request.getSession().getAttribute("member_id");
		
		System.out.println(member_id);
		
		if(member_id==null) {	
			model.addAttribute("main", "/mypage/memberInfo.jsp");			
			return "/mypage/memberInfo";
		}else {
			model.addAttribute("dto", memberservice.viewMember(member_id));
			System.out.println(member_id);
	
			model.addAttribute("main", "/mypage/memberInfo.jsp");			
			return "/mypage/memberInfo";
		}
		
		
	}
//---------------------------------------------------------------------------------------------------------------------------
	// 마이페이지 - 회원정보 수정
	@RequestMapping("/memberUpdate")
	@ResponseBody
	public String memberUpdate(@RequestParam("member_id") String member_id, 
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
//-----------------------------------------------------------------------------------------------------------------------------
	// 마이페이지 - 비밀번호 변경 페이지
	@RequestMapping("/mypage/passwordChange")
	public String passwordChangeForm(HttpServletRequest request, Model model) {
		
		String member_id = (String) request.getSession().getAttribute("member_id");
		
		if(member_id==null) {	
			model.addAttribute("main", "/mypage/passwordChange.jsp");			
			return "/mypage/passwordChange";
		}else {
			model.addAttribute("dto", memberservice.viewPassword(member_id));
			System.out.println(member_id);
	
			model.addAttribute("main", "/mypage/passwordChange.jsp");			
			return "/mypage/passwordChange";
		}
		
		
	}
	
//------------------------------------------------------------------------------------------------------------------------------
	// 마이페이지 - 비밀번호 변경
	@RequestMapping("/passwordChangeAction")
	@ResponseBody
	public String passwordChange(@RequestParam("member_id") String member_id,
								@RequestParam("member_pw") String member_pw) {
		
		int result = memberservice.passwordChange(member_id,member_pw);
		if(result == 1) {
			
			return "<script>alert('비밀번호 변경에 성공했습니다.'); location.href='/mypage/passwordChange';</script>";
		}else {
			return "<script>alert('비밀번호 변경에 실패했습니다.'); history.back(-1);</script>";
		}
	}

//--------------------------------------------------------------------------------------------------------------------------
	// 마이페이지 - 장바구니 페이지
	@RequestMapping("/mypage/basket")
	public String basket(HttpServletRequest request, Model model) {
		
		String member_id = (String) request.getSession().getAttribute("member_id");
		
		System.out.println(member_id);
		
		if(member_id==null) {	
			model.addAttribute("main", "/mypage/basket.jsp");			
			return "/mypage/basket";
		}else {
			model.addAttribute("dto", basketservice.viewBasket(member_id));
			System.out.println(member_id);
	
			model.addAttribute("main", "/mypage/basket.jsp");			
			return "/mypage/basket";
		}
	}

}
