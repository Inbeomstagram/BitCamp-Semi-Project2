package comment.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comment.dao.CommentDAO;
import control.CommandProcess;

public class CommentUpdateService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		Long seq_comment = Long.parseLong(request.getParameter("seq_comment"));
		Long seq_board = Long.parseLong(request.getParameter("seq_board"));
		String commentContent =request.getParameter("commentContent");
		
		Map<String,Object> map = new HashMap<>();
		
		map.put("seq_comment", seq_comment);
		map.put("seq_board", seq_board);
		map.put("commentContent", commentContent);
	
		CommentDAO commentDAO = CommentDAO.getInstance();
		
		commentDAO.commentUpdate(map);
		
		return "none";
	}

}
