package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.One2oneDto;

@Mapper
public interface IOne2oneDao {

	public List<One2oneDto> list();
	public List<One2oneDto> list2(String member_id);
	
	public int write(String one2one_member_id, String one2one_title, String one2one_content);
	public One2oneDto viewDto(String one2one_idx);
	public int updateDto(String one2one_idx, String one2one_member_id, String one2one_title, String one2one_content);
	public int deleteDto(String one2one_idx);
	
}
