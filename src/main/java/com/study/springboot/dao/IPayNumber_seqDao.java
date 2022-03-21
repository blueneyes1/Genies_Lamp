package com.study.springboot.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.study.springboot.dto.PayNumber_seqDto;

@Mapper
public interface IPayNumber_seqDao {
			
	// 주문번호 시퀀스 조회(LDG)
	public PayNumber_seqDto get_payNumber_seq(@Param("today") String today);
	

}
