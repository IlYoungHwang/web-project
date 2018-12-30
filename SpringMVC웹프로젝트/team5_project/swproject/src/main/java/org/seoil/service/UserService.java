package org.seoil.service;

import org.seoil.domain.LicenVO;
import org.seoil.domain.UserVO;
import org.seoil.dto.LoginDTO;

public interface UserService {
	
	public void buyersign(UserVO vo) throws Exception; // 구매자 회원가입
	public void sellersign(UserVO vo) throws Exception; // 판매자 회원가입
	public UserVO login(LoginDTO dto) throws Exception; // 회원 세션 로그인
	
	public void liceninfo(LicenVO vo) throws Exception; // 구매자 면허정보저장
	
	
	public LicenVO licenread(Integer no)throws Exception; // 구매자 면허정보
	public UserVO buyerread(Integer no)throws Exception; // 구매자 회원정보 불러오기
	public void buyerupdate(UserVO vo)throws Exception; // 구매자 회원정보 수정
	
	
	
	public void sellerupdate(UserVO vo)throws Exception; // 판매자 회원정보 수정
	public UserVO sellerread(Integer no)throws Exception; // 판매자 회원정보 불러오기
	
	
	public void pwupdate(UserVO vo) throws Exception;
}
