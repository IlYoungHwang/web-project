package org.seoil.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.seoil.domain.LicenVO;
import org.seoil.domain.UserVO;
import org.seoil.dto.LoginDTO;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO{

	@Inject
	private SqlSession session;

	private static String namespace = "org.seoil.mapper.UserMapper";
	
	// 회원 정보 저장
	@Override
	public void create(UserVO vo) throws Exception{
		// TODO Auto-generated method stub
		session.insert(namespace+".create", vo);
	}
	
	
	// 회원 세션 생성
	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".login", dto);
	}


	// 면허 정보 저장
	@Override
	public void licencreate(LicenVO vo) throws Exception{
		// TODO Auto-generated method stub
		session.insert(namespace+".licencreate",vo);
	}


	@Override
	public void buyerdate(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace+".buyerupdate",vo);
	}


	@Override
	public void sellerupdate(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace+".sellerupdate",vo);
	}


	@Override
	public UserVO buyerread(Integer no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".buyerinfo",no);
	}


	@Override
	public LicenVO licenread(Integer no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".liceninfo", no);
	}


	@Override
	public UserVO sellerread(Integer no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".sellerinfo",no);
	}


	@Override
	public void pwupdate(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace+".pwupdate",vo);
	}	
}
