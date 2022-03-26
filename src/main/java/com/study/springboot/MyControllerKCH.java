package com.study.springboot;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.springboot.dto.FaqDto;
import com.study.springboot.dto.NoticeDto;
import com.study.springboot.dto.Product_reviewDto;
import com.study.springboot.service.FaqService;
import com.study.springboot.service.NoticeService;
import com.study.springboot.service.ProductService;


@Controller
public class MyControllerKCH {
    
@Autowired
private NoticeService NoticeService;

@Autowired
private FaqService FaqService;

@Autowired
ProductService productservice;
//----공지사항게시판----//

/*
 * @RequestMapping("/notice/NoticeForm") public String
 * NoticeForm(HttpServletRequest request,Model model) {
 * 
 * model.addAttribute("mainPage", "NoticeForm.jsp");
 * 
 * List<NoticeDto> notice_list = NoticeService.notice_list();
 * 
 * model.addAttribute("notice_list", notice_list);
 * 
 * System.out.println( notice_list );
 * 
 * return "index"; //"listForm.jsp" 디스패치함.
 * 
 * }
 */

// 메인 페이지
@RequestMapping("/main")
public String main(
					Model model) {

	List<NoticeDto> notice_list = NoticeService.notice_list();
	List<FaqDto> faq_list = FaqService.faq_list();
	List<Product_reviewDto> admin_view_review = productservice.admin_view_review();
	
	model.addAttribute("notice_list", notice_list);
	model.addAttribute("faq_list", faq_list);
	model.addAttribute("admin_view_review", admin_view_review);
	model.addAttribute("mainPage", "main.jsp");

	return "index"; // "index.jsp" 디스패치함.
}

//----공지사항게시판----//
   
@RequestMapping("/notice/NoticeForm")
public String NoticeForm(@RequestParam(value="page", required=false)String page,
						HttpServletRequest request, Model model) {
	
    if(page == null || page.equals("")) {

    	page = "1";
    }
	
	if(page != null) {
		model.addAttribute("page",page);
		

		int num_page_no = Integer.parseInt(page);	//page 번호
		int num_page_size = 5;									//페이지당 보이는 row 개수
		int startRowNum = (num_page_no - 1) * num_page_size + 1;//1,6,11 페이지 시작번호
		int endRowNum = (num_page_no * num_page_size);			//5, 10, 15 페이지 끝번호
	
  	    List<NoticeDto> notice_list = NoticeService.listPage(String.valueOf(startRowNum), String.valueOf(endRowNum));
 	    model.addAttribute("notice_list", notice_list);

	    model.addAttribute("mainPage", "notice/NoticeForm.jsp");
    }
  
    return "index"; //index.jsp 디스패치 
}
    
@RequestMapping("/notice/NoticeFormTable")
public String NoticeFormTable(@RequestParam(value="page", required=false)String page,
						HttpServletRequest request, Model model) {

	System.out.println("page"+page);
    if(page == null || page.equals("")) {

    	page = "1";
    }
	
	if(page != null) {
		model.addAttribute("page",page);
		

		int num_page_no = Integer.parseInt(page);	//page 번호
		int num_page_size = 5;									//페이지당 보이는 row 개수
		int startRowNum = (num_page_no - 1) * num_page_size + 1;//1,6,11 페이지 시작번호
		int endRowNum = (num_page_no * num_page_size);			//5, 10, 15 페이지 끝번호

	System.out.println("startRowNum"+Integer.toString(startRowNum));
	System.out.println("endRowNum"+Integer.toString(endRowNum));
	
	 	 List<NoticeDto> notice_list = NoticeService.listPage(String.valueOf(startRowNum), String.valueOf(endRowNum));
		 model.addAttribute("notice_list", notice_list);
	
    }

	model.addAttribute("mainPage", "notice/NoticeFormTable.jsp");
    return "/notice/NoticeFormTable"; //index.jsp 디스패치

}

    
//----공지사항 게시판 상세----//

@RequestMapping("/notice/NoticeDetail")
public String NoticeDetail(@RequestParam("notice_idx") String notice_idx,
                            HttpServletRequest request, 
                            Model model){
    System.out.println( "notice_idx:" + notice_idx );
    
    if(notice_idx == "") {

    	notice_idx = "1";
    }
	
    
    NoticeDto notice_dto = NoticeService.notice_content( notice_idx );
    
    model.addAttribute("notice_dto", notice_dto);
    
    model.addAttribute("mainPage", "notice/NoticeDetail.jsp");

    

    return "index"; //index.jsp 디스패치 
}


@RequestMapping("/notice/NoticeWrite")
public String NoticeWrite (@RequestParam(value="notice_idx", required=false, defaultValue="") String notice_idx,
							Model model) {
	
	
	model.addAttribute("notice_idx", notice_idx);
	System.out.println( notice_idx);

	  model.addAttribute("mainPage", "notice/NoticeWrite.jsp");

	    
	    return "index"; //index.jsp 디스패치 
}

//----공지작성액션----//

@RequestMapping(value="/notice/writeAction", method = RequestMethod.POST)
@ResponseBody
public String writeAction(	@RequestParam(value="notice_idx", required=false, defaultValue="") String notice_idx,
							@RequestParam("notice_title") String notice_title,
							@RequestParam("notice_content") String notice_content,
							HttpServletRequest request, Model model) {


	int result = NoticeService.write(notice_idx, notice_title, notice_content);
		
		if(result == 1) {

			return "<script>alert('공지등록에 성공했습니다.'); location.href='/notice/NoticeForm';</script>";
		
		}else {
		
			return "<script>alert('공지등록에 실패했습니다.'); history.back(-1);</script>";
		}
}
//----공지 수정 불러오기----//

@RequestMapping("/notice/NoticeContent")
public String NoticeContent(@RequestParam("notice_idx") String notice_idx,
							Model model,
							HttpServletRequest request)
{
	System.out.println( "notice_idx:" + notice_idx );
    
    NoticeDto viewDto = NoticeService.viewDto( notice_idx );
    
    model.addAttribute("viewDto", viewDto);
    
    model.addAttribute("mainPage", "notice/NoticeContent.jsp");

	

	return "index"; //NoticeContent.jsp 으로 리다이렉트 됨.

    
}
@RequestMapping(value="/notice/updateAction", method = RequestMethod.POST)
public String updateAction( @RequestParam("notice_idx") String notice_idx,
							@RequestParam("notice_title") String notice_title,
							@RequestParam("notice_content") String notice_content,
							HttpServletRequest request, Model model) {
	
	

	int result = NoticeService.update(notice_idx, notice_title, notice_content);
	if(result == 1) {

		System.out.println("수정 성공");
		return "redirect:/notice/NoticeDetail?notice_idx=" + notice_idx;
	}else {
		
		System.out.println("수정실패");
		return "<script>alert('수정에 실패했습니다.'); history.back(-1);</script>";

	}
}
	@RequestMapping("/notice/deleteAction")
	public String deleteAction( @RequestParam("notice_idx") String notice_idx,
								HttpServletRequest request, Model model) {
		
		

		int result = NoticeService.delete(notice_idx);
		if(result == 1) {

			System.out.println("삭제 성공");
			return "redirect:/notice/NoticeForm";
		}else {
			
			System.out.println("삭제실패");
			return "<script>alert('수정에 실패했습니다.'); history.back(-1);</script>";
		}

}
	//----Faq게시판----//

@RequestMapping("/faq/FaqForm")
public String FaqForm(@RequestParam(value="page", required=false)String page,
									HttpServletRequest request, Model model) {
   
	
	if(page == null) {
    	page = "1";
    }
	
	if(page != null) {
		System.out.println("page"+page);
		model.addAttribute("page",page);

		int num_page_no = Integer.parseInt(page);	//page 번호
		int num_page_size = 5;									//페이지당 보이는 row 개수
		int startRowNum = (num_page_no - 1) * num_page_size + 1;//1,6,11 페이지 시작번호
		int endRowNum = (num_page_no * num_page_size);			//5, 10, 15 페이지 끝번호

	
	
	List<FaqDto> faq_list = FaqService.listPage(String.valueOf(startRowNum), String.valueOf(endRowNum));
	 model.addAttribute("faq_list", faq_list);
	}

	  model.addAttribute("mainPage", "faq/FaqForm.jsp");
	  return "index";//FaqForm 으로 디스패치됨
}

@RequestMapping("/faq/FaqFormTable")
public String FaqFormTable(@RequestParam(value="page", required=false)String page,
									HttpServletRequest request, Model model) {
   
	if(page == null) {
    	page = "1";
    }
	
	if(page != null) {
		System.out.println("pageTavle"+page);
		model.addAttribute("page",page);
		

		int num_page_no = Integer.parseInt(page);	//page 번호
		int num_page_size = 5;									//페이지당 보이는 row 개수
		int startRowNum = (num_page_no - 1) * num_page_size + 1;//1,6,11 페이지 시작번호
		int endRowNum = (num_page_no * num_page_size);			//5, 10, 15 페이지 끝번호
	
	   List<FaqDto> faq_list = FaqService.listPage(String.valueOf(startRowNum), String.valueOf(endRowNum));
	   model.addAttribute("faq_list", faq_list);
	}

	  model.addAttribute("mainPage", "faq/FaqFormTable.jsp");
	  return "/faq/FaqFormTable";//FaqForm 으로 디스패치됨
}

    
//----FAQ 게시판 상세----//

@RequestMapping("/faq/FaqDetail")
public String FaqDetail(@RequestParam("faq_idx") String faq_idx,
                            HttpServletRequest request, 
                            Model model){
    System.out.println( "faq_idx:" + faq_idx );
    
    FaqDto faq_dto = FaqService.faq_content( faq_idx );
    
    model.addAttribute("faq_dto", faq_dto);
    
    model.addAttribute("mainPage", "faq/FaqDetail.jsp");

    

    return "index"; //index.jsp 디스패치 

}

@RequestMapping("/faq/FaqWrite")
public String FaqWrite (@RequestParam(value="faq_idx", required=false, defaultValue="") String faq_idx,
							Model model) {
	
	
	model.addAttribute("faq_idx", faq_idx);
	System.out.println( faq_idx);



	
	model.addAttribute("mainPage", "faq/FaqWrite.jsp");
	return "index";
}

//----FAQ작성액션----//


@RequestMapping(value="/faq/faqwriteAction", method = RequestMethod.POST)
@ResponseBody
public String faqwriteAction(	@RequestParam(value="faq_idx", required=false, defaultValue="") String faq_idx,
							@RequestParam("faq_title") String faq_title,
							@RequestParam("faq_content") String faq_content,
							HttpServletRequest request, Model model) {


	int result = FaqService.writefaq(faq_idx, faq_title, faq_content);
		
		if(result == 1) {
			
		

			return "<script>alert('FAQ등록에 성공했습니다.'); location.href='/faq/FaqForm';</script>";
		
		}else {
		
			return "<script>alert('FAQ등록에 실패했습니다.'); history.back(-1);</script>";
		}
}
//----FAQ 수정 불러오기----//


@RequestMapping("/faq/FaqContent")
public String FaqContent(@RequestParam("faq_idx") String faq_idx,
							Model model,
							HttpServletRequest request)
{
	System.out.println( "faq_idx:" + faq_idx );
    
    FaqDto viewDto = FaqService.viewDto( faq_idx );
    
    model.addAttribute("viewDto", viewDto);
    
    model.addAttribute("mainPage", "faq/FaqContent.jsp");

	

	return "index"; //NoticeContent.jsp 으로 리다이렉트 됨.

    
}
@RequestMapping(value="/faq/faqupdateAction", method = RequestMethod.POST)
public String faqupdateAction( @RequestParam("faq_idx") String faq_idx,
							@RequestParam("faq_title") String faq_title,
							@RequestParam("faq_content") String faq_content,
							HttpServletRequest request, Model model) {
	
	

	int result = FaqService.updatefaq(faq_idx, faq_title, faq_content);
	if(result == 1) {

		System.out.println("수정 성공");
		return "redirect:/faq/FaqDetail?faq_idx=" + faq_idx;
	}else {
		
		System.out.println("수정실패");
		return "<script>alert('수정에 실패했습니다.'); history.back(-1);</script>";

	}
}
	@RequestMapping("/faq/faqdeleteAction")
	public String faqdeleteAction( @RequestParam("faq_idx") String faq_idx,
								HttpServletRequest request, Model model) {
		
		

		int result = FaqService.delete(faq_idx);
		if(result == 1) {

			System.out.println("삭제 성공");
			return "redirect:/faq/FaqForm";
		}else {
			
			System.out.println("삭제실패");
			return "<script>alert('수정에 실패했습니다.'); history.back(-1);</script>";

		}

}
}

//
