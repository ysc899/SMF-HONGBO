package com.seegene.web.admin.board.payrollNotice.vo;

import lombok.Data;

/**
 * 급여 고시  수정용
 */
@Data
public class PayrollNoticeEditPO extends PayrollNoticeAddPO{
	
	/** 급여 고시  seq */
	private int seq;
	/** 삭제될 파일 json */
	private String deleteFileJSON;
	/** 수정한 사용자 ID */
	private String editUserId;
}

