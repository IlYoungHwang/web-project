package org.seoil.biz;

import java.util.List;

import javax.inject.Inject;

import org.seoil.domain.OrderVO;
import org.seoil.domain.SearchCriteria;
import org.seoil.service.CarService;
import org.seoil.service.OrderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/orderview/*")
public class OrderViewController {

	
	@Inject
	private CarService service;
	@Inject
	private OrderService ordersevice;
	
	private static final Logger logger = LoggerFactory.getLogger(OrderViewController.class);
	
	
	// 중고
	@RequestMapping("/rentgetAttach/{no}")
	@ResponseBody
	public List<String> rentgetAttach(@PathVariable("no")Integer no) throws Exception{
		
		return service.rentgetAttach(no);
	}
	
	// 렌트 예약 화면 GET
	
	@RequestMapping(value = "/rentReser", method=RequestMethod.GET)
	public void rentReserGET(@RequestParam("no") int no, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{		
		logger.info("register get.............");
		
		model.addAttribute(service.rentread(no));
		
		
	}
	 // 주문정보 화면 GET
	@RequestMapping(value = "/usedOrder", method=RequestMethod.GET)
	public void usedOrderGET(@RequestParam("no") int no, SearchCriteria cri, Model model) throws Exception{		
		logger.info("register get.............");
		
		model.addAttribute(service.usedread(no));
	}
	
	
	// 주문정보 저장
	@RequestMapping(value = "/usedOrder", method=RequestMethod.POST)
	public String usedOrderPOST(OrderVO order, RedirectAttributes rttr) throws Exception{		
		logger.info("register get.............");
		
		ordersevice.ordercreate(order);
		
		rttr.addFlashAttribute("msg","success");
		
		return "redirect:/";
	}
	
	
}
