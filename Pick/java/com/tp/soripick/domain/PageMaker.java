package com.tp.soripick.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.tp.soripick.domain.SearchCriteria;


public class PageMaker {
	
	private int totalcount;
	private int startpage;
	private int endpage;
	private boolean prev; //이전 페이지
	private boolean next; //다음 페이지
	private int displayPageNum = 15;
	private SearchCriteria scri;
	
	public void setScri(SearchCriteria scri) {
		this.scri = scri;
	}
	
	public SearchCriteria getScri() {
		return scri;
	}
	

	public int getTotalcount() {
		return totalcount;
	}

	public void setTotalcount(int totalcount) {
		this.totalcount = totalcount;
		calcData();
	}

	

	public int getStartpage() {
		return startpage;
	}

	public void setStartpage(int startpage) {
		this.startpage = startpage;
	}

	public int getEndpage() {
		return endpage;
	}

	public void setEndpage(int endpage) {
		this.endpage = endpage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}


	private void calcData() {
		
		endpage = (int) (Math.ceil(scri.getPage()/
				(double)displayPageNum) * displayPageNum);
		
		startpage = (endpage - displayPageNum)+1;
		
		int tempEndPage = (int) (Math.ceil(totalcount)/(double) scri.getPerpageNum());
		
		if(endpage>tempEndPage) {
			endpage = tempEndPage;
		}		
		prev = startpage == 1 ? false : true;		
		next = endpage * scri.getPerpageNum() >= totalcount ? false : true;
		
	}

	public String makeQuery(int page){
		
		UriComponents uriComponents=UriComponentsBuilder.newInstance()
									.queryParam("page", page)
									//.queryParam("perPageNum", cri.getPerPageNum())
									.build();
		
		return uriComponents.toUriString();
	}

	public String makeSearch(int page){
		UriComponents uriComponents=UriComponentsBuilder.newInstance().queryParam("page", page)
				//.queryParam("perPageNum", scri.getPerPageNum())
				.queryParam("searchType",scri.getSearchType() )
				.queryParam("keyword", encoding( scri.getKeyword()))
				.build();
		
		return uriComponents.toUriString();
		
	}
	//trim()-문자의 앞뒤 공백 제거
	private String encoding(String keyword){
		if(keyword == null || keyword.trim().length() ==0){
		return "";
		}
		
		try {
			return URLEncoder.encode(keyword,"UTF-8");
		}catch(UnsupportedEncodingException e){
			return "";
		}
	}
	
	

}