package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import control.CommandProcess;
import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class MemberUpdateFormService implements CommandProcess {
    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        // 세션에서 MemberDTO 객체를 가져오기
        HttpSession session = request.getSession();
        MemberDTO sessionMemberDTO = (MemberDTO)session.getAttribute("memDTO");

        // sessionMemberDTO에서 id를 추출
        String id = sessionMemberDTO.getId();  // MemberDTO의 getId() 메서드를 사용하여 id를 가져옴

        // DB에서 해당 id로 멤버 정보 가져오기
        MemberDAO memberDAO = MemberDAO.getInstance();
        MemberDTO memberDTO = memberDAO.getMember(id);
        
        // request에 memberDTO 저장
        request.setAttribute("memberDTO", memberDTO);
        return "/member/updateForm.jsp";
    }
}

