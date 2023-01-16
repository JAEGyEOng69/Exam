package kr.or.ddit.security;

import javax.inject.Inject;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import kr.or.ddit.mapper.MemberMapper;
import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomUserDetailsService implements UserDetailsService {
		
	@Inject
	MemberMapper memberMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		// username은 사용자 아이디. 로그인 화면에서 입력된 아이디의 값을 말한다.
		log.warn("Load User Byu UserName :" + username);
		
		// 사용자 아이디를 통해 해당 MEMBER 테이블의 1행 데이터를 받아서 MemberVO에 넣자
		log.info("&&");
		MemberVO memberVO =  memberMapper.read(username);
		log.info("===========================");
		log.warn("queried by member mapper : " + memberVO.toString());
		
		return memberVO==null?null:new CustomUser(memberVO);
	}
	
}
