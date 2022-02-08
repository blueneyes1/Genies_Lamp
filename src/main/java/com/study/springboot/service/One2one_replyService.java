package com.study.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.study.springboot.dao.IOne2one_replyDao;

@Component
public class One2one_replyService {
	
	@Autowired
	IOne2one_replyDao one2one_replyDao;

}
