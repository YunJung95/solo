package com.tp.soripick.domain;

public class Criteria {
	
	private int page; // �Խù� Ȯ�� ������
	private int perpageNum; // ������ ����
	
	public Criteria(){
		this.page =1;
		this.perpageNum = 15;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		//�������� 0���� �۰ų� ������ ������ ��ȣ�� 1�̴�.
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
		// �Խñ� ������ 100�� �Ѵµ� ���� 100���� �� ������ �ʿ� ����.
		// this.perpageNum = 15. �������� 15���� ����ϸ� �Ǵϱ�.
		if(perpageNum <=0 || perpageNum >100){
			this.perpageNum = 15;
			return;
		}
		
	}
	
	public int getPageStart() { //������ ������ġ
		
		return (this.page -1) * perpageNum;
	}
	
	public int  getPageEnd(){   //������ �� ��ġ
		
		return (this.page-1)*perpageNum + perpageNum;
	}
	
	@Override
	public String toString(){
		return "Criteria [page=" +page +","
					+ "perpageNum="+ perpageNum +"]";
	}
	
	
	
	
}
