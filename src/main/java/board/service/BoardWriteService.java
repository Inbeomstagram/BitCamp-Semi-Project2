package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.bean.BoardDTO;
import board.dao.BoardDAO;
import control.CommandProcess;

public class BoardWriteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		// 실제 폴더

		/*
		 * HttpSession session = request.getSession(); MemberDTO sessionMemberDTO =
		 * (MemberDTO)session.getAttribute("memDTO"); long seq_member =
		 * sessionMemberDTO.getSeq_member();
		 * 
		 * System.out.println(seq_member);
		 */

		String realFolder = request.getServletContext().getRealPath("/storage");
		System.out.println("realFolder = " + realFolder);

		// 업로드
		MultipartRequest multipartRequest = new MultipartRequest(request, realFolder, // 이미지가 실제로 저장되는 위치
				5 * 1024 * 1024, "UTF-8", // 5MB
				// 똑같은 이름이 업로드 되면 파일명을 변경해서 올린다.
				new DefaultFileRenamePolicy());

		long seq_member = Long.parseLong(multipartRequest.getParameter("seq_member"));
		String image = multipartRequest.getOriginalFileName("image");
		String name = multipartRequest.getParameter("name");
		String imageSubject = multipartRequest.getParameter("imageSubject");
		String imageContent = multipartRequest.getParameter("imageContent");

		System.out.println(seq_member);
		System.out.println(image);
		System.out.println(imageSubject);
		System.out.println(imageContent);
		BoardDTO boardDTO = new BoardDTO();

		boardDTO.setSeq_member(seq_member);
		boardDTO.setName(name);
		boardDTO.setImage(image);
		boardDTO.setImageSubject(imageSubject);
		boardDTO.setImageContent(imageContent);

		BoardDAO boardDAO = BoardDAO.getInstance();

		boardDAO.boardWrite(boardDTO);

		return "none";
	}

}
