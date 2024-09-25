package board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.bean.BoardDTO;
import board.dao.BoardDAO;
import control.CommandProcess;

public class BoardListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		
		
		BoardDAO boardDAO = BoardDAO.getInstance();
				
		List<BoardDTO> list = boardDAO.getBoardList();
		
		request.setAttribute("list", list);
		
		
		return "/board/boardList.jsp";
	}

}
