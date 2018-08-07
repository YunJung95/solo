package com.tp.soripick.service;

import java.util.ArrayList;

import com.tp.soripick.domain.BoardVo;
import com.tp.soripick.domain.MyOrder;
import com.tp.soripick.domain.OrderVo;
import com.tp.soripick.domain.PayVo;

public interface OrderService {

	public int orderInsert (OrderVo ov);
	
	public ArrayList<MyOrder> orderList (OrderVo ov);
	
	public int orderUpdate (OrderVo ov);
	
	public int orderContentDelete (int oidx);
	
	public int orderCancel(MyOrder mo);
	
	public MyOrder orderFinish (String oid);
	
}
