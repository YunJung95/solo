package com.tp.soripick.domain;

//(Order)page �߰� VO (Join)
public class MyOrder {

	private int midx; //ȸ����ȣ
	private String cname; //���̸�
	private String cqua; //������
	private int oidx; //��ǰ��ȣ
	private String oid; //�ֹ���ȣ
	private int opayment; //�ֹ�����
	private String omethod; //�ֹ����
	private String oname; //�Ա��ڸ�
	private int ppayment; //�����ݾ�
	
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
