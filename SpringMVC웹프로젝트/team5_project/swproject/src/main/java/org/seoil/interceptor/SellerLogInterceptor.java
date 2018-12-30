package org.seoil.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SellerLogInterceptor extends HandlerInterceptorAdapter {
	
	private static final String LOGIN = "sellerlogin";
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	
	  @Override
	  public void postHandle(HttpServletRequest request,
	  HttpServletResponse response, Object handler,
	  ModelAndView modelAndView) throws Exception {
	  
	  HttpSession session = request.getSession();
	  
	  ModelMap modelMap = modelAndView.getModelMap();
	  Object userVO = modelMap.get("sellerVO");
	  
	  if(userVO != null){
	  
	  logger.info("new login success");
	  session.setAttribute(LOGIN, userVO);
	  //response.sendRedirect("/");
	  
	  Object dest = session.getAttribute("dest2");
	  
	  response.sendRedirect(dest != null ? (String)dest:"/");
	  
	   }
	   }

	  @Override
	  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

	    HttpSession session = request.getSession();

	    if (session.getAttribute(LOGIN) != null) {
	      logger.info("clear login data before");
	      session.removeAttribute(LOGIN);
	    }

	    return true;
	  }
}
