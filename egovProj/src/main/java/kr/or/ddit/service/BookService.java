package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BookVO;

public interface BookService {

	// 도서 목록
	public List<BookVO> list();

	// 디테일
	public BookVO detail(String bookId);

	public int update(BookVO bookVO);

	public int insert(BookVO bookVO);

	public int delete(int bookId);

	
}
