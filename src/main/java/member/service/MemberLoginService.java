package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.CommandProcess;
import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class MemberLoginService implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		MemberDTO memberDTO = MemberDAO.getInstance().login(id, password);
		
		if(memberDTO == null) {
			System.out.println("hello");
			return "/member/loginFail.jsp";
		}			
		else {
			//세션
			HttpSession session = request.getSession(); //세션 생성			
			session.setAttribute("memDTO", memberDTO);
		
			return "/member/loginOk.jsp";
		}
	}
	
}
