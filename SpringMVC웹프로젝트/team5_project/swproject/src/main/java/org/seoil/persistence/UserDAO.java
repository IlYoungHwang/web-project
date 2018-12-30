package org.seoil.persistence;

import org.seoil.domain.LicenVO;
import org.seoil.domain.UserVO;
import org.seoil.dto.LoginDTO;

public interface UserDAO {

	public void create(UserVO vo)throws Exception; // 회원가입 정보저장
	public UserVO login(LoginDTO dto) throws Exception; // 회원 로그인 세션

	public void licencreate(LicenVO vo)throws Exception; // 면허정보 저장
	public LicenVO licenread(Integer no)throws Exception; // 구매자 면허 정보 불러오기
	
	public void buyerdate(UserVO vo)throws Exception; // 구매자 회원정보수정 하기
	public UserVO buyerread(Integer no)throws Exception; // 구매자 프로필 정보 불러오기
	
	
	
	public UserVO sellerread(Integer no)throws Exception; // 판매자 프로필 정보 불러오기
	public void sellerupdate(UserVO vo)throws Exception; // 판매자 회원정보수정 하기
	
	
	public void pwupdate(UserVO vo) throws Exception; // 비밀번호 변경
	
}
