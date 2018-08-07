package com.tp.soripick.service;

import java.util.ArrayList;

import com.tp.soripick.domain.MemberVo;

public interface MemberService {

	/** 회원가입 */
	public int join(MemberVo mv);
	
	/** 로그인 */
	public MemberVo login( String mid, String mpwd);
	
	/** ID 찾기 */
	public MemberVo findId (String mname,String memail);
	
	/** 비번 찾기 */
	public String findPwd (String mid, String mname, String memail);
	
	/** 비번 바꾸기 */
	public int upPwd(String mpwd, String mid);
	
	/** 임시 나중에 지워 memberlistAll */
	public ArrayList<MemberVo> selectAll(MemberVo mv);

	/** 세션 아이디 저장 */
	public int keepLogin(MemberVo mv);

	/** 이름의 유효시간을 기록 */
	public MemberVo checkAutoLogin(String msessionKey);

}