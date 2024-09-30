package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.CommandProcess;
import member.bean.MemberDTO;

public class MypageFormService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("memDTO");
		
        if (memberDTO == null) {
            // 세션이 없을 경우 로그인 페이지로 리다이렉트
            response.sendRedirect("/Inbeomstagram/login.jsp");
            return null; // 리다이렉트 후 아무 것도 반환하지 않음
        }
		
		return "/member/mypageForm.jsp";
	}

}
