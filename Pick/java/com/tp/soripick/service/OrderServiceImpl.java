package com.tp.soripick.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tp.soripick.domain.MyOrder;
import com.tp.soripick.domain.OrderVo;

import com.tp.soripick.persistence.OrderService_Mapper;


@Service("OrderServiceImpl")
public class OrderServiceImpl implements OrderService{

	@Autowired
	SqlSession sqlSession;

	@Override
	public int orderInsert(OrderVo ov) {
		OrderService_Mapper osm= sqlSession.getMapper(com.tp.soripick.persistence.OrderService_Mapper.class);
		int result = osm.orderInsert(ov);
		return result;
	}

	@Override
	public ArrayList<MyOrder> orderList(OrderVo ov) {
		
		OrderService_Mapper osm= sqlSession.getMapper(com.tp.soripick.persistence.OrderService_Mapper.class);
		ArrayList<MyOrder> mo = osm.orderList(ov);
		
		return mo;
	}

	@Override
	public int orderUpdate(OrderVo ov) {
		
/*		System.out.println("ov UPDQTE"+ov.getOmethod()+"/"+ov.getOname()+"/"+ov.getOip());*/
		
		OrderService_Mapper osm= sqlSession.getMapper(com.tp.soripick.persistence.OrderService_Mapper.class);
		int result = osm.orderUpdate(ov);
		System.out.println("order impl result 값은? " + result);

		return result;
	}

	@Override
	public int orderContentDelete(int oidx) {
		
		OrderService_Mapper osm= sqlSession.getMapper(com.tp.soripick.persistence.OrderService_Mapper.class);
		int result = osm.orderContentDelete(oidx);
		
		return result ;
	}

	@Override
	public int orderCancel(MyOrder mo) {
		OrderService_Mapper osm= sqlSession.getMapper(com.tp.soripick.persistence.OrderService_Mapper.class);
		System.out.println("ovCancel"+mo.getMidx()+"/"+mo.getOid());
		
		int result = osm.orderCancel(mo);
		
		System.out.println("result?"+result);
				
		return result;
	}

	@Override
	public MyOrder orderFinish(String oid) {
		
		OrderService_Mapper osm= sqlSession.getMapper(com.tp.soripick.persistence.OrderService_Mapper.class);
		MyOrder mo = osm.orderFinish(oid);
		System.out.println("FINISH mo값은?" + mo);
		return mo;
		
	}
	



	


	
}
