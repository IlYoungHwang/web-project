package org.seoil.biz;

import javax.inject.Inject;

import org.seoil.domain.Criteria;
import org.seoil.domain.LicenVO;
import org.seoil.domain.PageMaker;
import org.seoil.domain.UserVO;
import org.seoil.service.OrderService;
import org.seoil.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/userinfo/buyerinfo/*")
public class BuyerInfoController {
	
	@Inject
	private UserService service;
	private static final Logger logger = LoggerFactory.getLogger(BuyerInfoController.class);
	
	@Inject
	private OrderService order;
	
	// 구매자 면허 정보 화면 호출
	@RequestMapping(value = "/liceninfo", method=RequestMethod.GET)
	public void liceninfoGET(@RequestParam("no") int no, Model model) throws Exception{		
		logger.info("register get.............");
		
		model.addAttribute(service.licenread(no));
		
	}
	
	// 구매자 면허정보 수정
	@RequestMapping(value = "/liceninfo", method=RequestMethod.POST)
	public String liceninfoPOST(LicenVO vo,RedirectAttributes rttr) throws Exception{		
		logger.info("register get.............");
		
		service.liceninfo(vo);
		rttr.addFlashAttribute("msg","success");
		return "redirect:/";
	}
	
	
	//주문 정보 GET
	@RequestMapping(value = "/orderInfo", method=RequestMethod.GET)
	public void orderInfoGET(@ModelAttribute("cri") Criteria cri, Model model) throws Exception{		
		logger.info("register get.............");
		
		
		model.addAttribute("list", order.orderCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(order.oCountCriteria(cri));
		model.addAttribute("pageMaker",pageMaker);
		
	}
	
	// 결제 정보 GET
	@RequestMapping(value = "/payInfo", method=RequestMethod.GET)
	public void payInfoGET(Model model) throws Exception{		
		logger.info("register get.............");
	}
	
	
	
	
	// 구매자 회원 프로필 요청
	@RequestMapping(value = "/profile", method=RequestMethod.GET)
	public void profileGET(@RequestParam("no") int no,Model model) throws Exception{		
		logger.info("register get.............");
		
		model.addAttribute(service.buyerread(no));
	}
	
	// 구매자 회원 프로필 요청
	@RequestMapping(value = "/buyermodify", method=RequestMethod.GET)
	public void buyermodifyGET(@RequestParam("no") int no,Model model) throws Exception{		
		logger.info("register get.............");
			
		model.addAttribute(service.buyerread(no));
	}
	
	// 구매자 회원 프로필 수정
		@RequestMapping(value = "/buyermodify", method=RequestMethod.POST)
		public String buyermodifyPOST(UserVO vo, RedirectAttributes rttr) throws Exception{		
			
			logger.info("buyerupdate ....... ");
			
			service.buyerupdate(vo);
			rttr.addFlashAttribute("msg", "success");
			
			return "redirect:/";
		}
		
	
	
	
	// 구매자 회원 프로필 수정
	@RequestMapping(value = "/profile", method=RequestMethod.POST)
	public String profilePOST(UserVO vo, RedirectAttributes rttr) throws Exception{		
		
		logger.info("buyerupdate ....... ");
		
		service.buyerupdate(vo);
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/";
	}
	
	
	@RequestMapping(value = "/rentInfo", method=RequestMethod.GET)
	public void rentInfoGET(Model model) throws Exception{		
		logger.info("register get.............");
	}
	
	// 비밀번호 수정 GET
	@RequestMapping(value = "/buyerpw", method=RequestMethod.GET)
	public void buyerpwGET(Model model) throws Exception{		
		logger.info("register get.............");
	}
	
	// 비밀번호 수정 POST
	@RequestMapping(value = "/buyerpw", method=RequestMethod.POST)
	public String buyerpwPOST(UserVO vo, RedirectAttributes rttr) throws Exception{		
		logger.info("register get.............");
		
		service.pwupdate(vo);
		
		rttr.addFlashAttribute("msg", "pwok");
		
		return "redirect:/";
	}
	
}
