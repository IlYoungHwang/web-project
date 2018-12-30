package org.seoil.biz;

import java.util.List;

import javax.inject.Inject;

import org.seoil.domain.PageMaker;
import org.seoil.domain.SearchCriteria;
import org.seoil.service.CarService;
import org.seoil.service.UserService;
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

@Controller
@RequestMapping("/carview/*")
public class CarViewController {
	
	@Inject
	private CarService service;
	@Inject
	private UserService useservice;
	
	private static final Logger logger = LoggerFactory.getLogger(CarViewController.class);
	
	
	
	
	// 렌트 차량 목록 리스트 GET
	@RequestMapping(value = "/rentList", method=RequestMethod.GET)
	public void rentListGET(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{		
		logger.info("rentlist get.............");
		
		//model.addAttribute("list", service.rentCriteria(cri));
		model.addAttribute("list", service.rentSearchCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.rentSearchCount(cri));
		//pageMaker.setTotalCount(service.rentCountCriteria(cri));
		model.addAttribute("pageMaker",pageMaker);
		
		
		
	}
	
	// 중고차량 리스트 GET
	 @RequestMapping(value = "/usedList", method = RequestMethod.GET)
	  public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info("usedlist get .............. ");

	    //model.addAttribute("list", service.usedCriteria(cri));
		model.addAttribute("list", service.usedSearchCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		//pageMaker.setTotalCount(service.usedCountCriteria(cri));
		pageMaker.setTotalCount(service.usedSearchCount(cri));
	    model.addAttribute("pageMaker", pageMaker);
	    
	  }
	 
	 
	 // 중고차량 목록 GET
	 @RequestMapping(value = "/usedInfo", method = RequestMethod.GET)
	  public void listPage(@RequestParam("no") int no, @RequestParam("userno") int useron, @ModelAttribute("cri") SearchCriteria cri,  Model model) throws Exception {
		logger.info("usedlist get .............. ");

	    model.addAttribute(service.usedread(no));
	    model.addAttribute(useservice.sellerread(useron));
	    
	  }
	 
	 
	 // 중고차량 사진 트랜잭션 GET
	 
	 @RequestMapping("/usedgetAttach/{no}")
	 @ResponseBody
	 public List<String> usedInfo(@PathVariable("no") Integer no) throws Exception{
		 return service.usedgetAttach(no);
	 }
	 
	 
	 // 렌트차량 사진 트랜잭션 GET
	 @RequestMapping("/rentgetAttach/{no}")
	 @ResponseBody
	 public List<String> rentInfo(@PathVariable("no") Integer no) throws Exception{
		 return service.rentgetAttach(no);
	 }
	 
	 
	 
	
}
