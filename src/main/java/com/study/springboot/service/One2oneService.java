package com.study.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.study.springboot.dao.IOne2oneDao;

@Component
public class One2oneService {
	
	@Autowired
	IOne2oneDao one2oneDao;

}
