package comment.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comment.bean.CommentDTO;
import comment.dao.CommentDAO;
import control.CommandProcess;

public class CommentViewService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 댓글 목록 불러오기
        
		long seq_board = Long.parseLong(request.getParameter("seq_board"));
		
		System.out.println("seq_board :" + seq_board);
		CommentDAO commentDAO = CommentDAO.getInstance();
		List<CommentDTO> commentList = commentDAO.commentList(seq_board);
       
        // 댓글 목록을 request에 담아 JSP로 전달
        request.setAttribute("commentList", commentList);
        
		return "/comment/commentView.jsp";
		
	}

}
