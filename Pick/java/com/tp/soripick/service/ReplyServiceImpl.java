package com.tp.soripick.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tp.soripick.domain.ReplyVo;
import com.tp.soripick.persistence.ReplyService_Mapper;

@Service("ReplyServiceImpl")
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public ArrayList<ReplyVo> replyList(int cidx) {
		
		ReplyService_Mapper csm= sqlSession.getMapper(com.tp.soripick.persistence.ReplyService_Mapper.class);
		ArrayList<ReplyVo> alist = csm.replyList(cidx);
		
		return alist;
	}

	@Override
	public int replyInsert(ReplyVo rv) {
		
		ReplyService_Mapper csm= sqlSession.getMapper(com.tp.soripick.persistence.ReplyService_Mapper.class);
		int alist = csm.replyInsert(rv);
		
		return alist;
	}

	@Override
	public int replyDelete(ReplyVo rv) {
		
		ReplyService_Mapper csm= sqlSession.getMapper(com.tp.soripick.persistence.ReplyService_Mapper.class);
		int alist = csm.replyDelete(rv);
		
		return alist;
	}

}
