package kr.or.ddit.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.service.BookService;
import kr.or.ddit.vo.BookVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/book")
@Controller
public class BookController {
	
	@Inject
	BookService bookService;
	
	@GetMapping("/list")
	public String list(Model model) {
		
		List<BookVO> bookVOList = this.bookService.list();
		log.info("bookVOList : "+ bookVOList);
		model.addAttribute("bodyTitle","도서 목록");
		model.addAttribute("bookVOList",bookVOList);
		//forwarding
		return "book/list";
	}
	
	// 요청URI: /book/detail?bookId=3
	// 요청 파라미터 : bookId=3
	// 메소드 이름 : detail
	// 목록에서 title을 클릭 시 상세페이지로 이동
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/detail")
	public String detail(@RequestParam String bookId, Model model) {
		log.info("detail에 왔다");
		log.info("bookId : " + bookId);
		BookVO bookVO = this.bookService.detail(bookId);
		model.addAttribute("bodyTitle","도서 상세");
		model.addAttribute("bookVO", bookVO);
		return "book/detail";
	}
	

	
//	@GetMapping("/updatePost")
//	public String write(@ModelAttribute BookVO bookVO) {
//		return "book/detail";
//	}
	@PostMapping("/updatePost")
	public String updatePost(@ModelAttribute BookVO bookVO) {
		log.info("bookVO : "+bookVO.toString());
		int bookId = bookVO.getBookId();
		// 회원정보 변경
		int result = this.bookService.update(bookVO);
		log.info("result : " + result);
		
		return "redirect:/book/detail?bookId="+bookId;
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value="/create", method=RequestMethod.GET)
	public ModelAndView create(Model model) {
		/*
		 ModelAndView
		 1) Model : Controller가 반환할 데이터(String, int, List, Map, VO..)를 담당
		 2) View : 화면을 담당(뷰(View : JSP)의 경로)
		 */
		ModelAndView mav = new ModelAndView();
		model.addAttribute("bodyTitle","도서 입력");
		// prefix : /WEB-INF/views/
		//forwarding
		mav.setViewName("book/create");
		// suffix : .jsp
		return mav;
	}
	
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public ModelAndView createPost(@ModelAttribute BookVO bookVO,
			ModelAndView mav, Model model) {
		log.info("bookVO : " + bookVO.toString());
		
		//<selectKey order="BEFORE" resultType="integer" keyProperty="bookId">
		//1증가된 기본키 값을 받음
		int bookId = this.bookService.insert(bookVO);
		model.addAttribute("bodyTitle","도서 입력");
		
		if(bookId<1) {//등록 실패
	//		ModelAndView mav = new ModelAndView();
			// /create로 redirect => 요청을 다시 함 => uri주소가 바뀜
			mav.setViewName("redirect:/create");
		}else {//등록 성공
			mav.setViewName("redirect:/book/list");
		}
		return mav;
	}
	@PostMapping("/delete")
	public String deletePost(@ModelAttribute BookVO bookVO) {
		log.info("bookVO :" +bookVO);
		
		int result = this.bookService.delete(bookVO.getBookId());
		log.info("삭제 result : " + result);
		
		
		return "redirect:/book/list";
	}
}
