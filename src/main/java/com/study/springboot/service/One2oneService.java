package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.study.springboot.dao.IOne2oneDao;

import com.study.springboot.dto.One2oneDto;

@Component
public class One2oneService {
	
	@Autowired
	IOne2oneDao one2oneDao;
	
	
	public List<One2oneDto> list(){
		List<One2oneDto> list = one2oneDao.list();
		return list;
	}
	public List<One2oneDto> listPage(String startRowNum, String endRowNum) {
		
		List<One2oneDto> listPage = one2oneDao.listPage(startRowNum, endRowNum);
		
		return listPage;
	}

}
