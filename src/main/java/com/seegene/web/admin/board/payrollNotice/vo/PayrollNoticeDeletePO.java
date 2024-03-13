package com.seegene.web.admin.board.payrollNotice.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 공문 삭제용 po
 */
@Getter
@Setter
@ToString
public class PayrollNoticeDeletePO {

	/** 식별자 */
	private int seq;

	/** 최종 수정한 사용자 */
	private String editUserId;
	
}
