package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import member.service.MemberService;
import member.vo.MemberVO;


public class MemberSellerUpdateController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String seller_id = request.getParameter("seller_id");
		String sellername = request.getParameter("sellername");
		String selleraddress = request.getParameter("selleraddress");
		String sellerhours = request.getParameter("sellerhours");
		String sellerphone = request.getParameter("sellerphone");
		
		
		MemberVO member = new MemberVO();
		member.setSeller_id(seller_id);
		member.setSellerName(sellername);
		member.setSellerAddress(selleraddress);
		member.setSellerHours(sellerhours);
		member.setSellerPhone(sellerphone);
		
		
		MemberService service = MemberService.getInstance();
		int result = service.memberSellerUpdate(member);
		

		if(result == 1){
		session.setAttribute("member", member);
		HttpUtil.forward(request, response, "/result/memberUpdateOutput.jsp");
		}
	}

}
