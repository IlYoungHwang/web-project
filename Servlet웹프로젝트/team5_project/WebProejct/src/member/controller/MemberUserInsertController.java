package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.MemberService;
import member.vo.MemberVO;

public class MemberUserInsertController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String mail = request.getParameter("mail");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String division = request.getParameter("division");
		String sellername = request.getParameter("sellername");
		String selleraddress = request.getParameter("selleraddress");
		String sellerhours = request.getParameter("sellerhours");
		String sellerphone = request.getParameter("sellerphone");
		
		
		if(division.equals("0")){
			MemberVO member = new MemberVO();
			member.setMail(mail);
			member.setPasswd(passwd);
			member.setName(name);
			member.setAddress(address);
			member.setPhone(phone);
			member.setDivision(division);
		
			MemberService service = MemberService.getInstance();
			service.memberUserInsert(member);
		
		}else if(division.equals("1")){
			
			MemberVO member = new MemberVO();
			member.setMail(mail);
			member.setPasswd(passwd);
			member.setName(name);
			member.setAddress(address);
			member.setPhone(phone);
			member.setDivision(division);
			member.setSellerName(sellername);
			member.setSellerAddress(selleraddress);
			member.setSellerHours(sellerhours);
			member.setSellerPhone(sellerphone);
			
			MemberService service = MemberService.getInstance();
			service.memberUserInsert(member);
			
		}
		
		request.setAttribute("name", name);
		HttpUtil.forward(request, response, "/result/user_signupOutput.jsp");
	}

}