package org.seoil.service;

import java.util.List;

import javax.inject.Inject;

import org.seoil.domain.Criteria;
import org.seoil.domain.OrderVO;
import org.seoil.persistence.OrderDAO;
import org.springframework.stereotype.Service;

@Service
public class OrderServiceImpl implements OrderService {

	
	@Inject
	private OrderDAO dao;
	
	@Override
	public void ordercreate(OrderVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.order(vo);
	}

	@Override
	public OrderVO orderread(OrderVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.ordercreate(vo);
	}

	@Override
	public List<OrderVO> orderCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.orderCriteria(cri);
	}

	@Override
	public int oCountCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.ocountPageing(cri);
	}

}
