package com.tp.soripick.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tp.soripick.domain.MyOrder;
import com.tp.soripick.domain.OrderVo;
import com.tp.soripick.domain.PayVo;
import com.tp.soripick.service.OrderService;
import com.tp.soripick.service.PayService;

@Controller
public class OrderController {
	
	@Autowired
	OrderService os;
	
	@Autowired
	PayService ps;

	@RequestMapping(value="/checkcontroller")
	public String checkPay(@RequestParam("cidx") int cidx, HttpServletRequest request ,HttpSession session) {
		//value="cidx",required=false = 뺐어용 
		//RequestParam("mcheck") String mcheck 받아볼것!
	/*	String[] mcidx = request.getParameterValues("mcheck");			
		
		System.out.println("배열 확인하깅"+mcidx);*/

		System.out.println("cidx 체크??"+cidx);

		int midx = (int) session.getAttribute("sMidx");
		
		//System.out.println("midx?"+midx);
				
 		int pv = ps.payCheck(midx,cidx);
		
		//System.out.println("체크컨트롤러 pv값" + pv );
						
		String page = null ;
		
		if(pv!=0){
			page ="redirect:/webplayerincontroller?cidx="+cidx;;
			}else{		
			page ="redirect:/orderinsertcontroller?cidx="+cidx;
			
		}
		
		return page;
	}
		
	@RequestMapping(value="/orderinsertcontroller")
	public String insertOrder(@RequestParam("cidx") int cidx,HttpSession session){
		
		int smidx = (int) session.getAttribute("sMidx");
		
		OrderVo ov = new OrderVo();
		
		Random rd = new Random();
		String randomoid = "SORIPICK"+rd.nextInt();

		//System.out.println(randomoid);
						
		//ov.setComma(comma);
		ov.setCidx(cidx);
		ov.setMidx(smidx);
		ov.setOid(randomoid);
		
		int result = os.orderInsert(ov);
		
		String page = null;
		if(result==1){
			page = "redirect:/orderlistcontroller?oid="+ov.getOid();
		}
		return page;
	}
	
	@RequestMapping(value="/orderlistcontroller")
	public String orderlist(@RequestParam("oid") String oid, Model model,HttpSession session){

		//System.out.println("Order List");
				
		OrderVo ov = new OrderVo();
		int smidx = (int) session.getAttribute("sMidx");
		
		ov.setMidx(smidx);
		ov.setOid(oid);

		ArrayList<MyOrder> alist = os.orderList(ov);
		model.addAttribute("alist", alist);
		model.addAttribute("ov", ov);
		
		return "order/List";
	}
	
/*	@ResponseBody
	@RequestMapping(value="/order/{midx}/{oid}")
	public  ArrayList<MyOrder> ajaxList(@PathVariable("midx") int midx, @PathVariable("oid") String oid, Model model){

		//System.out.println("여기안들어왓닝");
		
		OrderVo ov = new OrderVo();
		ov.setMidx(midx);
		ov.setOid(oid);
		
		ArrayList<MyOrder> mo = os.orderList(ov);
		//System.out.println("이ㅔ이작스리스트는?"+mo);
		
		return mo;
	}*/
	
	
	@RequestMapping(value="/orderupdatecontroller")
	public String orderUpdate(@ModelAttribute("mo") MyOrder mo){
		
		//System.out.println("�뾽�뜲�씠�듃 �뱾�뼱�솕�떎~");
		//System.out.println("mo oid:"+mo.getOid().split(",")[0]);
		//SORIPICK-953450564,SORIPICK-953450564,SORIPICK-953450564,SORIPICK-953450564
		
		InetAddress local = null;
		try {
			local = InetAddress.getLocalHost();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		String oip = local.getHostAddress(); 
		
		OrderVo ov = new OrderVo();
		ov.setOip(oip);
		ov.setOmethod(mo.getOmethod());
		ov.setOname(mo.getOname());
		ov.setOid(mo.getOid().split(",")[0]);
		ov.setMidx(mo.getMidx());

//		System.out.println(ov.getMidx());
//		System.out.println(ov.getOid());
		
		int result = os.orderUpdate(ov);
		//System.out.println("result?"+result);
		String page = null;
		
		if(result != 0){
			PayVo pv = new PayVo();
			pv.setMidx(mo.getMidx());
			pv.setOid(mo.getOid().split(",")[0]);
			pv.setPpayment(mo.getPpayment());
			
			pv.getMidx();
			pv.getOid();
			pv.getPpayment();
			
			int result2 = ps.payInsert(pv);
				
			if(result2==1){			
				page = "redirect:/orderfinishcontroller?oid="+mo.getOid().split(",")[0];
			
			}
			
		}		
		return page ;
	}
	
	@RequestMapping(value="/orderfinishcontroller")
	public String orderFinish(@RequestParam("oid") String oid,Model model){
		
		//System.out.println("oid?"+oid);
		
		MyOrder mo = os.orderFinish(oid);
		//System.out.println("mo?"+mo);
		
		model.addAttribute("mo", mo);
		
		return "order/Finish";
	}
	
	@ResponseBody
	@RequestMapping(value="/order/{midx}/{oid}/{oidx}",produces="text/plain;charset=UTF-8")
	public String oidxdelete(@PathVariable("midx") int midx,@PathVariable("oid") String oid,@PathVariable("oidx") int oidx){
		
		//System.out.println("oid?"+oid);
		//System.out.println("midx?"+midx);
		//System.out.println("oidx?"+oidx);
		
		int result = os.orderContentDelete(oidx);
		
		//System.out.println("result?"+result);
		
		return "jjjjjkjk";
	}
	

	@RequestMapping(value="/ordercancelcontroller")
	public String ordercancel(@RequestParam("ovoid") String ovoid,@RequestParam("ovmidx") int ovmidx){
		System.out.println("취소취소"+ovoid);
		
		MyOrder mo = new MyOrder();
		mo.setOid(ovoid);
		mo.setMidx(ovmidx);
		
		int result = os.orderCancel(mo);
		String page = null;
		if(result!=0){
			page = "redirect:/indexcontroller";
		}
		return page;
	}
	
	

	
	
}
