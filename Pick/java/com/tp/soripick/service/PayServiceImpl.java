package com.tp.soripick.service;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tp.soripick.domain.PayVo;
import com.tp.soripick.persistence.PayService_Mapper;

@Service("PayServiceImpl")
public class PayServiceImpl implements PayService{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int payCheck(int midx,int cidx) {
		System.out.println("PayImpl midx?"+midx);
		
		PayService_Mapper psm= sqlSession.getMapper(com.tp.soripick.persistence.PayService_Mapper.class);
		int payresult = psm.payCheck(midx,cidx);
		
		System.out.println("pvresult???" + payresult);

		return payresult;
	}
	@Override
	public int payInsert(PayVo pv) {
		
		PayService_Mapper psm= sqlSession.getMapper(com.tp.soripick.persistence.PayService_Mapper.class);
		int result = psm.payInsert(pv);
		
		System.out.println("pay impl result? " + result);
		
		return result;
	}
	
	@Override
	public int payDelete(PayVo pv) {
		PayService_Mapper psm= sqlSession.getMapper(com.tp.soripick.persistence.PayService_Mapper.class);
		int result = psm.payDelete(pv);
		System.out.println("pay result " + result);
		
		return result;
	}
	

}
