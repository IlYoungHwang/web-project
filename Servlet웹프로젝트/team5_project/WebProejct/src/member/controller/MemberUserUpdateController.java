package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import member.service.MemberService;
import member.vo.MemberVO;

public class MemberUserUpdateController implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String user_id = request.getParameter("user_id");
		String mail = request.getParameter("mail");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String division = request.getParameter("division");
		
		MemberVO member = new MemberVO();
		member.setUser_id(user_id);
		member.setMail(mail);
		member.setPasswd(passwd);
		member.setName(name);
		member.setAddress(address);
		member.setPhone(phone);
		member.setDivision(division);
		
		
		MemberService service = MemberService.getInstance();
		int result = service.memberUserUpdate(member);
		

		if(result == 1){
		session.setAttribute("member", member);
		HttpUtil.forward(request, response, "/result/memberUpdateOutput.jsp");
		}else{
			System.out.println("회원정보 변경 실패");
		}
	}
}
