package board.dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.bean.BoardDTO;

public class BoardDAO {
	private SqlSessionFactory sqlSessionFactory;
	private static BoardDAO instance = new BoardDAO();
	
	public static BoardDAO getInstance() {
		return instance;
	}
	
	public BoardDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public void boardWrite(BoardDTO boardDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.insert("boardSQL.boardWrite", boardDTO);
		sqlSession.commit();
		sqlSession.close();
		
	}

	public List<BoardDTO> getBoardList() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<BoardDTO> list = sqlSession.selectList("boardSQL.getBoardList");
		sqlSession.close();
		
		return list;
	}
	
	public List<BoardDTO>getBoardPagingList(int startRow, int endRow){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		 Map<String, Integer> params = new HashMap<>();
	     params.put("startRow", startRow);
	     params.put("endRow", endRow);
	     List<BoardDTO> list = sqlSession.selectList("boardSQL.getBoardPagingList", params);
	     sqlSession.close();
	     return list;
	}
	
	public List<BoardDTO>getBoardPopularPagingList(int startRow, int endRow){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		 Map<String, Integer> params = new HashMap<>();
	     params.put("startRow", startRow);
	     params.put("endRow", endRow);
	     List<BoardDTO> list = sqlSession.selectList("boardSQL.getBoardPopularPagingList", params);
	     sqlSession.close();
	     return list;
	}
	
	public BoardDTO getBoard(long seq_board) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		BoardDTO boardDTO = sqlSession.selectOne("boardSQL.getBoard", seq_board);
		sqlSession.close();
		
		
		return boardDTO;
	}
	
	
	
}
