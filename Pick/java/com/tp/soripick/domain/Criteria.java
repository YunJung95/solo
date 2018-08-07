package com.tp.soripick.domain;

public class Criteria {
	
	private int page; // 게시물 확인 페이지
	private int perpageNum; // 페이지 개수
	
	public Criteria(){
		this.page =1;
		this.perpageNum = 15;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		//페이지가 0보다 작거나 같을때 페이지 번호는 1이다.
		if (page <=0) {
			this.page=1;
			return;
		}
		this.page = page;
	}

	public int getPerpageNum() {
		return perpageNum;
	}

	public void setPerpageNum(int perpageNum) {
		
		// || = or , && = and
		// 게시글 개수가 100이 넘는데 굳이 100개를 다 가져올 필요 없다.
		// this.perpageNum = 15. 페이지에 15개만 출력하면 되니까.
		if(perpageNum <=0 || perpageNum >100){
			this.perpageNum = 15;
			return;
		}
		
	}
	
	public int getPageStart() { //페이지 시작위치
		
		return (this.page -1) * perpageNum;
	}
	
	public int  getPageEnd(){   //페이지 끝 위치
		
		return (this.page-1)*perpageNum + perpageNum;
	}
	
	@Override
	public String toString(){
		return "Criteria [page=" +page +","
					+ "perpageNum="+ perpageNum +"]";
	}
	
	
	
	
}
