package org.seoil.persistence;

import java.util.List;

import org.seoil.domain.Criteria;
import org.seoil.domain.OrderVO;

public interface OrderDAO {

	
	public void order(OrderVO vo) throws Exception; // 중고차량 주문정보 생성
	public OrderVO ordercreate(OrderVO vo) throws Exception; // 중고차량 주문 정보 불러오기
	
	public List<OrderVO> orderCriteria(Criteria cri) throws Exception; // 중고차량 주문 전체 목록 페이징
	public int ocountPageing(Criteria cri) throws Exception; // 중고차량 주문 게시물 수
	
}
