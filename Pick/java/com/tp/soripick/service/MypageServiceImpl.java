package com.tp.soripick.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tp.soripick.domain.BoardVo;
import com.tp.soripick.domain.MemberVo;
import com.tp.soripick.domain.MypageMusicInf;
import com.tp.soripick.persistence.MemberService_Mapper;
import com.tp.soripick.persistence.MypageService_Mapper;

@Service("MypageServiceImpl")
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public ArrayList<MypageMusicInf> mymusicList(int midx) {
		MypageService_Mapper mysm= sqlSession.getMapper(com.tp.soripick.persistence.MypageService_Mapper.class);
		ArrayList<MypageMusicInf> mymi = mysm.mymusicList(midx);
		return mymi;
	}

	@Override
	public ArrayList<MypageMusicInf> mypayList(int midx) {
		MypageService_Mapper mysm= sqlSession.getMapper(com.tp.soripick.persistence.MypageService_Mapper.class);
		ArrayList<MypageMusicInf> mymi = mysm.mypayList(midx);
		
		System.out.println("my impl?" + mymi);
		
		return mymi;
	}

	@Override
	public ArrayList<MypageMusicInf> myoidDetail(MypageMusicInf mmi) {
		MypageService_Mapper mysm= sqlSession.getMapper(com.tp.soripick.persistence.MypageService_Mapper.class);
		ArrayList<MypageMusicInf> mymi = mysm.myoidDetail(mmi);
		
		System.out.println("my detail impl?" + mymi);

		return mymi;
	}

	@Override
	public int myorderCancel(MypageMusicInf mmi) {
		MypageService_Mapper mysm= sqlSession.getMapper(com.tp.soripick.persistence.MypageService_Mapper.class);

		System.out.println("마이페이지뮤직"+mmi.getOid()+"/"+mmi.getMidx());
		int result= mysm.myorderCancel(mmi);
		
		System.out.println("result값은?"+result);
		return result;
	}

	
	//board

	@Override
	public MemberVo profile(int midx) {
		
		MypageService_Mapper mysm= sqlSession.getMapper(com.tp.soripick.persistence.MypageService_Mapper.class);
		MemberVo mlist = mysm.profile(midx);
		
		return mlist;
	}

	@Override
	public ArrayList<BoardVo> myQnaList(int midx) {
		
		MypageService_Mapper mysm= sqlSession.getMapper(com.tp.soripick.persistence.MypageService_Mapper.class);
		ArrayList<BoardVo> mymi = mysm.myQnaLsit(midx);
		
		return mymi;
	}

	//member
	@Override
	public int phoneChange(String mphone, int midx) {
		
		MypageService_Mapper mysm= sqlSession.getMapper(com.tp.soripick.persistence.MypageService_Mapper.class);
		int result = mysm.phoneChange(mphone, midx);
		
		return result;
	}
	

	@Override
	public int emailChange(String memail, int midx) {
		
		MypageService_Mapper mysm= sqlSession.getMapper(com.tp.soripick.persistence.MypageService_Mapper.class);
		int result = mysm.emailChange(memail, midx);
		
		return result;
	}
	

	@Override
	public String changeFindPwd(String mid, String mpwd) {
	
		MypageService_Mapper mysm= sqlSession.getMapper(com.tp.soripick.persistence.MypageService_Mapper.class);
		String alist = mysm.changeFindPwd(mid, mpwd);
	
		return alist;
	}
	
	@Override
	public String pwdChange(String mid, String mpwd) {
		
		MypageService_Mapper mysm= sqlSession.getMapper(com.tp.soripick.persistence.MypageService_Mapper.class);
		String alist = mysm.pwdChange(mpwd, mid);
		
		return alist;
	}
	

	@Override
	public int outMember(int midx) {
		
		MypageService_Mapper mysm= sqlSession.getMapper(com.tp.soripick.persistence.MypageService_Mapper.class);
		int result = mysm.outMember(midx);
		
		return result;
	}

	


}