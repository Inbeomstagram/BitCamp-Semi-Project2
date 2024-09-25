package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.bean.BoardDTO;
import board.dao.BoardDAO;
import control.CommandProcess;

public class BoardViewService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		BoardDAO boardDAO = BoardDAO.getInstance();
		
		long seq_board =Long.parseLong(request.getParameter("seq_board"));
		System.out.println(seq_board);
		
		BoardDTO boardDTO = boardDAO.getBoard(seq_board);
		
		
		request.setAttribute("boardDTO", boardDTO);
		
		return "/board/boardView.jsp";
	}

}
