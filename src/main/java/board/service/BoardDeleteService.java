package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDAO;
import control.CommandProcess;

public class BoardDeleteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		long seq_board = Long.parseLong(request.getParameter("seq_board"));
		
		BoardDAO boardDAO = BoardDAO.getInstance();
		
		boardDAO.boardDelete(seq_board);
		
		return "/board/boardDelete.jsp";
	}

}
