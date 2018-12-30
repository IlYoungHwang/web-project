package org.seoil.biz;

import javax.inject.Inject;

import org.seoil.domain.Criteria;
import org.seoil.domain.PageMaker;
import org.seoil.domain.RentVO;
import org.seoil.domain.UsedVO;
import org.seoil.domain.UserVO;
import org.seoil.service.CarService;
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
@RequestMapping("/userinfo/sellerinfo/*")
public class SellerInfoController {
	

	
	// 자동차 정보 서비스 주입
	@Inject
	private CarService carservice;
	
	// 유저 정보 서비스 주입
	@Inject
	private UserService useservice;
	
	private static final Logger logger = LoggerFactory.getLogger(SellerInfoController.class);
	
	
	// 판매자 패스워드 수정 GET
	@RequestMapping(value = "/sellerpw", method=RequestMethod.GET)
	public void buyerpwGET(Model model) throws Exception{		
		logger.info("register get.............");
	}
	
	
	//  패스워드 저장정보 저장 POST
	@RequestMapping(value = "/sellerpw", method=RequestMethod.POST)
	public String buyerpwPOST(UserVO vo,RedirectAttributes rttr) throws Exception{		
		logger.info("register get.............");
		
		useservice.pwupdate(vo);
		rttr.addFlashAttribute("msg", "pwok");
		
		return "redirect:/";
	}
	
	// 판매자 회원정보 수정 화면 GET
	@RequestMapping(value = "/promodify", method=RequestMethod.GET)
	public void promodifyGET(@RequestParam("no") int no,Model model) throws Exception{		
		logger.info("1register get.............");
			
		model.addAttribute(useservice.sellerread(no));
		
	}
	
	// 회원정보 정보 수정 POST
	@RequestMapping(value = "/promodify", method=RequestMethod.POST)
	public String promodifyPOST(UserVO vo, RedirectAttributes rttr) throws Exception{		
		logger.info("1register get.............");
			
		logger.info("buyerupdate ....... ");
		
		useservice.sellerupdate(vo);
		rttr.addFlashAttribute("msg", "success");
			
		return "redirect:/";
	}
	
	// 구매자 회원 프로필 요청 GET
	@RequestMapping(value = "/profile", method=RequestMethod.GET)
	public void profileGET(@RequestParam("no") int no,Model model) throws Exception{		
		logger.info("1register get.............");
			
		model.addAttribute(useservice.sellerread(no));
	}

	
	// 중고차량 정보 저장 화면 GET
	@RequestMapping(value = "/usedAdd", method=RequestMethod.GET)
	public void usedAddGET(UsedVO vo, RedirectAttributes rttr) throws Exception{		
		logger.info("2register get.............");
	}
	
	
	// 중고차량 정보 저장 POST
	@RequestMapping(value = "/usedAdd", method=RequestMethod.POST)
	public String usedAddPOST(UsedVO vo, RedirectAttributes rttr) throws Exception{		
		
		logger.info("3register get.............");
		logger.info(vo.toString());
		
		carservice.usedadd(vo);
		rttr.addFlashAttribute("msg","success");
		
		return "redirect:/";
	}
	 
	// 중고 차량 정보 GET
	 @RequestMapping(value = "/usedInfo", method = RequestMethod.GET)
	  public void usedInfo(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		logger.info("usedlist get .............. ");

	    model.addAttribute("list", carservice.usedCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		//pageMaker.setTotalCount(50);
		
		pageMaker.setTotalCount(carservice.usedCountCriteria(cri));
		
	    model.addAttribute("pageMaker", pageMaker);
	  }
	
	
	 
	 // 중고차량 정보 화면 GET
	@RequestMapping(value = "/usedPage", method=RequestMethod.GET)
	public void usedPage(@RequestParam("no") int no, @ModelAttribute("cri") Criteria cri, Model model) throws Exception{
		logger.info("show rentread.... ");
		
		model.addAttribute(carservice.usedread(no));
	}
	
	
	// 중고차량 정보 삭제 POST
	@RequestMapping(value = "/usedmove", method=RequestMethod.POST)
	public String usedmove(@RequestParam("no") int no, RedirectAttributes rttr) throws Exception{
		
		carservice.usedmove(no);
		
		rttr.addFlashAttribute("msg", "usedmove");
		
		return "redirect:/userinfo/sellerinfo/usedInfo";
	}
	
	
	// 중고차량 수정화면 GET
	@RequestMapping(value = "/usedModify", method=RequestMethod.GET)
	public void usedModifyGET(@RequestParam("no") int no, @ModelAttribute("cri") Criteria cri, Model model) throws Exception{
		
		model.addAttribute(carservice.usedread(no));
		
	}
	
	// 중고차량 정보 수정 POST
	@RequestMapping(value = "/usedModify", method=RequestMethod.POST)
	public String usedModifyPOST(UsedVO vo, RedirectAttributes rttr) throws Exception {
		
		logger.info("rent modify..");
		carservice.usedmodify(vo);
		rttr.addFlashAttribute("msg", "modify");
		
		return "redirect:/userinfo/sellerinfo/usedInfo";
	}
	
	
	
	
	
	
	
	 // 렌트차량 정보 수정 화면 GET
	@RequestMapping(value = "/rentModify", method=RequestMethod.GET)
	public void rentModifyGET(@RequestParam("no") int no, @ModelAttribute("cri") Criteria cri,Model model) throws Exception{
		
		model.addAttribute(carservice.rentread(no));
	}
	
	
	 // 렌트차량 정보 수정 POST
	@RequestMapping(value = "/rentModify", method=RequestMethod.POST)
	public String rentModifyPOST(RentVO vo, RedirectAttributes rttr) throws Exception {
		
		logger.info("rent modify..");
		carservice.rentmodify(vo);
		
		rttr.addFlashAttribute("msg", "modify");
		
		return "redirect:/userinfo/sellerinfo/rentInfo";
	}
	
	@RequestMapping(value = "/rentmove", method=RequestMethod.POST)
	public String rentmove(@RequestParam("no") int no, RedirectAttributes rttr) throws Exception{
		
		carservice.rentmove(no);
		
		rttr.addFlashAttribute("msg", "rentmove");
		
		return "redirect:/userinfo/sellerinfo/rentInfo";
	}
	
	@RequestMapping(value = "/rentPage", method=RequestMethod.GET)
	public void rentPage(@RequestParam("no") int no, @ModelAttribute("cri") Criteria cri, Model model) throws Exception{
		logger.info("show rentread.... ");
		
		model.addAttribute(carservice.rentread(no));
	}
	
	@RequestMapping(value = "/rentInfo", method=RequestMethod.GET)
	public void rentInfoGET(@ModelAttribute("cri") Criteria cri, Model model) throws Exception{		
		logger.info("rentlist get.............");
		
		model.addAttribute("list", carservice.rentCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(carservice.rentCountCriteria(cri));
		model.addAttribute("pageMaker",pageMaker);
		
	}
	
	
	
	// 렌트차량 정보 저장 화면 GET
	@RequestMapping(value = "/rentAdd", method=RequestMethod.GET)
	public void rentAddGET(RentVO vo, RedirectAttributes rttr) throws Exception{		
		logger.info("zregister get.............");
	}
	
	
	// 렌트차량 정보 저장 POST
	@RequestMapping(value = "/rentAdd", method=RequestMethod.POST)
	public String rentAddPOST(RentVO vo, RedirectAttributes rttr) throws Exception{		
		logger.info(",,register get.............");
		logger.info(vo.toString());
		
		
		carservice.rentadd(vo);
		rttr.addFlashAttribute("msg", "rentadd");
		
		return "redirect:/userinfo/sellerinfo/rentInfo";
	}
	
	
	
}
