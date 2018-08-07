package com.tp.soripick.controller;

import java.net.InetAddress;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.tp.soripick.domain.ReplyVo;
import com.tp.soripick.service.ReplyService;

@RestController
public class ReplyController {
	
	@Autowired
	ReplyService rs;
	
	@RequestMapping(value = "/reply" ,method=RequestMethod.POST,produces="text/plain;charset=UTF-8")
	public  ResponseEntity<String> insertReply(@RequestBody ReplyVo rv,
			HttpSession session)throws Exception{
		
		InetAddress local = InetAddress.getLocalHost();
		String rip =  local.getHostAddress();
		
		int sMidx = (int) session.getAttribute("sMidx");
		String sMid = (String) session.getAttribute("sMid");
		
		rv.setRwriter(sMid);
		rv.setRip(rip);		
		rv.setMidx(sMidx);		
		
		//System.out.println("midx값은?"+sMidx);
		ResponseEntity<String> entity = null;
		String msg = null;
		try{
		rs.replyInsert(rv);
		msg = "등록되었습니다.";
		entity = new ResponseEntity<String>(msg,HttpStatus.OK);
		}catch(Exception e){
			
			msg = e.getMessage();
			entity = new ResponseEntity<String>(msg,HttpStatus.BAD_REQUEST);
			
		}
		
		//System.out.println("��Ͻ� entity:"+entity.getBody());
		
		return entity;
	}
		
		
		
	@RequestMapping(value="/reply/{ridx}/{cidx}",produces="text/plain;charset=UTF-8")
	public ResponseEntity<String> deleteReply(@PathVariable("ridx") int ridx,
			@PathVariable("cidx") int cidx, HttpSession session)throws Exception {
		
		//System.out.println("돌아랑");
		InetAddress local = InetAddress.getLocalHost();
		String rip =  local.getHostAddress();
		
		ReplyVo rv = new ReplyVo();
		int sMidx = (int) session.getAttribute("sMidx");
		
		rv.setRidx(ridx);
		rv.setMidx(sMidx);
		rv.setRip(rip);
		
		ResponseEntity<String> entity = null;
		String msg = null;
		
		
		
		try{		
		rs.replyDelete(rv);
		
		msg = "삭제 되었습니다.";
		entity = new ResponseEntity<String>(msg,HttpStatus.OK);
		
		}catch(Exception e){
			e.printStackTrace();
		entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		//ArrayList<CommentVo> av = cs.SelectCommentAll(cv.getBbidx());
		//Content(bbidx);
		
		return entity;
	}
	
	
	@RequestMapping(value="/reply/all/{cidx}")
	public ArrayList<ReplyVo> replyList(@PathVariable("cidx") int cidx){
				
		ArrayList<ReplyVo> alist = rs.replyList(cidx);
			
		return alist;
	}

}

