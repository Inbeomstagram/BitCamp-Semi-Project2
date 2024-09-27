package main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import board.bean.BoardDTO;
import board.dao.BoardDAO;
import control.CommandProcess;

public class PopularPageService implements CommandProcess {   
	private static final int page_size = 20; // 페이지당 항목 수

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    response.setContentType("application/json; charset=UTF-8");
		int page = Integer.parseInt(request.getParameter("page")!=null?request.getParameter("page"):"1");  // default는 1페이지
		int startRow = (page - 1) * page_size;  // 0 기반으로 계산
		int endRow = page * page_size;  // 마지막 행은 그대로
		
		List<BoardDTO>list = BoardDAO.getInstance().getBoardPopularPagingList(startRow, endRow);
		
		 
        if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
            response.setContentType("application/json");
            Gson gson = new Gson();
            String jsonData = gson.toJson(list);
            response.getWriter().write(jsonData);
            return "none";
        }
        request.setAttribute("list", list);
        return "/popularPage/popularPage.jsp"; 
	}
}