package org.seoil.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.seoil.domain.Criteria;
import org.seoil.domain.RentVO;
import org.seoil.domain.SearchCriteria;
import org.seoil.domain.UsedVO;
import org.springframework.stereotype.Repository;

@Repository
public class CarDAOImpl implements CarDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "org.seoil.mapper.CarMapper";
	
	
	@Override
	public void rentcreate(RentVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".rentcreate", vo);
	}


	@Override
	public void usedcreate(UsedVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".usedcreate",vo);
	}


	@Override
	public void usedAttach(String fullName) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".usedaddAttach", fullName);
	}


	@Override
	public List<UsedVO> usedlistAll() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".usedlistAll");
	}


	@Override
	public List<RentVO> rentlistAll() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".rentlistAll");
	}


	
	@Override
	public List<UsedVO> musedlist() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".latelyused");
	}


	@Override
	public List<RentVO> mrentlist() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".latelyrent");
	}


	@Override
	public UsedVO usedread(Integer no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".usedread", no);
	}



	@Override
	public List<UsedVO> usedCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".usedCriteria", cri);
	}

	@Override
	public int ucountPageing(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".ucountPaging",cri);
	}


	@Override
	public List<RentVO> rentCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".rentCriteria",cri);
	}


	@Override
	public int rcountPageing(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".rcountPaging",cri);
	}


	@Override
	public void rentAttach(String fullName) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".rentaddAttach", fullName);
	}


	@Override
	public List<String> rentgetAttach(Integer no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".rentgetAttach", no);
	}

	@Override
	public RentVO rentread(Integer no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".rentread", no);
	}


	@Override
	public void rentdelete(Integer no) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace+".rentdelete",no);
	}


	@Override
	public void useddelete(Integer no) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace+".useddelete",no);
	}


	@Override
	public void usedupdate(UsedVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace+".usedupdate",vo);
	}
	
	@Override
	public void rentupdate(RentVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace+".rentupdate",vo);
	}


	@Override
	public List<String> usedgetAttach(Integer no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".usedgetAttach", no);
	}

	
	@Override
	public void rentreplaceAttach(String fullName, Integer no) throws Exception {
		// TODO Auto-generated method stub
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("no", no);
		paramMap.put("fullName", fullName);
		
		session.insert(namespace+".rentreplaceAttach",paramMap);
	}


	@Override
	public void rentAttachdel(Integer no) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace+".rentAttachdel",no);
	}


	@Override
	public void usedAttachdel(Integer no) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace+".usedAttachdel",no);
	}


	@Override
	public void usedreplaceAttach(String fullName, Integer no) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("no", no);
		paramMap.put("fullName", fullName);
		
		session.insert(namespace+".usedreplaceAttach",paramMap);
	}

	@Override
	public List<RentVO> rentmain() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".rentmain");
	}
	@Override
	public List<UsedVO> usedmain() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".usedmain");
	}


	@Override
	public List<RentVO> rentSearch(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".rentSearch",cri);
	}


	@Override
	public int rentSearchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".rentSearchCount",cri);
	}


	@Override
	public List<UsedVO> usedSearch(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".usedSearch",cri);
	}


	@Override
	public int usedSearchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".usedSearchCount",cri);
	}



}
