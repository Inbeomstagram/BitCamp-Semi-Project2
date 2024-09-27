package main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import board.bean.BoardDTO;
import board.dao.BoardDAO;
import control.CommandProcess;

public class SearchPageService implements CommandProcess {   
	private static final int page_size = 20; // 페이지당 항목 수

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {	
		System.out.println(request.getParameter("page"));
		int page = Integer.parseInt(request.getParameter("page")!=null?request.getParameter("page"):"1");  // default는 1페이지
		int startRow = (page-1)*page_size+1;
		int endRow = page*page_size;
		
		List<BoardDTO>list = BoardDAO.getInstance().getBoardPagingList(startRow, endRow);
		
		 
        if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
            response.setContentType("application/json");
            Gson gson = new Gson();
            String jsonData = gson.toJson(list);
            response.getWriter().write(jsonData);
            return "none";
        }
        request.setAttribute("list", list);
        return "/searchPage/searchPage.jsp"; 
	}
}