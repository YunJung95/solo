package com.tp.soripick.persistence;

import java.util.ArrayList;

import com.tp.soripick.domain.ReplyVo;

public interface ReplyService_Mapper {

	public  ArrayList<ReplyVo> replyList(int cidx);
	
	public int replyInsert(ReplyVo rv);
	
	public int replyDelete(ReplyVo rv);
	
}
