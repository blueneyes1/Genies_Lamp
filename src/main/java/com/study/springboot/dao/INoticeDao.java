package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.NoticeDto;

@Mapper
public interface INoticeDao {

	
	public List<NoticeDto> notice_list();
	
	public List<NoticeDto> listPage(String startRowNum,String endRowNum);
	
	public List<NoticeDto> notice_list_search_title( String keyword );
	public List<NoticeDto> notice_list_search_content( String keyword );
	
	public NoticeDto notice_content(String notice_idx);
	
	public int write(String notice_idx, String notice_title, String notice_content);

	public NoticeDto viewDto(String notice_idx);
	
	public int update(String notice_idx, String notice_title, String notice_content);

	public int delete(String notice_idx);
	
	

	

}
