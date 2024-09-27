package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDAO;
import control.CommandProcess;

public class BoardUpdateFromService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		long seq_board = Long.parseLong(request.getParameter("seq_board"));
		String image = request.getParameter("image");
		String imageSubject = request.getParameter("imageSubject");
		String imageContent = request.getParameter("imageContent");

		System.out.println("이미지 : " + image);
		System.out.println("제목 : " + imageSubject);
		System.out.println("내용 : " + imageContent);

		
		request.setAttribute("seq_board", seq_board);
		request.setAttribute("image", image);
		request.setAttribute("imageSubject", imageSubject);
		request.setAttribute("imageContent", imageContent);
		
		return "/board/boardUpdateForm.jsp";
	}

}
