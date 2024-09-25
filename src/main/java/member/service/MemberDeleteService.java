package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.CommandProcess;
import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class MemberDeleteService implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("memDTO");
		MemberDAO.getInstance().delete(memberDTO);
		
		session.removeAttribute("memDTO");					
		session.invalidate();
		
		return "none";
	}

}
