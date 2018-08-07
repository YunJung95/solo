package com.tp.soripick.controller;

import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.tp.soripick.domain.MemberVo;
import com.tp.soripick.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired(required = false)//required = false 이건 받는 값만 해당된다(입력받을때만!)
	MemberService ms;

	@RequestMapping(value="/joincontroller")
	public String memberJoin(Model model, MemberVo mv,HttpServletRequest request) {
		System.out.println("왓냐??");
		
/*		//회원리스트 뿌리는거~!~!
		ArrayList<MemberVo> alist =  ms.selectAll(mv);		
		model.addAttribute("alist", alist);	
		*/
				
		return "member/Join";
	}
	
	@RequestMapping(value="/joinactioncontroller")
	public String memberJoinAction(Model model, @ModelAttribute("mv") MemberVo mv) 
			throws UnknownHostException {
		
		System.out.println("액션들어왔어!!!");
		
		InetAddress local = InetAddress.getLocalHost();		
		String mip = local.getHostAddress();//ip 뽑는
		
		mv.setMip(mip);
		
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		String mjoin = sdf.format(dt);
		mjoin = mjoin.substring(2); //현재 시간 뽑는
		
		mv.setMjoin(mjoin);
		
		int res = ms.join(mv);
		
		String page = null;
		if (res ==1){ //회원가입 완료
			page = "index";
		}else{ //회원가입 안됨
			page = "redirect:/findidcontroller";	
		}
		
		System.out.println("잘 가입 됬닝?  id" + mv.getMid());
		return page;
	}
	
	@RequestMapping(value="/logincontroller")
	public String memberLogin() {
		System.out.println("지나간다??");
		return "member/Login";
	}
	
	@RequestMapping(value="/loginactioncontroller")
	public String memberLoginAction(HttpServletRequest request,
			@ModelAttribute("mv") MemberVo mv, Model model, HttpSession session) 
					throws IOException {
		System.out.println("왔어...");
		
		int res = 0;
		String page =null;
		//MemberVo mv = null;
		//String dest = null;
		
		String mid = mv.getMid();
		System.out.println("mid??"+mid);
		
		String mpwd = mv.getMpwd();
		System.out.println("pwd?"+mpwd);
		
		mv = ms.login(mid, mpwd);//여기에 순서대로 꼭!
		System.out.println("LoginAction mv :::" +mv);
		
		if (mv == null) {				
			System.out.println("값 안들어옴");
			}else {
				
				//mv.getMid()값을 ""여기에 담는다.
				System.out.println("값 들어옴");
				model.addAttribute("sMid", mv.getMid());
				model.addAttribute("sMidx",mv.getMidx());
				model.addAttribute("sMname", mv.getMname());
				model.addAttribute("sMgrade", mv.getMgrade_gm());
				
				System.out.println("sMid"+ mv.getMid());
			    System.out.println("sMidx"+mv.getMidx());
			    System.out.println("sMname"+mv.getMname());
				
			    //세션에 담는다. 인터셉터에서 담음
			    session.setAttribute("sMid", mv.getMid());
			    session.setAttribute("sMidx", mv.getMidx());
			    session.setAttribute("sMname", mv.getMname());
			    session.setAttribute("sMgrade", mv.getMgrade_gm());
			    
			    
			    System.out.println("sMid"+ session.getAttribute("sMid"));
			    System.out.println("sMidx"+ session.getAttribute("sMidx") );
			    System.out.println("sMname"+session.getAttribute("sMname"));
			   
			    
			res = 1;	
			//dest = (String)session.getAttribute("dest");
		}		
		
		if(res == 1) {
			page = "index";
		}else{
			page = "member/Login";
		}
	
		/*if (res ==1) {
			if(dest != null){
				page = "redirect:"+dest+"";
				System.out.println("dest page :::" +page);
			}else {
				page = "member/Join";
				}
		}else{
			page = "member/Login";
		}
		*/
		System.out.println("page"+page);
		return page;
	}
		
	//logout
		@RequestMapping(value="/logoutcontroller", method = RequestMethod.GET)
		public String memberLogout(HttpServletRequest request, HttpServletResponse response, HttpSession session) 
		throws Exception{		
			
			System.out.println("logoutcontroller왓어");
			
			/*String id = (String)session.getAttribute("sMid");
			System.out.println(" 잘 지워 졌니??? "+id);*/
			//세션 삭제
			session.invalidate();

			return "index";
		}

	
	@RequestMapping(value="/findidcontroller")
	public String idFind() {
		return "member/FindIdPwd";
	}
	
	@RequestMapping(value="/findidactioncontroller")
	@ResponseBody
	public String idFindAction(@RequestParam("mname") String mname, 
			@RequestParam("memail") String memail) {
		System.out.println("왔z");
		
		System.out.println(mname+"||"+memail);
		
		String aa="";
		
		MemberVo mem = ms.findId(mname, memail);
		
		System.out.println(mem);
		
		if(mem == null) {
			
			aa="Can not find ID";
		}else{
			aa=mem.getMid();
		}
		
		return aa;
	}
	
	
	@RequestMapping(value="/findpwdcontroller")
	@ResponseBody
	public String findpwd(@RequestParam("mid") String mid,
			@RequestParam("mname") String mname, @RequestParam("memail") String memail) {
		
		System.out.println("FIND PWD!!!!!!!!!!!!!!!!!");
		
		
		
		String mem = ms.findPwd(mid, mname, memail);
		
		System.out.println("mem"+mem);
		
		String pwd = "";
		
		if(mem == null)	{
			pwd = "NO";
		}else {
			pwd = "GOOD";
		}

		return pwd;
	}
	
	@RequestMapping(value="/updatepwdcontroller")
	public String updatepwd(@RequestParam("mpwd") String mpwd,
			@RequestParam("mid1") String mid) {
		
		System.out.println("UPDATE PWD!!!");
		
		
		
		int res = ms.upPwd(mpwd,mid);//순서대로
		
		System.out.println("res"+res);
		
		String page = null;
		
	/*	System.out.println();*/
		
		if (res == 1){ //비번 바뀜
			page = "index";
			
		}else{ //비번 못 바꿈
			page = "redirect:/findidcontroller";	
		}
		
		return page;
	}
	
	@RequestMapping(value="/pwdupdatecontroller")
	public String pwdUpdate() {
		
		return null;
	}
	
}
