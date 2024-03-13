package com.seegene.web.admin.board.payrollNotice.vo;

import lombok.Data;

/**
 * 급여 고시   파일 vo
 */
@Data
public class PayrollNoticeFileViewRO {

	/** 식별자 */
	private int seq;

	/** 파일 이름 */
	private String fileName;

	/** 파일 사이즈 */
	private long fileSize;

	/** 파일 다운 수 */
	private int downCnt;

}