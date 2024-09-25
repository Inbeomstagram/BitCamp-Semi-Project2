package member.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import member.bean.MemberDTO;

public class MemberDAO {
	private SqlSessionFactory sqlSessionFactory;
	private static MemberDAO instance = new MemberDAO();
	
	public static MemberDAO getInstance() {
		return instance;
	}

	public MemberDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public boolean isExistId(String id){
		boolean exist = false;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.isExistId", id);
		if(memberDTO != null) exist = true; //id가 존재, 사용 불가능
		sqlSession.close();
		return exist;
	}
	public void join(MemberDTO memberDTO) {		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.insert("memberSQL.join", memberDTO);
		sqlSession.commit();
		sqlSession.close();
	}
	
	public MemberDTO login(String id, String password){
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("password", password);
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.login", map);
		sqlSession.close();		
		return memberDTO;
	}
	
	public MemberDTO getMember(String id){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.getMember", id);
		sqlSession.close();		
		return memberDTO;
	}
	
	public void update(MemberDTO memberDTO){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("memberSQL.update", memberDTO);
		sqlSession.commit();
		sqlSession.close();
	}
	public void delete(MemberDTO memberDTO){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("memberSQL.delete", memberDTO);
		sqlSession.commit();
		sqlSession.close();
	}
}
