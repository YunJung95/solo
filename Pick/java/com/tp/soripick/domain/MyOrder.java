package com.tp.soripick.domain;

//(Order)page 추가 VO (Join)
public class MyOrder {

	private int midx; //회원번호
	private String cname; //곡이름
	private String cqua; //곡음질
	private int oidx; //상품번호
	private String oid; //주문번호
	private int opayment; //주문가격
	private String omethod; //주문방법
	private String oname; //입금자명
	private int ppayment; //결제금액
	
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCqua() {
		return cqua;
	}
	public void setCqua(String cqua) {
		this.cqua = cqua;
	}
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public int getOpayment() {
		return opayment;
	}
	public void setOpayment(int opayment) {
		this.opayment = opayment;
	}
	public String getOmethod() {
		return omethod;
	}
	public void setOmethod(String omethod) {
		this.omethod = omethod;
	}
	public String getOname() {
		return oname;
	}
	public void setOname(String oname) {
		this.oname = oname;
	}
	public int getPpayment() {
		return ppayment;
	}
	public void setPpayment(int ppayment) {
		this.ppayment = ppayment;
	}
	public int getOidx() {
		return oidx;
	}
	public void setOidx(int oidx) {
		this.oidx = oidx;
	}

}
