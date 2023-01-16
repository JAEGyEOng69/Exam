package kr.or.ddit.mapper;


import java.util.List;

import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.BookVO;

public interface GalleryMapper {
	
	public BookVO list(BookVO bookVO);
	
	public List<BookVO> bookList();
	
	public int updateAttach(AttachVO attachVO);
	
	public int deletePost(AttachVO attachVO);
	
	public List<BookVO> searchBook(BookVO bookVO);
	
	public int uploadAjaxAction(List<AttachVO> attachVOList);
	
	// 책의 이미지인 ATTACH 테이블의 다음 seq번호 가져오기
	public int getSeq(String bookId);
}
