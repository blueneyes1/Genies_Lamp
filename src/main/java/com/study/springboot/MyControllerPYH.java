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
	

//-------------------------------------------------------------------------------------------------------------------	
	// 회사 소개  - 회사소개 페이지
	@RequestMapping("/company/company") 
	public String company(HttpServletRequest request,Model model) {
		
		model.addAttribute("mainPage", "company/company.jsp");
		
		return "index";
	}
//---------------------------------------------------------------------------------------------------------------------
	// 회사 소개  - 오시는길 페이지
	@RequestMapping("/company/companyMap") 
	public String companyMap(HttpServletRequest request,Model model) {
		
		model.addAttribute("mainPage", "company/companyMap.jsp");
		
		return "index";
	}

//---------------------------------------------------------------------------------------------------------------------
    // 관리자페이지 메인
	@RequestMapping("/admin/adminMain")
	public String adminMain(HttpServletRequest request,Model model) {
		
		model.addAttribute("mainPage", "admin/adminMain.jsp");
		
		return "index";
	}
//----------------------------------------------------------------------------------------------------------------------	
    // 관리자페이지 - 주문관리 선택 페이지
	@RequestMapping("/admin/selectlist")
	public String selectlist(HttpServletRequest request,Model model) {
		
		model.addAttribute("mainPage", "admin/selectlist.jsp");
		
			return "index";
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
	public String memberList(HttpServletRequest request,Model model) {
		
		List<MemberDto> list = memberservice.list();
		model.addAttribute("list", list);
		
		model.addAttribute("mainPage", "admin/memberList.jsp");
		
		return "index";
	}
	
//------------------------------------------------------------------------------------------------------------------------
	// 관리자 페이지 - 멤버 수정/삭제 페이지
	@RequestMapping("/admin/memberModify")
	public String memberModify(@RequestParam(value= "member_id") String member_id,
								HttpServletRequest request,Model model) {
		
		MemberDto admin_member_dto = memberservice.admin_view_member(member_id);
		model.addAttribute("admin_member_dto", admin_member_dto);
		
		model.addAttribute("mainPage", "admin/memberModify.jsp");
		
		return "index";
	}
//------------------------------------------------------------------------------------------------------------------------
	// 관리자페이지 - 회원정보 수정
	@RequestMapping("/admin_member_update")
	@ResponseBody
	public String admin_member_modify(@RequestParam("member_id") String member_id, 
							  @RequestParam("member_name") String member_name,
							  @RequestParam("member_email") String member_email,
							  @RequestParam("member_phone") String member_phone, 
							  @RequestParam("member_address1") String member_address1, 
							  @RequestParam("member_grade") String member_grade
							  ) {
		
		int result = memberservice.admin_member_modify(member_id, member_name, member_email, member_phone, member_address1, member_grade);
		if(result == 1) {
			
			return "<script>alert('회원정보수정에 성공했습니다.'); location.href='/admin/memberList';</script>";
		}else {
			return "<script>alert('회원정보수정에 실패했습니다.'); history.back(-1);</script>";
		}
	}
//-----------------------------------------------------------------------------------------------------------------------------
	// 관리자페이지 - 회원정보 삭제
	@RequestMapping("/admin_member_delete")
	@ResponseBody
	public String admin_member_delete(@RequestParam("member_id") String member_id) {
		
		int result = memberservice.admin_member_delete(member_id);
		if(result == 1) {
			
			return "<script>alert('회원정보삭제에 성공했습니다.'); location.href='/admin/memberList';</script>";
		}else {
			return "<script>alert('회원정보삭제에 실패했습니다.'); history.back(-1);</script>";
		}
	}
//-----------------------------------------------------------------------------------------------------------------------------
	// 관리자 페이지 - 상품 리스트 페이지
	@RequestMapping("admin/product")
	public String product(HttpServletRequest request,Model model) {
		
		List<ProductDto> product_list = productservice.product_list();
		model.addAttribute("product_list", product_list);
		
		model.addAttribute("mainPage", "admin/product.jsp");
		
		return "index";
	}
//------------------------------------------------------------------------------------------------------------------------
	// 관리자 페이지 - 상품 등록 페이지
	@RequestMapping("/admin/productAddForm")
	public String productAdd(Model model) {
		
		return "/admin/productAddForm";
	}
//------------------------------------------------------------------------------------------------------------------------
	// 관리자 페이지 - 상품 등록
	
	//파일업로드 설정
		@Bean(name = "multipartResolver")
		public CommonsMultipartResolver multipartResolver() {
			CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
			multipartResolver.setMaxUploadSize(200000000);
			multipartResolver.setMaxInMemorySize(200000000);
			multipartResolver.setDefaultEncoding("utf-8");
			return multipartResolver;
		}
		
	// 상품 등록
	@RequestMapping(value="/uploadOk", method = RequestMethod.POST)
	//required=false : 파라미터가 null로 들어와도 에러발생안함.
	public String uploadOk( @RequestParam(value="product_type", required=false, defaultValue="") String product_type,
			@RequestParam(value="product_name", required=false, defaultValue="") String product_name,
			@RequestParam(value="product_brand", required=false, defaultValue="") String product_brand,
			@RequestParam(value="product_color", required=false, defaultValue="") String product_color,
			@RequestParam(value="product_price", required=false, defaultValue="") String product_price,
			@RequestParam(value="product_count", required=false, defaultValue="") String product_count,
			@RequestParam(value="filename", required=false) MultipartFile file,
			@RequestParam(value="product_content", required=false, defaultValue="") String product_content,
							Model model) {
		
		
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
		
		int result = productservice.productAdd(product_type, product_name, 
				product_brand, product_color, product_price, product_count,  upload_url , product_content);
		
		if(result == 1) {
			
			return "redirect:/admin/productAddForm";
		}else {
			return "<script>alert('상품등록에 실패했습니다.'); history.back(-1);</script>";
		}
		
		
	}
//------------------------------------------------------------------------------------------------------------------------
	// 관리자 페이지 - 상품 정보 수정/삭제 페이지
	@RequestMapping("/admin/productModify")
	public String productModify(@RequestParam(value= "product_idx") String product_idx,
								HttpServletRequest request,Model model) {
		
		ProductDto admin_view_product_dto = productservice.admin_view_product(product_idx);
		model.addAttribute("admin_view_product_dto", admin_view_product_dto);
		
		model.addAttribute("mainPage", "admin/productModify.jsp");
		
		return "index";
	}

//---------------------------------------------------------------------------------------------------------------------
	
	// 관리자페이지 - 상품 정보 수정
	@RequestMapping("/admin_product_modify")
	@ResponseBody
	public String admin_product_modify(@RequestParam("product_idx") String product_idx,
										@RequestParam("product_type") String product_type, 
										@RequestParam("product_name") String product_name, 
										@RequestParam("product_brand") String product_brand, 
										@RequestParam("product_color") String product_color, 
										@RequestParam("product_price") String product_price,
										@RequestParam("product_count") String product_count,
										@RequestParam("product_content") String product_content) {
		
		int result = productservice.admin_product_modify(product_idx, product_type, 
				product_name, product_brand, product_color, product_price, product_count, product_content);
				
				
		if(result == 1) {
			
			return "<script>alert('상품정보수정에 성공했습니다.'); location.href='/admin/product';</script>";
		}else {
			return "<script>alert('상품정보수정에 실패했습니다.'); history.back(-1);</script>";
		}
	}
//-----------------------------------------------------------------------------------------------------------------------------
	// 관리자페이지 - 상품 정보 삭제
	@RequestMapping("/admin_product_delete")
	@ResponseBody
	public String admin_product_delete(@RequestParam("product_idx") String product_idx) {
		
		int result = productservice.admin_product_delete(product_idx);
		if(result == 1) {
			
			return "<script>alert('상품정보삭제에 성공했습니다.'); location.href='/admin/product';</script>";
		}else {
			return "<script>alert('상품정보삭제에 실패했습니다.'); history.back(-1);</script>";
		}
	}
//------------------------------------------------------------------------------------------------------------------------
	// 관리자 페이지 - 상품평 관리 페이지
	@RequestMapping("/admin/reviewlist")
	public String product_review(HttpServletRequest request,Model model) {
		
		List<Product_reviewDto> admin_view_review = productservice.admin_view_review();
		model.addAttribute("admin_view_review", admin_view_review);
		
		model.addAttribute("mainPage", "admin/reviewlist.jsp");
		
		return "index";
	}
//------------------------------------------------------------------------------------------------------------------------
	// 관리자페이지 - 상품평 삭제
	@RequestMapping("/admin_review_delete_action")
	@ResponseBody
	public String admin_review_delete(@RequestParam("review_idx") String review_idx) {
		
		int result = productservice.admin_review_delete(review_idx);
		if(result == 1) {
			
			return "<script>alert('상품평삭제에 성공했습니다.'); location.href='/admin/reviewlist';</script>";
		}else {
			return "<script>alert('상품평삭제에 실패했습니다.'); history.back(-1);</script>";
		}
	}
//------------------------------------------------------------------------------------------------------------------------	
	// 상품 리스트 페이지 - 스탠드등
	@RequestMapping("/product/productList01")
	public String productList01(@RequestParam(value="product_type",required=false) String product_type,
									@RequestParam(value="page",required=false) String page,
									HttpServletRequest request,
									Model model) {
		
		if( page == null ) {
			page = "1";
		}
		
		System.out.println("page:" + page);
		model.addAttribute("page", page);
		
		int num_page_no = Integer.parseInt( page ); //page번호 1,2,3,4
		int num_page_size = 5; //한페이지당 Row갯수
		int startRowNum = (num_page_no - 1) * num_page_size + 1; // 1, 6, 11 페이지 시작 줄번호
		int endRowNum = (num_page_no * num_page_size);           // 5, 10, 15 페이지 끝 줄번호
		
		// row 1~5 까지...
		List<ProductDto> product_listPage = productservice.product_listPage(product_type, String.valueOf(startRowNum), String.valueOf(endRowNum));
		model.addAttribute("product_listPage", product_listPage);
		
		
		model.addAttribute("mainPage", "product/productList01.jsp");
		
		return "index";
	}
//------------------------------------------------------------------------------------------------------------------------	
	// 상품 리스트 페이지 - 레일등
	@RequestMapping("/product/productList02")
	public String productList02(@RequestParam(value="product_type",required=false) String product_type,
			@RequestParam(value="page",required=false) String page,
			HttpServletRequest request,
			Model model) {
		
		if( page == null ) {
			page = "1";
		}
		
		System.out.println("page:" + page);
		model.addAttribute("page", page);
		
		int num_page_no = Integer.parseInt( page ); //page번호 1,2,3,4
		int num_page_size = 5; //한페이지당 Row갯수
		int startRowNum = (num_page_no - 1) * num_page_size + 1; // 1, 6, 11 페이지 시작 줄번호
		int endRowNum = (num_page_no * num_page_size);           // 5, 10, 15 페이지 끝 줄번호
		
		// row 1~5 까지...
		List<ProductDto> product_listPage = productservice.product_listPage(product_type, String.valueOf(startRowNum), String.valueOf(endRowNum));
		model.addAttribute("product_listPage", product_listPage);
		
		
		model.addAttribute("mainPage", "product/productList02.jsp");
		
		return "index";
	}
//------------------------------------------------------------------------------------------------------------------------	
	// 상품 리스트 페이지 - 천장등
	@RequestMapping("/product/productList03")
	public String productList03(@RequestParam(value="product_type",required=false) String product_type,
			@RequestParam(value="page",required=false) String page,
			HttpServletRequest request,
			Model model) {
		
		if( page == null ) {
			page = "1";
		}
		
		System.out.println("page:" + page);
		model.addAttribute("page", page);
		
		int num_page_no = Integer.parseInt( page ); //page번호 1,2,3,4
		int num_page_size = 5; //한페이지당 Row갯수
		int startRowNum = (num_page_no - 1) * num_page_size + 1; // 1, 6, 11 페이지 시작 줄번호
		int endRowNum = (num_page_no * num_page_size);           // 5, 10, 15 페이지 끝 줄번호
		
		// row 1~5 까지...
		List<ProductDto> product_listPage = productservice.product_listPage(product_type, String.valueOf(startRowNum), String.valueOf(endRowNum));
		model.addAttribute("product_listPage", product_listPage);
		
		
		model.addAttribute("mainPage", "product/productList03.jsp");
		
		return "index";
	}
//------------------------------------------------------------------------------------------------------------------------	
	// 상품 리스트 페이지 - 벽등
	@RequestMapping("/product/productList04")
	public String productList04(@RequestParam(value="product_type",required=false) String product_type,
			@RequestParam(value="page",required=false) String page,
			HttpServletRequest request,
			Model model) {
		
		
		if( page == null ) {
			page = "1";
		}
		
		System.out.println("page:" + page);
		model.addAttribute("page", page);
		
		int num_page_no = Integer.parseInt( page ); //page번호 1,2,3,4
		int num_page_size = 5; //한페이지당 Row갯수
		int startRowNum = (num_page_no - 1) * num_page_size + 1; // 1, 6, 11 페이지 시작 줄번호
		int endRowNum = (num_page_no * num_page_size);           // 5, 10, 15 페이지 끝 줄번호
		
		// row 1~5 까지...
		List<ProductDto> product_listPage = productservice.product_listPage(product_type, String.valueOf(startRowNum), String.valueOf(endRowNum));
		model.addAttribute("product_listPage", product_listPage);
		
		
		model.addAttribute("mainPage", "product/productList04.jsp");
		
		return "index";
	}
//------------------------------------------------------------------------------------------------------------------------	
	// 상품 상세 페이지
	@RequestMapping("/product/productDetail")
	public String productDetail(@RequestParam(value="product_idx") String product_idx,
								HttpServletRequest request,
								Model model) {
		
		// 상품 상세 보기
		List<ProductDto> list = productservice.viewProduct(product_idx);
		model.addAttribute("list", list);
		
		System.out.println(product_idx);
		
		model.addAttribute("product_idx" , product_idx);
		
		model.addAttribute("mainPage", "product/productDetail.jsp");
		
		String member_id = (String) request.getSession().getAttribute("member_id");
		
		// 리뷰 보기
		List<Product_reviewDto> review_list = productservice.viewReview(product_idx);
		model.addAttribute("review_list", review_list);
		
		
		return "index";
	}
	
//------------------------------------------------------------------------------------------------------------------------------
	// 제품 상세 페이지 - 장바구니 추가
	@RequestMapping("/basketAdd")
	@ResponseBody
	public String basketAdd(@RequestParam("product_idx") String product_idx,
							@RequestParam("product_count") String product_count,
							@RequestParam("product_price") String product_price,
											HttpServletRequest request) {
		
		String member_id = (String) request.getSession().getAttribute("member_id");
		
		int result = basketservice.basketAdd(member_id, product_idx, product_count, product_price);
		if(result == 1) {
			
			return "<script>alert('제품을 장바구니에 넣었습니다.'); location.href='/mypage/basket';</script>";
		}else {
			return "<script>alert('제품을 장바구니에 넣기 실패했습니다.'); history.back(-1);</script>";
		}
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
	@RequestMapping(value="/reviewAction", method = RequestMethod.POST)
	public String reviewAction( @RequestParam(value="review_product_idx", required=false, defaultValue="") String review_product_idx,
			@RequestParam(value="review_member_id", required=false, defaultValue="") String review_member_id,
			@RequestParam(value="filename", required=false) MultipartFile file,
			@RequestParam(value="review_title", required=false, defaultValue="") String review_title,
			@RequestParam(value="review_content", required=false, defaultValue="") String review_content,
			HttpServletRequest request,
							Model model) {
		
		
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
		
		int result = productservice.writeReview(review_product_idx, review_member_id, upload_url, review_title, review_content);
		
		if(result == 1) {
			
			return "<script>alert('리뷰 등록에 성공했습니다.'); location.href='/product/reviewActionForm';</script>";
		}else {
			return "<script>alert('리뷰 등록에 실패했습니다.'); history.back(-1);</script>";
		}
	}
//--------------------------------------------------------------------------------------------------------------------------
	// 마이페이지 메인
	@RequestMapping("/mypage/mypageMain")
	public String mypageMain(HttpServletRequest request,Model model) {
		
		String member_id = (String) request.getSession().getAttribute("member_id");
		
		model.addAttribute("member_id", member_id);
		
		model.addAttribute("mainPage", "mypage/mypageMain.jsp");
	
		return "index";
	}
//---------------------------------------------------------------------------------------------------------------------------	
	// 마이페이지 - 회원정보수정페이지
	@RequestMapping("/mypage/memberInfo")
	public String memberInfo(HttpServletRequest request, Model model) {
		
		
		String member_id = (String) request.getSession().getAttribute("member_id");
		
		System.out.println(member_id);
		
		
		if(member_id==null) {	
			model.addAttribute("mainPage", "mypage/memberInfo.jsp");			
			return "index";
		}else {
			model.addAttribute("dto", memberservice.viewMember(member_id));
			System.out.println(member_id);
	
			model.addAttribute("mainPage", "mypage/memberInfo.jsp");			
			return "index";
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
			model.addAttribute("mainPage", "mypage/passwordChange.jsp");			
			return "/mypage/passwordChange";
		}else {
			model.addAttribute("dto", memberservice.viewPassword(member_id));
			System.out.println(member_id);
	
			model.addAttribute("mainPage", "mypage/passwordChange.jsp");			
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
			model.addAttribute("mainPage", "mypage/basket.jsp");			
			return "index";
		}else {
			model.addAttribute("basket_list", basketservice.viewBasket(member_id));
			System.out.println(member_id);
	
			model.addAttribute("mainPage", "mypage/basket.jsp");			
			return "index";
		}
	}

//------------------------------------------------------------------------------------------------------------------------------
	// 마이페이지 - 장바구니 비우기
	@RequestMapping("/mypage_basket_delete")
	@ResponseBody
	public String basket_delete(HttpServletRequest request) {
		
		String member_id = (String) request.getSession().getAttribute("member_id");
		
		int result = basketservice.basket_delete(member_id);
		if(result == 1) {
			
			return "<script>alert('장바구니 비우기에 성공했습니다.'); location.href='/mypage/basket';</script>";
		}else {
			return "<script>alert('장바구니 비우기에 실패했습니다.'); history.back(-1);</script>";
		}
	}
//-----------------------------------------------------------------------------------------------------------------------------
	// 마이페이지 - 내가 작성한 상품평 페이지
	@RequestMapping("/mypage/myReviewList")
	public String myReviewList(HttpServletRequest request, Model model) {
		
		String member_id = (String) request.getSession().getAttribute("member_id");
		
		System.out.println(member_id);
		
		if(member_id==null) {	
			model.addAttribute("mainPage", "mypage/myReviewList.jsp");			
			return "index";
		}else {
			model.addAttribute("mypage_view_review", productservice.mypage_view_review(member_id));
			System.out.println(member_id);
	
			model.addAttribute("mainPage", "mypage/myReviewList.jsp");			
			return "index";
		}
	}
//-----------------------------------------------------------------------------------------------------------------------
	// 마이페이지 - 내가 작성한 상품평 페이지 - 리뷰 수정/삭제 페이지
	@RequestMapping("/mypage/myReviewModify")
	public String myReviewModify(@RequestParam("review_idx") String review_idx,
								HttpServletRequest request, Model model) {
		
		String member_id = (String) request.getSession().getAttribute("member_id");
		
		System.out.println(member_id);
		
		if(member_id==null) {	
			model.addAttribute("mainPage", "mypage/myReviewModify.jsp");			
			return "index";
		}else {
			model.addAttribute("mypage_view_modify_review", productservice.mypage_view_modify_review(member_id, review_idx));
			System.out.println(member_id);
			
			model.addAttribute("mainPage", "mypage/myReviewModify.jsp");			
			return "index";
		}
	}
//-----------------------------------------------------------------------------------------------------------------------
	// 마이페이지 - 내가 작성한 상품평 - 수정
	@RequestMapping("/mypage_review_modify")
	@ResponseBody
	public String mypage_review_update(@RequestParam("review_product_idx") String review_product_idx,
			@RequestParam("review_title") String review_title,
			@RequestParam("review_content") String review_content,
			HttpServletRequest request) {
		
		String member_id = (String) request.getSession().getAttribute("member_id");
		
		int result = productservice.mypage_review_update(member_id, review_product_idx, review_title, review_content);
		if(result == 1) {
			
			return "<script>alert('상품평 수정에 성공했습니다.'); location.href='/mypage/myReviewList';</script>";
		}else {
			return "<script>alert('상품평 수정에 실패했습니다.'); history.back(-1);</script>";
		}
	}
//-----------------------------------------------------------------------------------------------------------------------
	// 마이페이지 - 내가 작성한 상품평 - 삭제
	@RequestMapping("/mypage_review_delete")
	@ResponseBody
	public String mypage_review_delete(@RequestParam("review_product_idx") String review_product_idx,
										HttpServletRequest request) {
		
		String member_id = (String) request.getSession().getAttribute("member_id");
		
		int result = productservice.mypage_review_delete(member_id, review_product_idx);
		if(result == 1) {
			
			return "<script>alert('상품평 삭제에 성공했습니다.'); location.href='/mypage/myReviewList';</script>";
		}else {
			return "<script>alert('상품평 삭제에 실패했습니다.'); history.back(-1);</script>";
		}
	}

}
