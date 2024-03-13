package com.seegene.web.admin.board.payrollNotice.vo;

import lombok.Data;

/**
 * 급여 고시 파일 다운로드용
 */
@Data
public class PayrollFileDownPO {
	
	/** 급여 고시   seq */
	private int payrollNoticeSeq;
	/** 급여 고시   파일 seq */
	private int payrollNoticeFileSeq;
	
}

