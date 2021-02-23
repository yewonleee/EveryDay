package com.mycompany.myapp.bookstore;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BookstoreDAO {
	@Autowired
	SqlSession sqlSession;

	public int insertBookstore(BookstoreVO vo) {
		int result = sqlSession.insert("Bookstore.insertBookstore", vo);
		return result;
	}

	public int updateBookstore(BookstoreVO vo) {
		int result = sqlSession.update("Bookstore.updateBookstore", vo);
		return result;
	}

	public int deleteBookstore(int seq) {
		int result = sqlSession.delete("Bookstore.deleteBookstore", seq);
		return result;
	}

	public BookstoreVO getBookstore(int seq) {
		BookstoreVO result = sqlSession.selectOne("Bookstore.getBookstore", seq);
		return result;
	}

	public List<BookstoreVO> getBookstoreList() {
		List<BookstoreVO> result = sqlSession.selectList("Bookstore.getBookstoreList");
		return result;
	}
}

