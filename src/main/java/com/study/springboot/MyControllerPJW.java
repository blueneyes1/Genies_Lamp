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
import com.study.springboot.dto.One2oneDto;
import com.study.springboot.dao.IOne2one_replyDao;
import com.study.springboot.dto.One2one_replyDto;

import com.study.springboot.service.One2oneService;
import com.study.springboot.service.One2one_replyService;


@Controller
public class MyControllerPJW {

	@Autowired
	IOne2oneDao one2onedao;
	@Autowired
	IOne2one_replyDao replydao;


	@RequestMapping("/customer/customer01")
	public String customer01( Model model,
			HttpServletRequest request ) {
		
		List<One2oneDto> list = one2onedao.list();
		model.addAttribute("list", list);
		
		//System.out.println( list );
		
		return "mypage/121listForm";  //"listForm.jsp" 디스패치함.
	}
	
	@RequestMapping("/customer/listForm")
	public String listForm( Model model,
			HttpServletRequest request ) {
		
		List<One2oneDto> list = one2onedao.list();
		model.addAttribute("list", list);
		
		//System.out.println( list );
		
		return "mypage/121listForm";  //"listForm.jsp" 디스패치함.
	}
	
	
	@RequestMapping("/customer/writeForm")
	public String writeForm(HttpServletRequest request ) {
		
		
		String member_id = (String) request.getSession().getAttribute("member_id");
		return "mypage/121writeForm"; //"writeForm.jsp" 디스패치함.
	}
	
	@RequestMapping("/customer/writeAction")
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
			return "<script>alert('글쓰기 성공!'); location.href='/customer/customer01';</script>";
		}else {
			System.out.println("글쓰기 실패!");
			
			//return "redirect:writeForm"; //writeForm.jsp 으로 리다이렉트 됨.
			return "<script>alert('글쓰기 실패!'); location.href='/customer/writeForm';</script>";
		}
		
	}


	@RequestMapping("/customer/contentForm")
	public String contentForm(@RequestParam("one2one_idx") String one2one_idx,
			                   Model model,
			       			   HttpServletRequest request ) {
		
		
		//게시글 보기
		One2oneDto dto = one2onedao.viewDto( one2one_idx );
		model.addAttribute("dto", dto);
		
		//댓글 리스트 가져오기
		List<One2one_replyDto> reply_list = replydao.reply_list( one2one_idx  );
		model.addAttribute("reply_list", reply_list);
		
		return "mypage/121contentForm"; //contentForm.jsp 으로 리다이렉트 됨.
	}
	
	
	@RequestMapping("/customer/updateAction")
	@ResponseBody
	public String updateAction( @RequestParam("one2one_idx") String one2one_idx,
								@RequestParam("one2one_member_id") String one2one_member_id,
								@RequestParam("one2one_title") String one2one_title,
								@RequestParam("one2one_content") String one2one_content,
								HttpServletRequest request ) {
		
		int result = one2onedao.updateDto(one2one_idx, one2one_member_id, one2one_title, one2one_content);
		if( result == 1 ) {
			System.out.println("글수정 성공!");
			
			//return "redirect:listForm"; //listForm.jsp 으로 리다이렉트 됨.
			return "<script>alert('글수정 성공!'); location.href='/customer/customer01';</script>";
		}else {
			System.out.println("글수정 실패!");
			
			//return "redirect:contentForm?one2one_idx=" + one2one_idx; //updateForm 으로 리다이렉트 됨.
			return "<script>alert('글수정 실패!'); location.href='/customer/contentForm?one2one_idx=" + one2one_idx + "';</script>";
		}
		
	}
	
	@RequestMapping("/deleteAction")
	@ResponseBody
	public String deleteAction(@RequestParam("one2one_idx") String one2one_idx,
								HttpServletRequest request)
	{
		int result = one2onedao.deleteDto(one2one_idx);
		if( result == 1 ) {
			System.out.println("글삭제 성공!");
			
			//return "redirect:listForm"; //listForm.jsp 으로 리다이렉트 됨.
			return "<script>alert('글삭제 성공!'); location.href='/customer/customer01';</script>";
		}else {
			System.out.println("글삭제 실패!");
			
			//return "redirect:contentForm?one2one_idx=" + one2one_idx; //updateForm 으로 리다이렉트 됨.
			return "<script>alert('글수정 실패!'); location.href='/customer/contentForm?one2one_idx=" + one2one_idx + "';</script>";
		}
		
	}
	
	@RequestMapping("/writeReplyAction")
	@ResponseBody
	public String writeReplyAction( @RequestParam("one2one_reply_content") String one2one_reply_content,
								@RequestParam("one2one_reply_title") String one2one_reply_title,
								@RequestParam("one2one_reply_member_id") String one2one_reply_member_id,
								HttpServletRequest request) 
	{
		
		int result = replydao.reply_write(one2one_reply_title, one2one_reply_content, one2one_reply_member_id);
		if( result == 1 ) {
			System.out.println("답변달기 성공!");
			
			return "<script>alert('답변달기 성공!'); location.href='/contentForm?one2one_idx=" + one2one_reply_member_id + "';</script>";
		}else {
			System.out.println("답변달기 실패!");
			
			return "<script>alert('답변달기 실패!'); location.href='/contentForm?one2one_idx=" + one2one_reply_member_id + "';</script>";
		}
		
	}
	
	@RequestMapping("/deleteReplyAction")
	@ResponseBody
	public String deleteReplyAction(@RequestParam("one2one_reply_idx") String one2one_reply_idx,
								   @RequestParam("one2one_idx") String one2one_idx,
								HttpServletRequest request)
	{
		int result = replydao.reply_deleteDto(one2one_reply_idx);
		if( result == 1 ) {
			System.out.println("답변삭제 성공!");
			
			return "<script>alert('답변삭제 성공!'); location.href='/contentForm?one2one_idx=" + one2one_idx + "';</script>";
		}else {
			System.out.println("답변삭제 실패!");
			
			return "<script>alert('답변삭제 실패!'); location.href='/contentForm?one2one_idx=" + one2one_idx + "';</script>";
		}
		
	}
	
}
