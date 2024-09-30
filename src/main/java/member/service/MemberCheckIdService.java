package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;
import member.dao.MemberDAO;

public class MemberCheckIdService implements CommandProcess{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터
		String id = request.getParameter("id");
		
		//id가 있으면 true(사용 불가능), id가 없으면 false(사용 가능)
		boolean exist = MemberDAO.getInstance().isExistId(id);
		
		request.setAttribute("exist", exist);
		return "/member/checkId.jsp";
	}
}
