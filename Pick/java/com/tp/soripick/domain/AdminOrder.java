package com.tp.soripick.domain;

//������ ���������� Order�κ� 
public class AdminOrder {

	private String orderday; 	// �ֹ���
	private int midx; 		 	// ȸ����ȣ
	private String mid;			// ȸ�����̵�
	private String oid;		 	// �ֹ���ȣ
	private String oname;	 	//�Ա��ڸ�
	private String pmethod;	 	//��������
	private int ppayment;	 	//�Ѱ����ݾ�
	private String pstatus;  	//��������
	
	
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
