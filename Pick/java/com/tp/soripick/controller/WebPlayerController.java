package com.tp.soripick.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tp.soripick.domain.ContentVo;
import com.tp.soripick.domain.PayVo;
import com.tp.soripick.service.ContentService;

@Controller
public class WebPlayerController {

	@Autowired
	ContentService cs;
	
	@RequestMapping(value="/webplayerincontroller")
	public String webplayerin(@RequestParam("cidx") int cidx,HttpSession session,Model model){
					
		int midx = (int) session.getAttribute("sMidx");
		
		ContentVo cv = cs.musicPlay(midx, cidx);
		model.addAttribute("cv", cv);
		
		return "content/WebPlayer";
	}
	
	
}
