package org.seoil.service;

import java.util.List;

import javax.inject.Inject;

import org.seoil.domain.Criteria;
import org.seoil.domain.RentVO;
import org.seoil.domain.SearchCriteria;
import org.seoil.domain.UsedVO;
import org.seoil.persistence.CarDAO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CarServiceImpl implements CarService {

	@Inject
	private CarDAO dao;
	
	@Transactional
	@Override
	public void rentadd(RentVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.rentcreate(vo);
		
		String[] files = vo.getFiles();
		
		if(files == null) {return;}
		
		for(String filname : files) {
			dao.rentAttach(filname);
		}
		
	}

	
	// 중고차 정보 저장
	@Transactional
	@Override
	public void usedadd(UsedVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.usedcreate(vo);
		
		String[] files = vo.getFiles();
		
		if(files == null) {return;}
		
		for(String filname : files) {
			dao.usedAttach(filname);
		}
	}

	// 중고차량 리스트 화면
	@Override
	public List<UsedVO> usedlistAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.usedlistAll();
	}

	
	// 렌트차량 리스트 화면
	@Override
	public List<RentVO> rentlistAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.rentlistAll();
	}

	
	// 메인화면 중고차량
	@Override
	public List<UsedVO> musedlist() throws Exception {
		// TODO Auto-generated method stub
		return dao.musedlist();
	}

	// 메인화면 렌트차량
	@Override
	public List<RentVO> mrentlist() throws Exception {
		// TODO Auto-generated method stub
		return dao.mrentlist();
	}


	@Override
	public UsedVO usedread(Integer no) throws Exception {
		// TODO Auto-generated method stub
		return dao.usedread(no);
	}


	@Override
	public List<UsedVO> usedCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.usedCriteria(cri);
	}


	@Override
	public int usedCountCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.ucountPageing(cri);
	}


	@Override
	public List<RentVO> rentCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.rentCriteria(cri);
	}
	


	@Override
	public int rentCountCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.rcountPageing(cri);
	}


	@Override
	public RentVO rentread(Integer no) throws Exception {
		// TODO Auto-generated method stub
		return dao.rentread(no);
	}


	@Override
	public void rentmove(Integer no) throws Exception {
		// TODO Auto-generated method stub
		dao.rentAttachdel(no);
		dao.rentdelete(no);
	}


	@Override
	public void usedmove(Integer no) throws Exception {
		// TODO Auto-generated method stub
		dao.useddelete(no);
		dao.usedAttachdel(no);
	}


	@Transactional
	@Override
	public void rentmodify(RentVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.rentupdate(vo);
		
		Integer no = vo.getNo();
		
		dao.rentAttachdel(no);
		
		String[] files = vo.getFiles();
		
		if(files == null) {return;}
		
		for(String fileName : files) {
			dao.rentreplaceAttach(fileName, no);
		}
	}

	@Transactional
	@Override
	public void usedmodify(UsedVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.usedupdate(vo);
		
		Integer no = vo.getNo();
		
		dao.usedAttachdel(no);
		
		String[] files = vo.getFiles();
		
		if(files == null) {return;}
		
		for(String fileName : files) {
			dao.usedreplaceAttach(fileName, no);
		}
	}


	@Override
	public List<String> rentgetAttach(Integer no) throws Exception {
		// TODO Auto-generated method stub
		return dao.rentgetAttach(no);
	}


	@Override
	public List<String> usedgetAttach(Integer no) throws Exception {
		// TODO Auto-generated method stub
		return dao.usedgetAttach(no);
	}


	@Override
	public List<RentVO> rentmain() throws Exception {
		// TODO Auto-generated method stub
		return dao.rentmain();
	}


	@Override
	public List<UsedVO> usedmain() throws Exception {
		// TODO Auto-generated method stub
		return dao.usedmain();
	}


	@Override
	public List<RentVO> rentSearchCriteria(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.rentSearch(cri);
	}


	@Override
	public int rentSearchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.rentSearchCount(cri);
	}


	@Override
	public List<UsedVO> usedSearchCriteria(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.usedSearch(cri);
	}


	@Override
	public int usedSearchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.usedSearchCount(cri);
	}



}
