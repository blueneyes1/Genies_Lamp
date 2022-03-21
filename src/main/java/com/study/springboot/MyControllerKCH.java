package com.study.springboot;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.springboot.dao.INoticeDao;
import com.study.springboot.dto.FaqDto;
import com.study.springboot.dto.NoticeDto;
import com.study.springboot.dto.One2oneDto;
import com.study.springboot.dto.One2one_replyDto;
import com.study.springboot.service.FaqService;
import com.study.springboot.service.NoticeService;
import com.study.springboot.service.One2oneService;


@Controller
public class MyControllerKCH {
    
@Autowired
private NoticeService NoticeService;

@Autowired
private FaqService FaqService;

@Autowired
private One2oneService one2oneService;

@Autowired
private INoticeDao NoticeDao;



//----공지사항게시판----//
   
    @RequestMapping("/notice/NoticeForm")
    public String NoticeForm(@RequestParam(value="page", required=false)String page,
    						 @RequestParam(value="search_cate", required=false) String search_cate,
    						 @RequestParam(value="keyword", required=false) String keyword,
    						HttpServletRequest request, Model model) {
        
    	//pagenavi 함수//
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
    	
    	
    	List<NoticeDto> notice_list = NoticeService.listPage(String.valueOf(startRowNum), String.valueOf(endRowNum));
    	 model.addAttribute("notice_list", notice_list);
    	}
    	  return "/notice/NoticeForm";//NoticeForm 으로 디스패치됨
    
//    	 {  
//    	  
//		System.out.println("search_cate:" + search_cate);
//		System.out.println("keyword:" + keyword);
//		
//		List<NoticeDto> notice_list = null;
//		
//		//검색을 통해 호출됨.
//		if( StringUtils.hasText(keyword) ) {
//			notice_list = NoticeService.notice_list_search(search_cate, keyword);	
//		}else {
//			notice_list = NoticeService.notice_list();	
//		}
//		
//		model.addAttribute("notice_list", notice_list);
//		
//		model.addAttribute("mainPage", "community/community01.jsp");
//		
//    	 }
//		  return "/notice/NoticeForm";//NoticeForm 으로 디스패치됨
	}
    	 
    
//----공지사항 게시판 상세----//
@RequestMapping("/notice/NoticeDetail")
public String NoticeDetail(@RequestParam("notice_idx") String notice_idx,
                            HttpServletRequest request, 
                            Model model){
    System.out.println( "notice_idx:" + notice_idx );
    
    NoticeDto notice_dto = NoticeService.notice_content( notice_idx );
    
    model.addAttribute("notice_dto", notice_dto);
    
    model.addAttribute("mainPage", "notice/NoticeDetail.jsp");

    
    return "index"; //index.jsp 디스패치 
}

//----공지작성화면----//
@RequestMapping("/notice/NoticeWrite")
public String NoticeWrite (@RequestParam(value="notice_idx", required=false, defaultValue="") String notice_idx,
							Model model) {
	
	
	model.addAttribute("notice_idx", notice_idx);
	System.out.println( notice_idx);
	
	return "/notice/NoticeWrite";
   
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
    	else {
    		
    	List<FaqDto> faq_list = FaqService.faq_list(); 
    	model.addAttribute("faq_list", faq_list);
       
    	
      
    	}
    	  return "/faq/FaqForm";//FaqForm 으로 디스패치됨
    }

    
//----공지사항 게시판 상세----//
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
//@RequestMapping("/notice/NoticeDetail")
//public String NoticeDetail(@RequestParam("notice_idx") String notice_idx,
//                            HttpServletRequest request, 
//                            Model model){
//    System.out.println( "notice_idx:" + notice_idx );
//    
//    NoticeDto notice_dto = NoticeService.notice_content( notice_idx );
//    
//    model.addAttribute("notice_dto", notice_dto);
//    
//    model.addAttribute("mainPage", "notice/NoticeDetail.jsp");
//
//    
//    return "index"; //index.jsp 디스패치 
//}



//----공지작성화면----//
@RequestMapping("/faq/FaqWrite")
public String FaqWrite (@RequestParam(value="faq_idx", required=false, defaultValue="") String faq_idx,
							Model model) {
	
	
	model.addAttribute("faq_idx", faq_idx);
	System.out.println( faq_idx);
	
	return "/faq/FaqWrite";
   
}

//----공지작성액션----//

@RequestMapping(value="/faq/faqwriteAction", method = RequestMethod.POST)
@ResponseBody
public String faqwriteAction(	@RequestParam(value="faq_idx", required=false, defaultValue="") String faq_idx,
							@RequestParam("faq_title") String faq_title,
							@RequestParam("faq_content") String faq_content,
							HttpServletRequest request, Model model) {


	int result = FaqService.writefaq(faq_idx, faq_title, faq_content);
		
		if(result == 1) {
			
		
			return "<script>alert('공지등록에 성공했습니다.'); location.href='/faq/FaqForm';</script>";
		
		}else {
		
			return "<script>alert('공지등록에 실패했습니다.'); history.back(-1);</script>";
		}
}
//----공지 수정 불러오기----//

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
    //////----1:1문의 입력 폼----//
////@RequestMapping("/customer/customer01")
////public String customer01(   HttpServletRequest request, 
////                            Model model) {
////    
////    model.addAttribute("mainPage", "customer/customer01.jsp");
////    
////    
////    return "index"; //index.jsp 디스패치 
////}
////
//////----1:1문의 데이터입력----//
////@RequestMapping("/customer/one2one_insert")
////@ResponseBody
////public String one2one_insert(HttpServletRequest request, Model model) {
////    String one2one_name = request.getParameter("one2one_name");
////    String one2one_phone = request.getParameter("one2one_phone");
////    String one2one_email = request.getParameter("one2one_email");
////    String sample6_address = request.getParameter("sample6_address");
////    String sample6_detailAddress = request.getParameter("sample6_detailAddress");
////    String one2one_address = "";
////    if( StringUtils.hasText(sample6_address)) {
////        one2one_address += sample6_address;
////    }
////    if( StringUtils.hasText(sample6_detailAddress)) {
////        one2one_address += " " + sample6_detailAddress;
////    }
////    String one2one_title = request.getParameter("one2one_title");
////    String one2one_content = request.getParameter("one2one_content");
////    
////    System.out.println("one2one_name:"+one2one_name);
////    System.out.println("one2one_phone:"+one2one_phone);
////    System.out.println("one2one_email:"+one2one_email);
////    System.out.println("one2one_address:"+one2one_address);
////    System.out.println("one2one_title:"+one2one_title);
////    System.out.println("one2one_content:"+one2one_content);
////    
////    //DAO(xml, sql)에 파라미터를 전달하는 방법
////    // 1. 낱개로 하나씩
////    // 2. DTO 객체로 
////    // 3. Map 객체로 
////    
////    One2oneDto dto = new One2oneDto();
////    dto.setOne2one_name(one2one_name);
////    dto.setOne2one_phone(one2one_phone);
////    dto.setOne2one_email(one2one_email);
////    dto.setOne2one_address(one2one_address);
////    dto.setOne2one_title(one2one_title);
////    dto.setOne2one_content(one2one_content);
////    //int result = one2oneService.one2one_insert(dto);
////    
////    Map<String, String> map = new HashMap<String, String>();
////    map.put("one2one_name", one2one_name);
////    map.put("one2one_phone", one2one_phone);
////    map.put("one2one_email", one2one_email);
////    map.put("one2one_address", one2one_address);
////    map.put("one2one_title", one2one_title);
////    map.put("one2one_content", one2one_content);
////    
////    int result = one2oneService.one2one_insert_map(map);
////    
////    if( result >= 1 ) {
////        return "<script>alert('1:1문의가 전송되었습니다.'); location.href='/';</script>";
////    }else {
////        return "<script>alert('1:1문의 전송 실패하였습니다.'); history.back(-1);</script>";
////    }
////     
////}
//
//
