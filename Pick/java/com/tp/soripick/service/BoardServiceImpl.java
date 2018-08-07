package com.tp.soripick.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.config.MvcNamespaceHandler;

import com.tp.soripick.domain.BoardVo;
import com.tp.soripick.domain.MemBoardVo;
import com.tp.soripick.domain.MemberVo;
import com.tp.soripick.persistence.BoardService_Mapper;
import com.tp.soripick.persistence.MemberService_Mapper;


@Service("BoardServiceImpl")
public class BoardServiceImpl implements BoardService{

	@Autowired
	SqlSession sqlSession;
	
	/** 고객센터 메인 페이지 list 출력 */	
	@Override
	public ArrayList<BoardVo> boardMainNList(BoardVo bv) {
		
		BoardService_Mapper bsm= sqlSession.getMapper(com.tp.soripick.persistence.BoardService_Mapper.class);
		ArrayList<BoardVo> alist = bsm.boardMainNList(bv);
		
		return alist;
	}
	
	
	/** 메인 페이지 FAQ list 출력  */	
	public ArrayList<BoardVo> boardMainFList(BoardVo bv){
		
		BoardService_Mapper bsm= sqlSession.getMapper(com.tp.soripick.persistence.BoardService_Mapper.class);
		ArrayList<BoardVo> alist = bsm.boardMainFList(bv);
		
		return alist;
	}
	

	/** 공지사항 list 출력 */	
	@Override
	public ArrayList<BoardVo> noticeList(BoardVo bv) {

		BoardService_Mapper bsm= sqlSession.getMapper(com.tp.soripick.persistence.BoardService_Mapper.class);
		ArrayList<BoardVo> alist = bsm.noticeList(bv);
		
		return alist;
	}

	/** 게시글 상세보기  */
	@Override
	public BoardVo boardCon(int bidx) {
		
		BoardService_Mapper bsm= sqlSession.getMapper(com.tp.soripick.persistence.BoardService_Mapper.class);
		BoardVo bv = bsm.boardCon( bidx);
		
		return bv;
	}

	/** 1:1문의글 쓸 때 가져오는 mid, memail */
	@Override
	public MemBoardVo comeQna(int midx) {
		
		BoardService_Mapper bsm= sqlSession.getMapper(com.tp.soripick.persistence.BoardService_Mapper.class);
		MemBoardVo mbo = bsm.comeQna(midx);
		
		
		System.out.println("mbo!!!!!!!!!"+mbo);
		
		return mbo;
	}

	/** 1:1 문의 글쓰는 부분 */
	@Override
	public int insertQna(BoardVo bv) {

		BoardService_Mapper bsm= sqlSession.getMapper(com.tp.soripick.persistence.BoardService_Mapper.class);
		int result = bsm.insertQna(bv);
		
		return result;
	}

	/** 1:1 문의 수정 할때 불러오는 값 */
	@Override
	public BoardVo selectQna(int midx, int bidx) {

		return null;
	}

	/** 내가 문의한 글 수정 (관리자가 댓달아주면 수정 불가능) */
	@Override
	public int updateQna(BoardVo bv) {
		
		BoardService_Mapper bsm= sqlSession.getMapper(com.tp.soripick.persistence.BoardService_Mapper.class);
		int result = bsm.updateQna(bv);
		
		return result;
	}

	/** 내가 문의한 글 list */
	@Override
	public ArrayList<BoardVo> qnaMyList(int midx) {

		BoardService_Mapper bsm= sqlSession.getMapper(com.tp.soripick.persistence.BoardService_Mapper.class);
		ArrayList<BoardVo> alist = bsm.qnaMyList(midx);
		
		return alist;
	}

	/** 문의글 상세보기 */
	@Override
	public BoardVo qnaCon(BoardVo bv) {

		BoardService_Mapper bsm= sqlSession.getMapper(com.tp.soripick.persistence.BoardService_Mapper.class);
		BoardVo alist = bsm.qnaCon(bv);
		
		return alist;
	}

	/** 조회수 count */
	@Override
	public int countHit(int bidx) {

		BoardService_Mapper bsm= sqlSession.getMapper(com.tp.soripick.persistence.BoardService_Mapper.class);
		int result = bsm.countHit(bidx);
		
		return result;
	}

	/** FAQ 3 list 출력 */	
	@Override
	public ArrayList<BoardVo> faq3List(BoardVo bv) {
		
		BoardService_Mapper bsm= sqlSession.getMapper(com.tp.soripick.persistence.BoardService_Mapper.class);
		ArrayList<BoardVo> alist = bsm.faq3List(bv);
		
		return alist;
	}

	/** FAQ 4 list 출력 */	
	@Override
	public ArrayList<BoardVo> faq4List(BoardVo bv) {
		BoardService_Mapper bsm= sqlSession.getMapper(com.tp.soripick.persistence.BoardService_Mapper.class);
		ArrayList<BoardVo> alist = bsm.faq4List(bv);
		
		return alist;
	}

	/** FAQ 5 list 출력 */	
	@Override
	public ArrayList<BoardVo> faq5List(BoardVo bv) {
		BoardService_Mapper bsm= sqlSession.getMapper(com.tp.soripick.persistence.BoardService_Mapper.class);
		ArrayList<BoardVo> alist = bsm.faq5List(bv);
		
		return alist;
	}

	/** FAQ 6 list 출력 */	
	@Override
	public ArrayList<BoardVo> faq6List(BoardVo bv) {
		BoardService_Mapper bsm= sqlSession.getMapper(com.tp.soripick.persistence.BoardService_Mapper.class);
		ArrayList<BoardVo> alist = bsm.faq6List(bv);
		
		return alist;
	}



	

}