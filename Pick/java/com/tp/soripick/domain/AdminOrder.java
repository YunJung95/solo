package com.tp.soripick.domain;

//관리자 페이지에서 Order부분 
public class AdminOrder {

	private String orderday; 	// 주문일
	private int midx; 		 	// 회원번호
	private String mid;			// 회원아이디
	private String oid;		 	// 주문번호
	private String oname;	 	//입금자명
	private String pmethod;	 	//결제수단
	private int ppayment;	 	//총결제금액
	private String pstatus;  	//결제상태
	
	
	public String getOrderday() {
		return orderday;
	}
	public void setOrderday(String orderday) {
		this.orderday = orderday;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public String getOname() {
		return oname;
	}
	public void setOname(String oname) {
		this.oname = oname;
	}
	public String getPmethod() {
		return pmethod;
	}
	public void setPmethod(String pmethod) {
		this.pmethod = pmethod;
	}
	public int getPpayment() {
		return ppayment;
	}
	public void setPpayment(int ppayment) {
		this.ppayment = ppayment;
	}
	public String getPstatus() {
		return pstatus;
	}
	public void setPstatus(String pstatus) {
		this.pstatus = pstatus;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}

	
}
