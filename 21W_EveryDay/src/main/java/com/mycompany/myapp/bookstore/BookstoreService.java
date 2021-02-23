package com.mycompany.myapp.bookstore;

import java.util.List;

public interface BookstoreService {
	public int insertBookstore(BookstoreVO vo);

	public int deleteBookstore(int seq);

	public int updateBookstore(BookstoreVO vo);

	public BookstoreVO getBookstore(int seq);

	public List<BookstoreVO> getBookstoreList();
}
