package org.seoil.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.seoil.domain.Criteria;
import org.seoil.domain.OrderVO;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDAOImpl implements OrderDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace = "org.seoil.mapper.OrderMapper";
	
	@Override
	public void order(OrderVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		session.insert(namespace+".ordercreate",vo);
	}

	@Override
	public OrderVO ordercreate(OrderVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".orderread"+vo);
	}

	@Override
	public List<OrderVO> orderCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".orderCriteria", cri);
	}

	@Override
	public int ocountPageing(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".ocountPaging",cri);
	}

}
