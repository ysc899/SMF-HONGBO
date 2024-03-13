package com.seegene.web.admin.board.notice.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 공문 삭제용 po
 */
@Getter
@Setter
@ToString
public class BoardNoticeDeletePO {

	/** 식별자 */
	private int seq;

	/** 최종 수정한 사용자 */
	private String editUserId;
	
}
