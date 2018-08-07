package com.tp.soripick.service;

import java.util.ArrayList;

import com.tp.soripick.domain.ReplyVo;


public interface ReplyService {
	
	public  ArrayList<ReplyVo> replyList(int cidx);
	
	public int replyInsert(ReplyVo rv);
	
	public int replyDelete(ReplyVo rv);


}
