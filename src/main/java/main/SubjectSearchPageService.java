package main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import board.bean.BoardDTO;
import board.dao.BoardDAO;
import control.CommandProcess;

public class SubjectSearchPageService implements CommandProcess {
	private static final int page_size = 10; // 페이지당 항목 수
	
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int page = Integer.parseInt(request.getParameter("page")!=null?request.getParameter("page"):"1");  // default는 1페이지
		int startRow = (page-1)*page_size+1;
		int endRow = page*page_size;
		String keyword = request.getParameter("keyword");
		Map<String, Object> map = new HashMap<>();
		 map.put("startRow", startRow);
		 map.put("endRow", endRow);
		 map.put("keyword", keyword);
		 System.out.println(keyword);
		List<BoardDTO>list = BoardDAO.getInstance().searchBoardPagingList(map);
		
		 
        if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
            response.setContentType("application/json");
            Gson gson = new Gson();
            String jsonData = gson.toJson(list);
            response.getWriter().write(jsonData);
            return null;
        }
        System.out.println("hello");
        request.setAttribute("list", list);
        
        return "/searchPage/subjectSearchPage.jsp"; 
	}
}