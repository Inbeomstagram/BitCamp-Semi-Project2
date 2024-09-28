package member.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.bean.BoardDTO;
import board.dao.BoardDAO;
import control.CommandProcess;

public class MypageSupService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		System.out.println(request.getParameter("seq_member"));
		
        BoardDAO boardDAO = BoardDAO.getInstance();
        
        Long seq_member =Long.parseLong(request.getParameter("seq_member"));
        List<BoardDTO> mypagelist = boardDAO.getMyBoardList(seq_member);

        request.setAttribute("mypagelist", mypagelist);
        
        return "/member/mypageSup.jsp";
	}

}
