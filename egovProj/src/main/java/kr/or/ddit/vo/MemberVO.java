package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

@Data
public class MemberVO {

	private String memId;
	private String memName;
	private String memHp;
	private String memJob;
	private String memLike;
	private String memPass;
	private String enabled;
	
	// 1:N
	private List<MemberAuthVO> memberAuthVOList;
}
