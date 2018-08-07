package com.tp.soripick.persistence;

import com.tp.soripick.domain.PayVo;

public interface PayService_Mapper {

	public int payCheck (int midx,int cidx);
	
	public int payInsert (PayVo pv);
	
	public int payDelete (PayVo pv);

}
