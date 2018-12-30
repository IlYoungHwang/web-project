package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.service.MemberService;
import member.vo.MemberVO;

public class MemberSellerLoginController implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mail = request.getParameter("mail");
		String passwd = request.getParameter("passwd");
		
		
		MemberService service = MemberService.getInstance();
		MemberVO member = service.memberSellerLogin(mail,passwd);
		
		if(member != null){
		session.setAttribute("member", member);
		HttpUtil.forward(request, response, "index.jsp");
		}else{
			System.out.println("로그인 실패");
		}
	}

}
