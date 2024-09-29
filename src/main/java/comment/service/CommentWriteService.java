package comment.service;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comment.bean.CommentDTO;
import comment.dao.CommentDAO;
import control.CommandProcess;

public class CommentWriteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String commentContent = request.getParameter("commentContent");
		long seq_board = Long.parseLong(request.getParameter("seq_board"));
		String name = request.getParameter("name");
		
		
		
		CommentDTO commentDTO = new CommentDTO();
		
		commentDTO.setCommentContent(commentContent);
		commentDTO.setSeq_board(seq_board);
		commentDTO.setName(name);
		
		CommentDAO commentDAO = CommentDAO.getInstance();
		commentDAO.commentWrite(commentDTO);
		
		
		List<CommentDTO> commentList = commentDAO.commentList(seq_board);
	       
        // 댓글 목록을 request에 담아 JSP로 전달
        request.setAttribute("commentList", commentList);
        
		
		return "/comment/commentView.jsp";
	}

}
