package kr.or.ddit.service.Impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.BookMapper;
import kr.or.ddit.service.BookService;
import kr.or.ddit.vo.BookVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class BookServiceImpl implements BookService{

	@Inject
	BookMapper bookMapper;

	// 도서 목록
	@Override
	public List<BookVO> list() {
		return this.bookMapper.list();
	}

	@Override
	public BookVO detail(String bookId) {
		// TODO Auto-generated method stub
		return this.bookMapper.detail(bookId);
	}

	@Override
	public int update(BookVO bookVO) {
		
		log.info("before bookVO : " + bookVO);
		// merge into문 사용
		int result =  this.bookMapper.insert(bookVO);
		// bookId 를 확인호배자
		log.info("after bookVO : " + bookVO);
		
		return result;
	}

	@Override
	public int insert(BookVO bookVO) {
		// TODO Auto-generated method stub
		return this.bookMapper.insert(bookVO);
	}

	@Override
	public int delete(int bookId) {
		return this.bookMapper.delete(bookId);
	}
}
