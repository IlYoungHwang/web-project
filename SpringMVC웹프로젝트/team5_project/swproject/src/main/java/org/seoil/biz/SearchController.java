package org.seoil.biz;

import javax.inject.Inject;

import org.seoil.domain.PageMaker;
import org.seoil.domain.SearchCriteria;
import org.seoil.service.CarService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/carview/*")
public class SearchController {

	@Inject
	private CarService service;
	
	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
	
	@RequestMapping(value = "/list", method=RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		
		logger.info("rent list ..... ");
		
		model.addAttribute("list", service.rentCriteria(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.rentCountCriteria(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		
	}
}
