package com.tp.soripick.service;

import com.tp.soripick.domain.PayVo;

public interface PayService {

	public int payCheck (int midx,int cidx);
	
	public int payInsert (PayVo pv);
	
	public int payDelete (PayVo pv);
	
}
