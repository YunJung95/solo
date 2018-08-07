package com.tp.soripick.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.tp.soripick.domain.BoardVo;
import com.tp.soripick.domain.MemBoardVo;
import com.tp.soripick.domain.MemberVo;
import com.tp.soripick.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	BoardService bs;
	
	/** 고객센터 메인 페이지로 이동, 리스트 출력 */
	@RequestMapping(value="/mainpage")
	public String mainpage(BoardVo bv, Model model ){
		
		ArrayList<BoardVo> alist = bs.boardMainNList(bv);	
		model.addAttribute("alist", alist);	
	
		ArrayList<BoardVo> alist1 = bs.boardMainFList(bv);	
		model.addAttribute("alist1", alist1);
		
		/*System.out.println("bv bidx   "+bv.getBidx());
		System.out.println("bv bdate   "+bv.getBdate());
		System.out.println("bv title  "+bv.getBtitle());*/
		
		return "board/Main";
	}
	
	
	/** 공지사항 list 출력 */
	@RequestMapping(value="/noticelist")
	public String noticeList(BoardVo bv, Model model ){
		ArrayList<BoardVo> alist = bs.noticeList(bv);	
		model.addAttribute("alist", alist);	
		return "board/Notice";
	}
	
	/** FAQ 3 list 출력 */
	@RequestMapping(value="/faq3list")
	public String faq3List(BoardVo bv, Model model){
		ArrayList<BoardVo> alist = bs.faq3List(bv);
		model.addAttribute("alist", alist);	
		return "board/Faq";
	}
	
	/** FAQ 4 list 출력 */
	@RequestMapping(value="/faq4list")
	public String faq4List(BoardVo bv, Model model){
		ArrayList<BoardVo> alist = bs.faq4List(bv);
		model.addAttribute("alist", alist);	
		return "board/Faq";
	}
	
	/** FAQ 5 list 출력 */
	@RequestMapping(value="/faq5list")
	public String faq5List(BoardVo bv, Model model){
		ArrayList<BoardVo> alist = bs.faq5List(bv);
		model.addAttribute("alist", alist);	
		return "board/Faq";
	}
	
	/** FAQ 6 list 출력 */
	@RequestMapping(value="/faq6list")
	public String faq6List(BoardVo bv, Model model){
		ArrayList<BoardVo> alist = bs.faq6List(bv);
		model.addAttribute("alist", alist);	
		return "board/Faq";
	}
	
	
/*	*//** 게시글 상세보기  *//*
	@RequestMapping(value="/boardcontnetgo")
	public String boardContnetgo(){
		return "board/Ncontent";
	}*/
	
	/** 공지사항 상세보기  */
	@RequestMapping(value="/boardcontnet")
	public String boardContnet(@RequestParam("bidx") int bidx, Model model){
		System.out.println("공지사항 상세보기 컨트롤러");
		
		BoardVo bv = bs.boardCon(bidx);
		model.addAttribute("bv", bv);
		
		System.out.println("bidx      =="+bidx);
		
		return "board/NContent";
	}
	
	/** 1:1문의글 쓸 때 가져오는 mid, memail */
	@RequestMapping(value="/qnacome")
	public String qnaCome(HttpServletRequest request, Model model){
		//System.out.println("왔냐");
		
		HttpSession session = request.getSession();		
		int midx = (int)session.getAttribute("sMidx");  //세션에 있는 sMidx 가져옴
	
		MemBoardVo mbo = bs.comeQna(midx);
		model.addAttribute("mbo", mbo);


		System.out.println("문의글 쓰는 고오옷" + midx);
		System.out.println("문의글 쓰는 alist ...." + mbo);

		String page = null;
		if(midx == 0) {
			page = "member/Login";	
		}else {
			page = "board/QnaWrite";	
		}
		
		System.out.println(page +"!!!!!!!!!!!page!");
		return page;
	}
	
	/** 1:1 문의 글쓰는 부분 */
	@RequestMapping(value="/qnainsert")
	public String qnaInsert(@ModelAttribute("bv") BoardVo bv,
			HttpServletRequest request) throws UnknownHostException{
		
		HttpSession session = request.getSession();		
		int midx = (int)session.getAttribute("sMidx");  //세션에 있는 sMidx 가져옴
		System.out.println("midx   --"+midx);
		bv.setMidx(midx);
		
		InetAddress local = InetAddress.getLocalHost();		
		String bip = local.getHostAddress();//ip 뽑는
		System.out.println("bip     --"+bip);
		bv.setBip(bip);
		
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		String bdate = sdf.format(dt);
		bdate = bdate.substring(2); //현재 시간 뽑는
		System.out.println("bdate    --"+bdate);
		bv.setBdate(bdate);
		
		System.out.println(bv.getBtitle());
		
		int res = bs.insertQna(bv);
		System.out.println(res);
		String page = null;
		if (res ==1){ //글 등록 완료
			page = "redirect:/mylistqna";
		}else{ //글 등록 안됨
			page = "board/QnaWrite";	
		}
		
		System.out.println("잘 등록 됬닝?  id" + bv.getBidx());
		return page;
	
	}

	/** 1:1 문의 수정 할때 불러오는 값 */
	@RequestMapping(value="board/qnaselect")
	public String qnaSelect(){
		/*MemBoardVo*/
		return null;
	}
	
	/** 내가 문의한 글 수정 (관리자가 댓달아주면 수정 불가능)  */
	@RequestMapping(value="/qnaupdate")
	public String qnaUpdate(int bidx,  @ModelAttribute("bv") BoardVo bv, 
			HttpServletRequest request, Model model) throws UnknownHostException{
		System.out.println("와쪼옹");
		
		InetAddress local = InetAddress.getLocalHost();		
		String bip = local.getHostAddress();//ip 뽑는
		
		
		HttpSession session = request.getSession();		
		int midx = (int)session.getAttribute("sMidx"); 
		
		System.out.println("bip     --"+bip);
		
		bv.setBip(bip);
		bv.setBidx(bidx);
		bv.setMidx(midx);
		
		int res = bs.updateQna(bv);
		
		System.out.println("bip    " +bip);
		System.out.println("bidx    " +bidx);
		System.out.println("bv    " +bv);
		System.out.println(bv.getBtitle());
		System.out.println(bv.getBcontent());
		System.out.println(bv.getBidx());
		model.addAttribute("bv", bv);
		
		
		System.out.println(res);
		String page = null;
		if (res ==1){ //글 수정 완료
			page = "redirect:/mylistqna";
		}else{ //글 수정 안됨
			page = "board/QnaModify";	
		}
		
		System.out.println("잘 등록 됬닝?  getBidx" + bv.getBidx());
		return page; //"redirect:/mylistqna";
	}
	
	
	/** 내가 문의한 글 list page  */
	@RequestMapping(value="/mylistqna")
	public String myListQnaPage(HttpServletRequest request, Model model){
		
		//System.out.println("컨트롤러왔움 QNA LIST");
		
		HttpSession session = request.getSession();		
		int midx = (int)session.getAttribute("sMidx");  //세션에 있는 sMidx 가져옴
		
		//System.out.println("sMidx   zzzz" + midx);
		
		ArrayList<BoardVo> alist = bs.qnaMyList(midx);
		model.addAttribute("alist", alist);	
		
		//System.out.println("mylist    zzz" + alist);

		return "board/QnaList";
	}
	


	
	/** 문의글 상세보기 */
	@RequestMapping(value="/qnacontent")
	public String qnaContent(HttpServletRequest request, int bidx, Model model){
		
		HttpSession session = request.getSession();		
		int midx = (int)session.getAttribute("sMidx");  //세션에 있는 sMidx 가져옴
		
		System.out.println(bidx);
		
		BoardVo bv = new BoardVo();
		bv.setBidx(bidx);
		bv.setMidx(midx);
		
		bv = bs.qnaCon(bv);
		
		System.out.println(bv.getBidx());
		System.out.println(bv.getBtitle());
		
		model.addAttribute("mbo", bv);
		
		return "board/QnaContent";
	}
	
	/** 조회수 count */
	@RequestMapping(value="board/hitcount")
	public String hitCount(){
		
		return null;
	}
	
}

	