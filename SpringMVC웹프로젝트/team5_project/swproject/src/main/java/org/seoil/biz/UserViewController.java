package org.seoil.biz;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.seoil.domain.UserVO;
import org.seoil.dto.LoginDTO;
import org.seoil.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/userview/*")
public class UserViewController {
	
	@Inject
	private UserService service;
	
	private static final Logger logger = LoggerFactory.getLogger(UserViewController.class);

	@RequestMapping(value = "/mainLogin", method=RequestMethod.GET)
	public void mainLoginGET(Model model) throws Exception{		
		logger.info("register get.............");
	}
	
	@RequestMapping(value = "/mainSign", method=RequestMethod.GET)
	public void mainSignGET(Model model) throws Exception{
		
	}
	
	@RequestMapping(value = "/buyerLogin", method=RequestMethod.GET)
	public void buyerLoginGET(@ModelAttribute("dto") LoginDTO dto) throws Exception{
		
	}
	
	 @RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	  public void loginPOST(LoginDTO dto, HttpSession session, Model model) throws Exception {

		 
	    UserVO vo = service.login(dto);
	    
		if(vo == null) {
			vo = null;
			return;
		} else if (vo.getAuth().equals("0")){
			model.addAttribute("userVO",vo);
			vo = null;
		} else if (vo.getAuth().equals("1")) {
			model.addAttribute("sellerVO",vo);
			vo = null;
		}
		
	}
	 
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
		
		Object obj1 = session.getAttribute("login");
		Object obj2 = session.getAttribute("sellerlogin");
		
		if(obj1 != null) {
			session.removeAttribute("login");
			session.invalidate();	
		} else if(obj2 != null) {
			session.removeAttribute("sellerlogin");
			session.invalidate();	
		}
		return "userview/logout";
		
	}
	
	// 구매자 회원가입화면 GET
	@RequestMapping(value = "/buyerSign", method=RequestMethod.GET)
	public void buyerSignGET(UserVO vo, Model model) throws Exception{
		logger.info("buyerSign");
	}
	
	
	// 구매자 회원가입정보 POST
	@RequestMapping(value = "/buyerSign", method=RequestMethod.POST)
	public String buyerSignPOST(UserVO vo, RedirectAttributes rttr) throws Exception{
		
		logger.info("Sign....");
		logger.info(vo.toString());
		
		service.buyersign(vo);
		rttr.addFlashAttribute("msg","signup");
		
		return "redirect:/";
	}
	
	
	//
	@RequestMapping(value = "/sellerLogin", method=RequestMethod.GET)
	public void sellerLoginGET(@ModelAttribute("dto") LoginDTO dto) throws Exception{
		
	}
	// 판매자 회원가입화면 GET
	@RequestMapping(value = "/sellerSign", method=RequestMethod.GET)
	public void sellerSignGET(UserVO vo, Model model) throws Exception{
		logger.info("sellerSign");
	}
	
	// 판매자 회원가입정보 POST
	@RequestMapping(value = "/sellerSign", method=RequestMethod.POST)
	public String sellerSignPOST(UserVO vo, RedirectAttributes rttr) throws Exception{
		
		logger.info("Sign......");
		logger.info(vo.toString());
		
		service.sellersign(vo);
		
		rttr.addFlashAttribute("msg","signup");
		
		return "redirect:/";
	}
	
	
}
