package com.seegene.web.admin.board.payrollNotice.vo;

import java.util.List;

import lombok.Data;

/**
 * 급여 고시  파일 삭제 처리용 po
 */
@Data
public class PayrollNoticeFileDeletePO{

	/** 급여 고시  seq */
	private int payrollNoticeSeq;
	
	/** 삭제될 seqs */
	private List<Integer> deleteSeqs;
	/** 수정자 ID */
	private String editUserId;
	
}
