package com.mycompany.myapp.bookstore;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookstoreServiceImpl implements BookstoreService {
	@Autowired
	BookstoreDAO bookstoreDAO;

	@Override
	public int insertBookstore(BookstoreVO vo) {
		return bookstoreDAO.insertBookstore(vo);
	}

	@Override
	public int deleteBookstore(int seq) {
		return bookstoreDAO.deleteBookstore(seq);
	}

	@Override
	public int updateBookstore(BookstoreVO vo) {
		return bookstoreDAO.updateBookstore(vo);
	}

	@Override
	public BookstoreVO getBookstore(int seq) {
		return bookstoreDAO.getBookstore(seq);
	}

	@Override
	public List<BookstoreVO> getBookstoreList() {
		return bookstoreDAO.getBookstoreList();
	}
}