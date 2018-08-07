package com.tp.soripick.service;

import java.util.ArrayList;


import com.tp.soripick.domain.ContentVo;
import com.tp.soripick.domain.PayVo;

public interface ContentService {

	public ArrayList<ContentVo> mainBestChart ();

	public ArrayList<ContentVo> mainNewChart(); //�̹����� ���
	public ArrayList<ContentVo> mainNewChart2();
	public ArrayList<ContentVo> mainNewChart3();
	
	public ArrayList<ContentVo> bestChart();
	
	public ArrayList<ContentVo> genreChartB(int caidx);

	public ArrayList<ContentVo> newChartB(int caidx);

	public ContentVo musicInfo(int cidx);
	
	public ContentVo musicPlay(int midx, int cidx);
}
