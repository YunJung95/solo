package com.tp.soripick.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tp.soripick.domain.AdminOrder;
import com.tp.soripick.domain.BoardVo;
import com.tp.soripick.domain.ContentVo;
import com.tp.soripick.domain.MemberVo;
import com.tp.soripick.persistence.AdminService_Mapper;

@Service("AdminServiceImpl")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public int musicInsert(ContentVo cv) {
		AdminService_Mapper asm = sqlSession.getMapper(com.tp.soripick.persistence.AdminService_Mapper.class);
		int mi = asm.musicInsert(cv);
		
		return mi;
	}

	@Override
	public int musicModify(ContentVo cv) {
		AdminService_Mapper asm = sqlSession.getMapper(com.tp.soripick.persistence.AdminService_Mapper.class);
		int alist = asm.musicModify(cv);
		
		return alist;
	}

	@Override
	public int musicDelete(int cidx) {
		AdminService_Mapper asm = sqlSession.getMapper(com.tp.soripick.persistence.AdminService_Mapper.class);
		int alist = asm.musicDelete(cidx);
		
		return alist;
	}
	
	@Override
	public ArrayList<ContentVo> musicList() {
		AdminService_Mapper asm = sqlSession.getMapper(com.tp.soripick.persistence.AdminService_Mapper.class);
		ArrayList<ContentVo> alist = asm.musicList();
		return alist;
	}
	
	@Override
	public ContentVo musicInfo(int cidx) {
		AdminService_Mapper asm = sqlSession.getMapper(com.tp.soripick.persistence.AdminService_Mapper.class);
		ContentVo cv = asm.musicInfo(cidx);
		
		return cv;
	}



	@Override
	public ArrayList<MemberVo> memberList() {
		
		AdminService_Mapper asm = sqlSession.getMapper(com.tp.soripick.persistence.AdminService_Mapper.class);
		ArrayList<MemberVo> alist = asm.memberList();
		
		return alist;
	}
	
	@Override
	public int adminJoin(MemberVo mv) {
		
		AdminService_Mapper asm = sqlSession.getMapper(com.tp.soripick.persistence.AdminService_Mapper.class);
		int aj = asm.adminJoin(mv); 
		
		return aj;
	}

	@Override
	public int adminChange(MemberVo mv) {
		AdminService_Mapper asm = sqlSession.getMapper(com.tp.soripick.persistence.AdminService_Mapper.class);
		int am = asm.adminChange(mv);
		return am;
	}

	@Override
	public int countMember(String mjoin) {
		return 0;
	}

	@Override
	public ArrayList<BoardVo> boardList() {
		AdminService_Mapper asm = sqlSession.getMapper(com.tp.soripick.persistence.AdminService_Mapper.class);
		ArrayList<BoardVo> alist = asm.boardList();
		return alist;
	}

	@Override
	public ArrayList<BoardVo> qnaWaiting() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardVo qnaWriteCome(int bidx) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int qnaWrite(BoardVo bv) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public BoardVo qnaModifyCome(int bidx) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int qnaModify(BoardVo bv) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int noticeWrite(BoardVo bv) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int noticeModify(BoardVo bv) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int faqWrite(BoardVo bv) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int boardDelete(BoardVo bv) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<AdminOrder> morderList() {
		AdminService_Mapper asm = sqlSession.getMapper(com.tp.soripick.persistence.AdminService_Mapper.class);
		ArrayList<AdminOrder> alist = asm.morderList();
		return alist;
	}

	@Override
	public int mpayUpdate(String oid) {
		AdminService_Mapper asm = sqlSession.getMapper(com.tp.soripick.persistence.AdminService_Mapper.class);
		int result = asm.mpayUpdate(oid);
		
		return result;
	}

	@Override
	public ArrayList<AdminOrder> mpayStatus() {
		// TODO Auto-generated method stub
		return null;
	}

	



}