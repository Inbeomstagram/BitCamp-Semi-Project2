package comment.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comment.dao.CommentDAO;
import control.CommandProcess;

public class CommentHitService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		long seq_board = Long.parseLong(request.getParameter("seq_board"));
		
		CommentDAO commentDAO = CommentDAO.getInstance();
		
		commentDAO.hitUpdate(seq_board);
		
		return "/board/boardView.jsp";
	}

}
