package com.tp.soripick.controller;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tp.soripick.domain.BoardVo;
import com.tp.soripick.domain.ContentVo;
import com.tp.soripick.domain.MemberVo;
import com.tp.soripick.domain.MypageMusicInf;
import com.tp.soripick.domain.PayVo;
import com.tp.soripick.service.BoardService;
import com.tp.soripick.service.MemberService;
import com.tp.soripick.service.MypageService;
import com.tp.soripick.service.PayService;

@Controller
public class MypageController {
	
	@Autowired
	MypageService mps;
		
	@Autowired
	PayService ps;
	
	@Autowired
	MemberService ms;
	
	
	@RequestMapping(value="/mymusiclistcontroller")
	public String musicList(Model model,HttpSession session){	
		
		int midx = (int) session.getAttribute("sMidx");
		//System.out.println("midx??"+midx);	
		
		ArrayList<MypageMusicInf> mmi = mps.mymusicList(midx);
		//System.out.println("마이뮤직?"+mmi);
		model.addAttribute("mmi",mmi);
		
		return "mypage/Mymu";
	}
	
	@RequestMapping(value="/mypaylistcontroller")


	public String mypayList(Model model,HttpSession session){
				
		//System.out.println("들어오냐?");

		int midx = (int) session.getAttribute("sMidx");
		//System.out.println("midx??"+midx);	
		
		ArrayList<MypageMusicInf> mmi = mps.mypayList(midx);
		model.addAttribute("mmi", mmi);		
		//System.out.println("mmi?"+mmi);
	
		return "mypage/PayInf";
	}
	
	@RequestMapping(value="/myoidetailcontroller")
	public String myoidDetail(@RequestParam("oid") String oid, Model model,HttpSession session){
		//Oid값 담기
		MypageMusicInf mmi = new MypageMusicInf();
		mmi.setOid(oid);
		
		//세션Midx값;
		int midx = (int) session.getAttribute("sMidx");
		mmi.setMidx(midx);
				
		ArrayList<MypageMusicInf>mymi = mps.myoidDetail(mmi);
		model.addAttribute("mymi", mymi);		

		return "mypage/PayInfdt";
	}
	
	@RequestMapping(value="/mypagecancelcontroller")
	public String orderCancel(@RequestParam("oid") String oid, HttpSession session){
		//System.out.println("여기는 왔대?");	
		
		MypageMusicInf mmi = new MypageMusicInf();
		mmi.setOid(oid);
		
		int midx = (int) session.getAttribute("sMidx");
		mmi.setMidx(midx);
		
		PayVo pv = new PayVo();
		pv.setMidx(midx);
		pv.setOid(oid);
		
		int result = mps.myorderCancel(mmi);
		int result2 = ps.payDelete(pv);
		
		String url = null;
		
		if(result2 != 0){
			url = "redirect:/indexcontroller";	
		}		
		return url;
	}


 	/** 내 프로필 (아이디, 이름, 연락처, 이메일), 
 	 * 내 문의 내역 5~10개 보여주기(뿌리기 용 제목, 처리현황), 
 	 * ,내 곡 리스트 5~10개 보여주기**/
	@RequestMapping(value="/profilecontroller")
	public String myProFile(Model model ,HttpServletRequest request){
		
		HttpSession session = request.getSession();		
		int midx = (int)session.getAttribute("sMidx");  //세션에 있는 sMidx 가져옴
		
		//System.out.println("midx"+midx);
		
		MemberVo mlist =  mps.profile(midx);
		model.addAttribute("mlist", mlist);	

		return "mypage/MyPage";
	}


	@ResponseBody
	@RequestMapping(value="/phonechangecontroller")
	public String changePhone(String mphone ,HttpServletRequest request){
		
		HttpSession session = request.getSession();		
		int midx = (int)session.getAttribute("sMidx");  //세션에 있는 sMidx 가져옴
		
		int res = mps.phoneChange(mphone, midx);
		//System.out.println("res    =="+res  );
		String page = "";
		if(res == 0){
			page = "NO";
		}else{
			page = "GOOD";
		}
		//System.out.println("page    =="+page  );
		
		return page;
	}
	
	@ResponseBody
	@RequestMapping(value="/emailchangecontroller")
	public String changeEmail(String memail ,HttpServletRequest request){
		
		HttpSession session = request.getSession();		
		int midx = (int)session.getAttribute("sMidx");  //세션에 있는 sMidx 가져옴
		
		int res = mps.emailChange(memail, midx);
		//System.out.println("res    =="+res  );
		String page = "";
		if(res == 0){
			page = "NO";
		}else{
			page = "GOOD";
		}
		//System.out.println("page    =="+page  );
		
		return page;
	}
	
	@RequestMapping(value="/pwdchangecontroller")
	public String changePwd(){
		//System.out.println("나왔어!");
		
		return "mypage/PwdChange";
	}
	
	@ResponseBody
	@RequestMapping(value="/pwdchangefindcontroller")
	public String changeFindPwd(@RequestParam("pwd") String mpwd,HttpServletRequest request){
		//System.out.println("나왔당!");
		
		//System.out.println(mpwd);
		
		HttpSession session = request.getSession();		
		String mid = (String)session.getAttribute("sMid");   //세션에 있는 sMidx 가져옴
		
		String find = mps.changeFindPwd(mid, mpwd);
		
		//System.out.println("find   ||"+find);
		
		String page = "";
		
		if (find == null){ //비번 바꿀수없음
			page ="NO";
			
		}else{ //비번 바꿈
			/*page = "";*/
			page ="GOOD";
		}
		//System.out.println("page   ||"+page);
		
		return page;
	}
	
	@ResponseBody
	@RequestMapping(value="/pwdchangeactioncontroller")
	public String changePwdAction(@RequestParam("mpwd") String mpwd, 
				HttpServletRequest request){
		//System.out.println("UPDATE PWD pwdchangeactioncontroller");
		//System.out.println(mpwd);
		
		HttpSession session = request.getSession();		
		String mid = (String)session.getAttribute("sMid");  //세션에 있는 sMidx 가져옴
		
	
		
		
		//String res = mps.pwdChange(mpwd,mid);
		int res = ms.upPwd(mpwd, mid);
		//System.out.println("res"+res);
	
		//System.out.println("ㅎㅎ");
 		
 		String page = null;
 		if (res == 0){ //안됨
 			page = "NO";
 			
 		}else{ // 변경됨
 			page = "YES";
 		}
 		//System.out.println(page);
 		
 		return page;
 		
 		/*int res = ms.upPwd(mpwd,mid);//순서대로
 		
 		System.out.println("res"+res);
 		
 		String page = null;
 		
 		System.out.println();
 		
 		if (res == 1){ //비번 바뀜
 			page = "GOOD";
 			
 		}else{ //비번 못 바꿈
 			page = "NO";	
 		}
 		
 		return page;*/
 	}
 	
 	/** 회원 탈퇴 */
	@RequestMapping(value="/outmembercontroller")
	public String memberOut(){
		
		return "index";
	}

	
}