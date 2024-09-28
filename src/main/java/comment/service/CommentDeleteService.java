package comment.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comment.bean.CommentDTO;
import comment.dao.CommentDAO;
import control.CommandProcess;

public class CommentDeleteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String seqCommentStr = request.getParameter("seq_comment");
        String seqBoardStr = request.getParameter("seq_board");  // 게시글 번호도 받아옵니다.
        
        System.out.println("seq_comment : " + seqCommentStr);
        System.out.println("seq_board : " + seqBoardStr);
        
        if (seqCommentStr != null && !seqCommentStr.isEmpty()) {
            long seq_comment = Long.parseLong(seqCommentStr);
            CommentDAO commentDAO = CommentDAO.getInstance();
            commentDAO.commentDelete(seq_comment);
            
            // 삭제 후 게시글 번호를 request에 저장
            request.setAttribute("seq_board", seqBoardStr);
        } else {
            System.out.println("seq_comment is null or empty");
        }
        
        return "/comment/commentDelete.jsp";
	}

}
