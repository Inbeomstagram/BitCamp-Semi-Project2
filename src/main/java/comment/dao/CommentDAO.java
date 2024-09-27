package comment.dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import comment.bean.CommentDTO;

public class CommentDAO  {

	private SqlSessionFactory sqlSessionFactory;
	private static CommentDAO instance = new CommentDAO();
	
	
	public static CommentDAO getInstance() {
		return instance;
	}
	
	
	public CommentDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}


	public void commentWrite(CommentDTO commentDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		sqlSession.insert("commentSQL.commentWrite", commentDTO);
		sqlSession.commit();
		sqlSession.close();
		
	}

	
    public List<CommentDTO> commentList(long seq_board) {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        List<CommentDTO> list = sqlSession.selectList("commentSQL.commentList", seq_board);
        sqlSession.close();
        return list;
    }
	
}

