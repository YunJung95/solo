package com.tp.soripick.service;

import java.util.ArrayList;
import com.tp.soripick.domain.MemberVo;
import com.tp.soripick.domain.BoardVo;
import com.tp.soripick.domain.MemBoardVo;

//파라미터 변수랑 메소드 비슷한것은 수정할 것;
public interface BoardService {
	
	/** 고객센터 메인 페이지 공지사항 출력 */	
	public ArrayList<BoardVo> boardMainNList(BoardVo bv);
	
	/** 고객센터 메인 페이지 FAQ list 출력  */	
	public ArrayList<BoardVo> boardMainFList(BoardVo bv);
	
	/** 공지사항 list 출력 */	
	public ArrayList<BoardVo> noticeList(BoardVo bv);
	
	/** FAQ 3 list 출력 */	
	public ArrayList<BoardVo> faq3List(BoardVo bv);
	
	/** FAQ 4 list 출력 */	
	public ArrayList<BoardVo> faq4List(BoardVo bv);
	
	/** FAQ 5 list 출력 */	
	public ArrayList<BoardVo> faq5List(BoardVo bv);
	
	/** FAQ 6 list 출력 */	
	public ArrayList<BoardVo> faq6List(BoardVo bv);
	
	/** 게시글 상세보기  */
	public BoardVo boardCon(int bidx);
	
	/** 1:1문의글 쓸 때 가져오는 mid, memail */
	public MemBoardVo comeQna(int midx);
	
	/** 1:1 문의 글쓰는 부분 */
	public int insertQna(BoardVo bv);
	
	/** 1:1 문의 수정 할때 불러오는 값 */
	public BoardVo selectQna(int midx , int bidx);
	
	/** 내가 문의한 글 수정 (관리자가 댓달아주면 수정 불가능) */
	public int updateQna(BoardVo bv);
	
	/** 내가 문의한 글 list */
	public ArrayList<BoardVo> qnaMyList(int midx);
	
	/** 문의글 상세보기 */
	public BoardVo qnaCon(BoardVo bv);
	
	/** 조회수 count */
	public int countHit(int bidx);
	
}