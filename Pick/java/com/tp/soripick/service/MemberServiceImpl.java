package com.tp.soripick.service;

import java.util.ArrayList;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tp.soripick.domain.MemberVo;
import com.tp.soripick.persistence.MemberService_Mapper;

@Service("MemberServiceImpl")
public class MemberServiceImpl implements MemberService{

	@Autowired
	SqlSession sqlSession;
	
	/** 회원가입 */
	@Override
	public int join(MemberVo mv) {
		
		MemberService_Mapper msm= sqlSession.getMapper(com.tp.soripick.persistence.MemberService_Mapper.class);
		int result = msm.join(mv);
		
		return result;//컨트롤러에서 result값이 1이면 넘어가는 페이지 0이면 넘어가는 페이지 if문 만들기
	}

	/** 로그인 */
	@Override
	public MemberVo login(String mid, String mpwd) {
		
		MemberService_Mapper msm= sqlSession.getMapper(com.tp.soripick.persistence.MemberService_Mapper.class);
		MemberVo alist = msm.login(mid, mpwd);
		System.out.println("alist!!!!!!!!!"+alist);
		
		return alist;
	}

	/** ID 찾기 */
	@Override
	public MemberVo findId(String mname, String memail) {
		System.out.println("3");
		MemberService_Mapper msm= sqlSession.getMapper(com.tp.soripick.persistence.MemberService_Mapper.class);
		MemberVo alist = msm.findId(mname, memail);
		System.out.println("4");
		return alist;
	}

	/** 비번 찾기 */
	@Override
	public String findPwd(String mid, String mname, String memail) {
		
		MemberService_Mapper msm= sqlSession.getMapper(com.tp.soripick.persistence.MemberService_Mapper.class);
		String alist = msm.findPwd(mid, mname, memail);
		
		return alist;
	}

	/** 비번 바꾸기 */
	@Override
	public int upPwd(String mpwd, String mid) {
		
		MemberService_Mapper msm= sqlSession.getMapper(com.tp.soripick.persistence.MemberService_Mapper.class);
		int result = msm.upPwd(mpwd,mid);
		
		return result;
	}

	/** 임시 나중에 지워 memberlistAll */
	@Override
	public ArrayList<MemberVo> selectAll(MemberVo mv) {
		
		MemberService_Mapper msm= sqlSession.getMapper(com.tp.soripick.persistence.MemberService_Mapper.class);
		ArrayList<MemberVo> alist = msm.selectAll(mv);
		
		return alist;
	}

	/** 세션 아이디 저장 */
	@Override
	public int keepLogin(MemberVo mv) {
		
		/*// key와 value값을 put으로 저장합니다.
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("memberMidx", midx);
		map.put("msessionkey", msessionKey);
		map.put("msessionLimit", msessionLimit);*/
		
		MemberService_Mapper msm= sqlSession.getMapper(com.tp.soripick.persistence.MemberService_Mapper.class);
		int result = msm.keepLogin(mv);
		
		return result;
	}
	
	
	/** 이름의 유효시간을 기록 */
	@Override
	public MemberVo checkAutoLogin(String msessionKey){

		MemberService_Mapper msm= sqlSession.getMapper(com.tp.soripick.persistence.MemberService_Mapper.class);
		MemberVo mv = msm.checkAutoLogin(msessionKey);
		
		return mv;
	}
}