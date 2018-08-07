package com.tp.soripick.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tp.soripick.domain.ContentVo;
import com.tp.soripick.domain.PayVo;
import com.tp.soripick.persistence.ContentService_Mapper;

@Service("ContentServiceImpl")
public class ContentServiceImpl implements ContentService {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public ArrayList<ContentVo> mainBestChart() {
		
		ContentService_Mapper csm= sqlSession.getMapper(com.tp.soripick.persistence.ContentService_Mapper.class);
		ArrayList<ContentVo> alist = csm.mainBestChart();
		
		return alist;
	}

	@Override
	public ArrayList<ContentVo> mainNewChart() {
		
		ContentService_Mapper csm= sqlSession.getMapper(com.tp.soripick.persistence.ContentService_Mapper.class);
		ArrayList<ContentVo> alist = csm.mainNewChart();
		
		return alist;
	}

	@Override
	public ArrayList<ContentVo> bestChart() {
		
		ContentService_Mapper csm= sqlSession.getMapper(com.tp.soripick.persistence.ContentService_Mapper.class);
		ArrayList<ContentVo> alist = csm.bestChart();
		
		return alist;
	}

	@Override
	public ArrayList<ContentVo> genreChartB(int caidx) {
		
		ContentService_Mapper csm= sqlSession.getMapper(com.tp.soripick.persistence.ContentService_Mapper.class);
		ArrayList<ContentVo> alist =null;
		
		if(caidx ==1){
			alist=csm.genreChartB(caidx);
		}else if(caidx ==2){
			alist = csm.genreChartD(caidx);
		}else if(caidx ==3){
			alist = csm.genreChartH(caidx);
		}else if(caidx ==4){
			alist = csm.genreChartO(caidx);
		}else if(caidx ==5){
			alist = csm.genreChartOT(caidx);
		}			
		return alist;
	}
		
	

	@Override
	public ArrayList<ContentVo> newChartB(int caidx) {
		
		ContentService_Mapper csm= sqlSession.getMapper(com.tp.soripick.persistence.ContentService_Mapper.class);
		
		ArrayList<ContentVo> alist =null;
		
		if(caidx ==1){
			alist=csm.newChartB(caidx);
		}else if(caidx ==2){
			alist = csm.newChartD(caidx);
		}else if(caidx ==3){
			alist = csm.newChartH(caidx);
		}else if(caidx ==4){
			alist = csm.newChartO(caidx);
		}else if(caidx ==5){
			alist = csm.newChartOT(caidx);
		}			
		return alist;
	}

	@Override
	public ContentVo musicInfo(int cidx) {
		
		ContentService_Mapper csm= sqlSession.getMapper(com.tp.soripick.persistence.ContentService_Mapper.class);
		ContentVo cv = csm.musicInfo(cidx);
		
		return cv;
	}

	@Override
	public ContentVo musicPlay(int midx, int cidx) {
		
		ContentService_Mapper csm= sqlSession.getMapper(com.tp.soripick.persistence.ContentService_Mapper.class);
		ContentVo cv = csm.musicPlay(midx,cidx);
		
		return cv;
	}

	@Override
	public ArrayList<ContentVo> mainNewChart2() {
		ContentService_Mapper csm= sqlSession.getMapper(com.tp.soripick.persistence.ContentService_Mapper.class);
		ArrayList<ContentVo> alist = csm.mainNewChart2();
		
		return alist;
		
	}

	@Override
	public ArrayList<ContentVo> mainNewChart3() {
		ContentService_Mapper csm= sqlSession.getMapper(com.tp.soripick.persistence.ContentService_Mapper.class);
		ArrayList<ContentVo> alist = csm.mainNewChart3();
		return alist;
	}

}
