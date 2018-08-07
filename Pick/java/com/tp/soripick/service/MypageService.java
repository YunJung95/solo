package com.tp.soripick.service;

import java.util.ArrayList;


import com.tp.soripick.domain.BoardVo;
import com.tp.soripick.domain.MemberVo;
import com.tp.soripick.domain.MypageMusicInf;


public interface MypageService {

	//music
	public ArrayList<MypageMusicInf> mymusicList (int midx);
	
	public ArrayList<MypageMusicInf> mypayList (int midx);
	
	public ArrayList<MypageMusicInf> myoidDetail (MypageMusicInf mmi);

	public int myorderCancel(MypageMusicInf mmi);
	
	
	//board
	/** mypage에서 프로필 보는 부분 (회원정보)  */
	public MemberVo profile(int midx);
			
	/** 내가 질문한 리스트 */
	public ArrayList<BoardVo> myQnaList(int midx);
			
			
	//member
	/** 폰번호 정보 변경 */
	public int phoneChange(String mphone, int midx);
			
	/** 이메일 정보 변경 */
	public int emailChange(String memail, int midx);

	/** 비번 변경전 찾기? */
	public String changeFindPwd(String mid, String mpwd);
	
			
	/** 비번 변경 */
	public String pwdChange( String mpwd, String mid);
	
	/** 회원 탈퇴 */
	public int outMember(int midx);
}