package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.One2one_replyDto;


@Mapper
public interface IOne2one_replyDao {
		public List<One2one_replyDto> reply_list( String one2one_reply_member_id );
		public int reply_write(String one2one_reply_content, String one2one_reply_member_id);
		public int reply_deleteDto(String one2one_reply_idx);
}
