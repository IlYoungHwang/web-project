package org.seoil.biz;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.seoil.domain.Criteria;
import org.seoil.domain.OrderVO;
import org.seoil.persistence.CarDAO;
import org.seoil.persistence.OrderDAO;
import org.seoil.persistence.UserDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class BoardDAOTest {
	
	@Inject
	private OrderDAO dao;
	
	private static Logger logger = LoggerFactory.getLogger(BoardDAOTest.class);
	/*
	@Test
	public void testCreate() throws Exception {
		BoardVO board = new BoardVO();
		board.setTitle("new content");
		board.setContent("new content");
		board.setWriter("user00");
		dao.create(board);
	}
	
	@Test
	public void testRead() throws Exception{
		logger.info(dao.read(4).toString());
	}
	
	@Test
	public void testUpdate() throws Exception{
		BoardVO board = new BoardVO();
		board.setTitle("update content");
		board.setContent("update test");
		dao.update(board);
	}
	
	@Test
	public void testDelte() throws Exception{
		dao.delete(4);
	}
	
	@Test
	public void testListPage() throws Exception{
		int page = 3;
		
		List<BoardVO> list = dao.listPage(page);
		
		for(BoardVO boardVO : list) {
			logger.info(boardVO.getBno() + ":" + boardVO.getTitle());
		}
	}
	
	@Test
	public void testURI() throws Exception{
		UriComponents uriComponents = 
				UriComponentsBuilder.newInstance()
				.path("/carview/usedList")
				.queryParam("no", 12)
				.queryParam("perPageNum", 20)
				.build();
		
		logger.info("/carview/usedList?no=2&perPageNum=10");
		logger.info(uriComponents.toString());
	}
	*/
	
	@Test
	public void test() throws Exception{
		Criteria cri = new Criteria();
		
		cri.setPage(1);
		cri.setPerPageNum(10);
		
		List<OrderVO> list = dao.orderCriteria(cri);
		
		for(OrderVO vo : list) {
			logger.info(vo.getOrderno() + ":" + vo.getUsename());
		}
	}

}
