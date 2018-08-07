package com.tp.soripick.service;

import java.util.ArrayList;

import com.tp.soripick.domain.AdminOrder;
import com.tp.soripick.domain.BoardVo;
import com.tp.soripick.domain.ContentVo;
import com.tp.soripick.domain.MemberVo;


public interface AdminService {
	
	//member
	public ArrayList<MemberVo> memberList();
	
	public int adminJoin(MemberVo mv);
	
	public int adminChange(MemberVo mv);
	
	public int countMember(String mjoin);


	//Admin �Խ��� �����κ�
	public ArrayList<BoardVo> boardList();
		
	public ArrayList<BoardVo> qnaWaiting();
	
	public BoardVo qnaWriteCome(int bidx);
	
	public int qnaWrite(BoardVo bv);
	
	public BoardVo qnaModifyCome(int bidx);
	
	public int qnaModify(BoardVo bv);
	
	public int noticeWrite(BoardVo bv);
	
	public int noticeModify(BoardVo bv);
	
	public int faqWrite(BoardVo bv);
	
	public int boardDelete(BoardVo bv);
	


	//Admin �ֹ� ���� �κ�

	public ArrayList<AdminOrder> morderList();
	
	public int mpayUpdate (String oid);

	public ArrayList<AdminOrder> mpayStatus();

	
	//Admin �� �����κ� 
	public int musicInsert (ContentVo cv);
	
	public int musicModify (ContentVo cv);
	
	public int musicDelete (int cidx);
	
	public ArrayList<ContentVo> musicList();
	
	public ContentVo musicInfo(int cidx);
	
	
	
}