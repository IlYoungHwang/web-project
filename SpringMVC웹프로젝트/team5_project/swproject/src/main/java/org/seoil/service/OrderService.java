package org.seoil.service;

import java.util.List;

import org.seoil.domain.Criteria;
import org.seoil.domain.OrderVO;

public interface OrderService {
	
	public List<OrderVO> orderCriteria(Criteria cri)throws Exception; // 중고차량 주문 전체 페이징
	public int oCountCriteria(Criteria cri) throws Exception; // 중고차량 주문 전체 게시물 수
	
	public void ordercreate(OrderVO vo) throws Exception; // 중고차량 주문 정보 저장
	public OrderVO orderread(OrderVO vo) throws Exception; // 중고차량 주문 정보 불러오기
	
	
}
