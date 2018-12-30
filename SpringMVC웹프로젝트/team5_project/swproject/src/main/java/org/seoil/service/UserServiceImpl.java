package org.seoil.service;

import javax.inject.Inject;

import org.seoil.domain.LicenVO;
import org.seoil.domain.UserVO;
import org.seoil.dto.LoginDTO;
import org.seoil.persistence.UserDAO;
import org.springframework.stereotype.Service;


@Service
public class UserServiceImpl implements UserService{

	@Inject
	private UserDAO dao;
	
	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return dao.login(dto);
	}

	@Override
	public void buyersign(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.create(vo);
	}

	@Override
	public void sellersign(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.create(vo);
	}

	@Override
	public void liceninfo(LicenVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.licencreate(vo);
	}

	@Override
	public void buyerupdate(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.buyerdate(vo);
	}

	@Override
	public void sellerupdate(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.sellerupdate(vo);
	}

	@Override
	public UserVO buyerread(Integer no) throws Exception {
		// TODO Auto-generated method stub
		return dao.buyerread(no);
	}

	@Override
	public LicenVO licenread(Integer no) throws Exception {
		// TODO Auto-generated method stub
		return dao.licenread(no);
	}

	@Override
	public UserVO sellerread(Integer no) throws Exception {
		// TODO Auto-generated method stub
		return dao.sellerread(no);
	}

	@Override
	public void pwupdate(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.pwupdate(vo);
	}

}
