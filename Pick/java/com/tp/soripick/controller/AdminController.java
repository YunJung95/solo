package com.tp.soripick.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.tp.soripick.util.MediaUtils;
import com.tp.soripick.util.UploadFileUtiles;
import com.tp.soripick.domain.AdminOrder;
import com.tp.soripick.domain.BoardVo;
import com.tp.soripick.domain.ContentVo;
import com.tp.soripick.domain.MemberVo;
import com.tp.soripick.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	AdminService as;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
// =========================Admin ���� ������ ���� ========================================
	
	@RequestMapping(value="/adminmaincontroller")
	public String adminMain(){
		
		return "admin/Admin";
	}
	
	@RequestMapping(value="/adminmembercontroller")
	public String adminMemberMain(Model model){
		
		ArrayList<MemberVo> alist= as.memberList();
		model.addAttribute("alist", alist);
		
		return "admin/AMemberList";
	}

	
	@RequestMapping(value="/adminmusiccontroller")
	public String adminMusicMain(Model model){
		
		ArrayList<ContentVo> alist = as.musicList();
		model.addAttribute("alist", alist);
		
		return "admin/AContent";
	}
	
	@RequestMapping(value="/adminboardcontroller")
	public String adminBoardMain(Model model){
		
		ArrayList<BoardVo> alist = as.boardList();
		model.addAttribute("alist", alist);
		
		return "admin/ABoardList";
	}
	
	@RequestMapping(value="/adminordercontroller")
	public String adminOrderMain(Model model){
		
		ArrayList<AdminOrder> alist = as.morderList();
		model.addAttribute("alist", alist);
		
		return "admin/AOP";
	}

// =========================Admin 주문수정 ========================================
	
	@RequestMapping(value="/adorderupdatecontroller")
	public String adminOrderUpdate(@RequestParam("oid") String oid){
						
		int result = as.mpayUpdate(oid);
		
		String page =null;
		if(result!=0){
			page ="redirect:/adminordercontroller";
		}
		
		return page;
	}
	

	
// =========================Admin ȸ�� ������ ���� ========================================
	@RequestMapping(value="/adminjoin")
	public String adminjoin(){
		
		return "admin/AMemberJoin";
	}
	
	@RequestMapping(value="/adminjoinaction")
	public String adminactionjoin(Model model, @ModelAttribute("mv") MemberVo mv) 
			throws UnknownHostException{
					
			
			
			InetAddress local = InetAddress.getLocalHost();		
			String mip = local.getHostAddress();//ip �̴�
			
			mv.setMip(mip);
			
			Date dt = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			String ajoin = sdf.format(dt);
			ajoin = ajoin.substring(2); //���� �ð� �̴�
			
			mv.setMjoin(ajoin);
			
			int res = as.adminJoin(mv);
			
			String page = null;
			if (res ==1){ //ȸ������ �Ϸ�
				page = "index";
			}else{ //ȸ������ �ȵ�
				page = "admin/AMemberJoin";	
			}
			
		
			return page;
		
	}
	
	@RequestMapping(value="/adminmodify")
	public String adminModify(){
				
		return "admin/AMemberModify";
	}
	
	@RequestMapping(value="/adminmodifyaction")
	public String adminModifyAction(){
				
		return "admin/AMemberModify";
	}

// =========================Admin ���� ������ ���� ========================================
	@RequestMapping(value="/musicinsert")
	public String insertMusic(){
		
		return "admin/AContentWrite";
	}
	
	@RequestMapping(value="/musicinsertaction")

	public String insertactionMusic(@ModelAttribute("cv") ContentVo cv, Model model
			)throws Exception{

		
		int result = as.musicInsert(cv);
		
		String page = null;
			
		
		if (result == 1) {
			page = "redirect:/adminmaincontroller";
		} else {
			page = "redirect:/musicinsert";
		}
		
		return page;
	}
	
	@RequestMapping(value="/musicmodify")
	public String modifyMusic(@RequestParam("cidx") int cidx, Model model){
		
		ContentVo cv = as.musicInfo(cidx);  
	    model.addAttribute("cv", cv);
	    
		return "admin/AContentModify";
	}
	
	@RequestMapping(value="/musicmodifyaction")
	public String modifyMusicAction(@RequestParam("cidx")int cidx, @ModelAttribute("cv") ContentVo cv){
		
		cv.setCidx(cidx);
		
		int alist = as.musicModify(cv);
		String page = null;
		
		if(alist==1){
			page = "redirect:/adminmusiccontroller";
		} else {
			page = "redirect:/musicmodify";
		}
		
		return page;
	}
	

// =========================Admin Upload ajax ������ ���� ========================================	
	@ResponseBody
	@RequestMapping(value = "/uploadAjax", method = RequestMethod.POST,
					produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception{
				
		//System.out.println("upload ���� �̸�"+file.getOriginalFilename());
		//System.out.println("file ������"+file.getSize());
		//System.out.println("Content Ÿ��"+file.getContentType());
		
		/*String uploadedFileName = UploadFileUtiles.uploadFile(uploadPath,
				file.getOriginalFilename(),
				file.getBytes());*/
		
	
		return 
				new ResponseEntity<>(UploadFileUtiles.uploadFile(uploadPath,
						file.getOriginalFilename(),
						file.getBytes()),HttpStatus.CREATED);
		
	}
	
	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception{
		
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		//System.out.println("fileName?:" + fileName);
		
		try{
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			HttpHeaders headers = new HttpHeaders();
			
			in = new FileInputStream(uploadPath+fileName);
			
			if(mType != null) {
				headers.setContentType(mType);
			}else {
				
				fileName = fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\""+
							new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+"\"");
			}
			
				entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),
													headers, HttpStatus.CREATED);
			
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally{
			in.close();
		}
		return entity;
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteFile", method = RequestMethod.POST,
					produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> deleteFile(String fileName){
		//System.out.println("deletefile:"+fileName);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		MediaType mType = MediaUtils.getMediaType(formatName);
		
		if(mType != null) {
			
			String front = fileName.substring(0,12);
			String end = fileName.substring(14);
			new File(uploadPath+(front+end).replace('/', File.separatorChar)).delete();
		}
		
		new File(uploadPath+ fileName.replace('/', File.separatorChar)).delete();
		
		return new ResponseEntity<String>("deleted",HttpStatus.OK);
	}

}