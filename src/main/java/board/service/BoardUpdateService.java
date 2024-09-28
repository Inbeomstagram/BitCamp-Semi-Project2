package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.bean.BoardDTO;
import board.dao.BoardDAO;
import control.CommandProcess;

public class BoardUpdateService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		String realFolder = request.getServletContext().getRealPath("/storage");
		System.out.println("realFolder = " + realFolder);

		// 업로드
		MultipartRequest multipartRequest = new MultipartRequest(request, realFolder, // 이미지가 실제로 저장되는 위치
				5 * 1024 * 1024, "UTF-8", // 5MB
				// 똑같은 이름이 업로드 되면 파일명을 변경해서 올린다.
				new DefaultFileRenamePolicy());

		long seq_board = Long.parseLong(multipartRequest.getParameter("seq_board"));
		String image = multipartRequest.getOriginalFileName("image");
		String imageSubject = multipartRequest.getParameter("imageSubject");
		String imageContent = multipartRequest.getParameter("imageContent");
		
		BoardDTO boardDTO = new BoardDTO();

		boardDTO.setSeq_board(seq_board);
		boardDTO.setImage(image);
		boardDTO.setImageSubject(imageSubject);
		boardDTO.setImageContent(imageContent);

		BoardDAO boardDAO = BoardDAO.getInstance();

		boardDAO.boardUpdate(boardDTO);
		
		return "none";
	}

}
