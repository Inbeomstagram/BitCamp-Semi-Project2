package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.CommandProcess;
import member.bean.MemberDTO;

public class BoardWriteFormService implements CommandProcess {
    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        HttpSession session = request.getSession();
        MemberDTO memberDTO = (MemberDTO)session.getAttribute("memDTO");        
        
        return "/board/boardWriteForm.jsp";
    }
}
