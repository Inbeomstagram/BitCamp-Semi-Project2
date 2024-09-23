package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.CommandProcess;
import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class MemberUpdateService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String name = request.getParameter("name");
		String id = request.getParameter("id"); 
		String password = request.getParameter("password");
		String gender = request.getParameter("gender");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		String zipcode = request.getParameter("zipcode");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setName(name);
		memberDTO.setId(id);
		memberDTO.setPassword(password);
		memberDTO.setGender(gender);
		memberDTO.setEmail(email1+"@"+email2);
		memberDTO.setPhoneNumber(tel1+"-"+tel2+"-"+tel3);
		memberDTO.setZipcode(zipcode);
		memberDTO.setAddress(addr1+","+addr2);
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.update(memberDTO);
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "none";
	}

}
