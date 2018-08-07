package com.tp.soripick.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tp.soripick.domain.ContentVo;

import com.tp.soripick.service.ContentService;
import com.tp.soripick.service.ReplyService;

@Controller
public class ContentController {
   
   @Autowired
   ContentService cs;
   ReplyService rs;
   
   @RequestMapping(value="/indexcontroller")
   public String goIndex(Model model){
     
	  ArrayList<ContentVo> alist =cs.mainBestChart();
	  ArrayList<ContentVo> alist2 = cs.mainNewChart();
	  ArrayList<ContentVo> alist3 = cs.mainNewChart2();
	  ArrayList<ContentVo> alist4 = cs.mainNewChart3();

	  model.addAttribute("alist", alist);   
	  model.addAttribute("alist2", alist2);
	  model.addAttribute("alist3", alist3);
	  model.addAttribute("alist4", alist4);

      return "main";
   }
 
   @RequestMapping(value="/bestchartcontroller")
   public String bestChart(Model model) {
            
      ArrayList<ContentVo> alist =cs.bestChart();
      
      model.addAttribute("alist", alist);   
      
      return "content/BestChart";
   }

   @RequestMapping(value="/newchartcontroller")
   public String newChart(@RequestParam("caidx") int caidx,Model model) {
      
	   ArrayList<ContentVo> alist = cs.newChartB(caidx);
	   model.addAttribute("alist",alist);
      
      return "content/NewMusic";
   }
   
   @RequestMapping(value="/genrecontroller")
   public String genreChart(@RequestParam("caidx") int caidx,Model model) {
      
      ArrayList<ContentVo> alist = cs.genreChartB(caidx);
      model.addAttribute("alist", alist);
      
      return "content/Genre";
   }
   
   @RequestMapping(value="/infocontroller" )
   public String infoMusic(@RequestParam("cidx")int cidx,Model model){
  
	  ContentVo cv = cs.musicInfo(cidx);
	  
	  model.addAttribute("cv", cv);
	  
      return "content/MusicInf";
   }
  
   //�ʿ����
  /* @ResponseBody
   @RequestMapping(value="/newchart/{caidx}")
   public ArrayList<ContentVo> newChartG(@PathVariable("caidx") int caidx) {
  
	   System.out.println("�ٹ���ȣ ����"+caidx);
	   
	   ArrayList<ContentVo> alist = cs.newChart(caidx);
	   
	   System.out.println("alist��?"+alist);
	   
      return alist;
   }*/

   
   
   
   
   
   
   
}