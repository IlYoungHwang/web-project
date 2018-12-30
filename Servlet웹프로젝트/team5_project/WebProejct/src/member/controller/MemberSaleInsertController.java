package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import member.service.MemberService;
import member.vo.MemberVO;

public class MemberSaleInsertController implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String encType = "UTF-8";
		int maxSize = 5 * 1024 * 1024 ;
		String savePath = "/Users/hwang-il-yeong/Downloads/자바/WebProject/WebProejct/WebContent/upload";
		MultipartRequest multi = new MultipartRequest(request, savePath, maxSize,encType, new DefaultFileRenamePolicy());
		String saleclass = multi.getParameter("saleclass");
		String salename = multi.getParameter("salename");
		String saleoption = multi.getParameter("saleoption");
		String salefoodinfo = multi.getParameter("salefoodinfo");
		String saleprice = multi.getParameter("saleprice"); 

		MemberVO member = new MemberVO();
		member.setSaleClass(saleclass);
		member.setSaleName(salename);
		member.setSaleOption(saleoption);
		member.setSaleFoodinfo(salefoodinfo);
		member.setSaleprice(saleprice);
		
		MemberService service = MemberService.getInstance();
		service.memberSaleInsert(member);
		
		
		request.setAttribute("salename",salename);
		HttpUtil.forward(request, response, "/result/sale_createOutput.jsp");
	}
}