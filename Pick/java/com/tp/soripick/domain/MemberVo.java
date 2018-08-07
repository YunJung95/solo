package com.tp.soripick.domain;

import java.util.Date;

public class MemberVo {
	
	private int midx;
	private String mid;
	private String mpwd;
	private String mname;
	private int mphone;
	private String memail;
	private String mbirth;
	private String mjoin;
	private String mrejoin;
	private String mgrade_gm;
	private String mvalue_io;
	private String mip;
	private String sessionKey;
	private Date sessionLimit;
	
	
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpwd() {
		return mpwd;
	}
	public void setMpwd(String mpwd) {
		this.mpwd = mpwd;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public int getMphone() {
		return mphone;
	}
	public void setMphone(int mphone) {
		this.mphone = mphone;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public String getMbirth() {
		return mbirth;
	}
	public void setMbirth(String mbirth) {
		this.mbirth = mbirth;
	}
	public String getMjoin() {
		return mjoin;
	}
	public void setMjoin(String mjoin) {
		this.mjoin = mjoin;
	}
	public String getMrejoin() {
		return mrejoin;
	}
	public void setMrejoin(String mrejoin) {
		this.mrejoin = mrejoin;
	}
	public String getMgrade_gm() {
		return mgrade_gm;
	}
	public void setMgrade_gm(String mgrade_gm) {
		this.mgrade_gm = mgrade_gm;
	}
	public String getMvalue_io() {
		return mvalue_io;
	}
	public void setMvalue_io(String mvalue_io) {
		this.mvalue_io = mvalue_io;
	}
	public String getMip() {
		return mip;
	}
	public void setMip(String mip) {
		this.mip = mip;
	}
	public String getSessionKey() {
		return sessionKey;
	}
	public void setSessionKey(String sessionKey) {
		this.sessionKey = sessionKey;
	}
	public Date getSessionLimit() {
		return sessionLimit;
	}
	public void setSessionLimit(Date sessionLimit) {
		this.sessionLimit = sessionLimit;
	}

}
