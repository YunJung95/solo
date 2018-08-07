package com.tp.soripick.persistence;

import java.util.ArrayList;

import com.tp.soripick.domain.ContentVo;
import com.tp.soripick.domain.PayVo;

public interface ContentService_Mapper {

	public ArrayList<ContentVo> mainBestChart ();

	public ArrayList<ContentVo> mainNewChart(); //�̹����� ���
	public ArrayList<ContentVo> mainNewChart2();
	public ArrayList<ContentVo> mainNewChart3();

	
	public ArrayList<ContentVo> bestChart();
	
	public ArrayList<ContentVo> genreChart(int caidx);
		
	public ArrayList<ContentVo> genreChartB(int caidx);
	
	public ArrayList<ContentVo> genreChartD(int caidx);
	
	public ArrayList<ContentVo> genreChartH(int caidx);
	
	public ArrayList<ContentVo> genreChartO(int caidx);
	
	public ArrayList<ContentVo> genreChartOT(int caidx);
	

	public ArrayList<ContentVo> newChart(int caidx);

	public ArrayList<ContentVo> newChartB(int caidx);
	
	public ArrayList<ContentVo> newChartD(int caidx);
	
	public ArrayList<ContentVo> newChartH(int caidx);
	
	public ArrayList<ContentVo> newChartO(int caidx);
	
	public ArrayList<ContentVo> newChartOT(int caidx);
	
	public ContentVo musicInfo(int cidx);
	
	public ContentVo musicPlay(int midx, int cidx);
	
}
