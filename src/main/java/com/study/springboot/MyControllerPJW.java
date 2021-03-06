package com.study.springboot;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.springboot.dao.IOne2oneDao;
import com.study.springboot.dto.NoticeDto;
import com.study.springboot.dto.One2oneDto;
import com.study.springboot.dao.IOne2one_replyDao;
import com.study.springboot.dto.One2one_replyDto;

@Controller
public class MyControllerPJW {

	@Autowired
	IOne2oneDao one2onedao;
	@Autowired
	IOne2one_replyDao replydao;
	
	
	@RequestMapping("/admin/board")
	public String adminboard(HttpServletRequest request,Model model) {
		
		model.addAttribute("mainPage", "admin/board.jsp");
		return "index";
	}
	

	/*
	 * @RequestMapping("/admin/121listForm") public String
	 * admin121list(HttpServletRequest request,Model model) {
	 * 
	 * model.addAttribute("mainPage", "admin/121listForm.jsp");
	 * 
	 * List<One2oneDto> list = one2onedao.list(); model.addAttribute("list", list);
	 * 
	 * System.out.println( list );
	 * 
	 * return "index"; //"listForm.jsp" 디스패치함. }
	 */
	
	 @RequestMapping("/admin/121listForm")
	    public String NoticeForm(@RequestParam(value="page", required=false)String page,
	    						HttpServletRequest request, Model model) {
	        if(page == null) {

	        	page = "1";
	        }
	    	
	    	if(page != null) {
	    	
	    		model.addAttribute("page",page);
	    		

	    		int num_page_no = Integer.parseInt(page);	//page 번호
	    		int num_page_size = 5;									//페이지당 보이는 row 개수
	    		int startRowNum = (num_page_no - 1) * num_page_size + 1;//1,6,11 페이지 시작번호
	    		int endRowNum = (num_page_no * num_page_size);			//5, 10, 15 페이지 끝번호

	    	
	    	
	    	List<One2oneDto> list = one2onedao.listPage(String.valueOf(startRowNum), String.valueOf(endRowNum));
	    	 model.addAttribute("list", list);
	 


	    	  model.addAttribute("mainPage", "admin/121listForm.jsp");
	    	}
	    	
	    	
	    		    return "index"; //index.jsp 디스패치 
	    }
	
	@RequestMapping("/mypage/121listForm")
		public String mypage121list(HttpServletRequest request,Model model) {
		
		
		
		String member_id = (String) request.getSession().getAttribute("member_id");
		List<One2oneDto> list = one2onedao.list2( member_id);
		model.addAttribute("list", list);
		
		model.addAttribute("mainPage", "mypage/121listForm.jsp");
		
		//System.out.println( list );
		
		return "index";  //"listForm.jsp" 디스패치함.
	}
	
		
	
	@RequestMapping("/mypage/writeForm")
	public String writeForm(@RequestParam(value="one2one_idx", required=false, defaultValue="") String one2one_idx,
			Model model) {
		
		
model.addAttribute("one2one_idx", one2one_idx);
System.out.println( one2one_idx);

model.addAttribute("mainPage", "mypage/121writeForm.jsp");


return "index"; //index.jsp 디스패치 
}
	
	@RequestMapping("/mypage/writeAction")
	@ResponseBody
	public String writeAction( 
								@RequestParam("one2one_title") String one2one_title,
								@RequestParam("one2one_content") String one2one_content,
								HttpServletRequest request) 
	{
		
		String member_id = (String) request.getSession().getAttribute("member_id");
		int result = one2onedao.write(member_id, one2one_title, one2one_content);
		if( result == 1 ) {
			System.out.println("글쓰기 성공!");
			
			//return "redirect:listForm"; //listForm.jsp 으로 리다이렉트 됨.
			return "<script>alert('글쓰기 성공!'); location.href='/mypage/121listForm';</script>";
		}else {
			System.out.println("글쓰기 실패!");
			
			//return "redirect:writeForm"; //writeForm.jsp 으로 리다이렉트 됨.
			return "<script>alert('글쓰기 실패!'); location.href='/mypage/writeForm';</script>";
		}
		
	}


	@RequestMapping("/mypage/contentForm")
	public String contentForm(@RequestParam("one2one_idx") String one2one_idx,
			                   Model model,
			       			   HttpServletRequest request ) {
		
		//게시글 보기
		One2oneDto dto = one2onedao.viewDto( one2one_idx );
		model.addAttribute("dto", dto);
		
		//댓글 리스트 가져오기
		List<One2one_replyDto> reply_list = replydao.reply_list( one2one_idx  );
		model.addAttribute("reply_list", reply_list);
		
		model.addAttribute("mainPage", "mypage/121contentForm.jsp");
		return "index"; //contentForm.jsp 으로 리다이렉트 됨.
	}
	
	@RequestMapping("/admin/contentForm")
	public String admincontentForm(@RequestParam("one2one_idx") String one2one_idx,
			                   Model model,
			       			   HttpServletRequest request ) {
		
		
		//게시글 보기
		One2oneDto dto = one2onedao.viewDto( one2one_idx );
		model.addAttribute("dto", dto);
		
		//댓글 리스트 가져오기
		List<One2one_replyDto> reply_list = replydao.reply_list( one2one_idx  );
		model.addAttribute("reply_list", reply_list);
		
		model.addAttribute("mainPage", "admin/121contentForm.jsp");
		return "index"; //contentForm.jsp 으로 리다이렉트 됨.
	}
	
	
	@RequestMapping("/mypage/updateAction")
	@ResponseBody
	public String updateAction( @RequestParam("one2one_idx") String one2one_idx,
								@RequestParam("one2one_title") String one2one_title,
								@RequestParam("one2one_content") String one2one_content,
								HttpServletRequest request ) {
		
		String member_id = (String) request.getSession().getAttribute("member_id");
		int result = one2onedao.updateDto(one2one_idx, member_id, one2one_title, one2one_content);
		if( result == 1 ) {
			System.out.println("글수정 성공!");
			
			//return "redirect:listForm"; //listForm.jsp 으로 리다이렉트 됨.
			return "<script>alert('글수정 성공!'); location.href='/mypage/121listForm';</script>";
		}else {
			System.out.println("글수정 실패!");
			
			//return "redirect:contentForm?one2one_idx=" + one2one_idx; //updateForm 으로 리다이렉트 됨.
			return "<script>alert('글수정 실패!'); location.href='/mypage/contentForm?one2one_idx=" + one2one_idx + "';</script>";
		}
		
	}
	
	@RequestMapping("/mypage/deleteAction")
	@ResponseBody
	public String deleteAction(@RequestParam("one2one_idx") String one2one_idx,
								HttpServletRequest request)
	{
		int result = one2onedao.deleteDto(one2one_idx);
		if( result == 1 ) {
			System.out.println("글삭제 성공!");
			
			//return "redirect:listForm"; //listForm.jsp 으로 리다이렉트 됨.
			return "<script>alert('글삭제 성공!'); location.href='/mypage/121listForm';</script>";
		}else {
			System.out.println("글삭제 실패!");
			
			//return "redirect:contentForm?one2one_idx=" + one2one_idx; //updateForm 으로 리다이렉트 됨.
			return "<script>alert('글수정 실패!'); location.href='/contentForm?one2one_idx=" + one2one_idx + "';</script>";
		}
		
	}
	
	@RequestMapping("/admin/writeReplyAction")
	@ResponseBody
	public String writeReplyAction( @RequestParam( "one2one_reply_one2one_idx") String one2one_reply_one2one_idx,
									@RequestParam("one2one_reply_content") String one2one_reply_content,
									HttpServletRequest request) 
	{
		
		String member_id = (String) request.getSession().getAttribute("member_id");
		int result = replydao.reply_write(one2one_reply_content, member_id, one2one_reply_one2one_idx);
		if( result == 1 ) {
			System.out.println("답변달기 성공!");
			
			return "<script>alert('답변달기 성공!'); location.href='/admin/contentForm?one2one_idx=" + one2one_reply_one2one_idx + "';</script>";
		}else {
			System.out.println("답변달기 실패!");
			
			return "<script>alert('답변달기 실패!'); location.href='/admin/contentForm?one2one_idx=" + one2one_reply_one2one_idx + "';</script>";
		}
		
	}
	
	@RequestMapping("/admin/deleteReplyAction")
	@ResponseBody
	public String deleteReplyAction(@RequestParam("one2one_reply_idx") String one2one_reply_idx,
									@RequestParam("one2one_reply_one2one_idx") String one2one_reply_one2one_idx,
								HttpServletRequest request)
	{
		
		int result = replydao.reply_deleteDto(one2one_reply_idx, one2one_reply_one2one_idx);
		if( result == 1 ) {
			System.out.println("답변삭제 성공!");
			
			return "<script>alert('답변삭제 성공!'); location.href='/admin/contentForm?one2one_idx=" + one2one_reply_one2one_idx+ "';</script>";
		}else {
			System.out.println("답변삭제 실패!");
			
			return "<script>alert('답변삭제 실패!'); location.href='/admin/contentForm?one2one_idx=" + one2one_reply_one2one_idx+ "';</script>";
		}
		
	}
	
	
	
}
