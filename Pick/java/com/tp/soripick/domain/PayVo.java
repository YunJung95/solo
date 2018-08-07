package com.tp.soripick.domain;

public class PayVo {
	
	private int pidx;
	private int midx;
	private String oid;
	private int ppayment;
	private String pmethod;
	private String pstatus;
	private String pregistday;
	
	public int getPidx() {
		return pidx;
	}
	public void setPidx(int pidx) {
		this.pidx = pidx;
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
	public int getPpayment() {
		return ppayment;
	}
	public void setPpayment(int ppayment) {
		this.ppayment = ppayment;
	}
	public String getPmethod() {
		return pmethod;
	}
	public void setPmethod(String pmethod) {
		this.pmethod = pmethod;
	}
	public String getPstatus() {
		return pstatus;
	}
	public void setPstatus(String pstatus) {
		this.pstatus = pstatus;
	}
	public String getPregistday() {
		return pregistday;
	}
	public void setPregistday(String pregistday) {
		this.pregistday = pregistday;
	}

}
