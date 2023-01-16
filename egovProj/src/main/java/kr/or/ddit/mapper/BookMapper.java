package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.BookVO;

public interface BookMapper {
	
	// 도서 목록
	public List<BookVO> list();
	
	public BookVO detail(String bookId);
	
	public int update(BookVO bookVO);
	
	public int insert(BookVO bookVO);
	
	public int delete(int bookId);
}
 