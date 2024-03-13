package com.seegene.web.admin.board.payrollNotice.vo;

import lombok.Data;

/**
 * 급여 고시  등록용 PO
 */
@Data
public class PayrollNoticeAddPO {
	

	/** 센터 종류 타입 코드 */
	private String codeLang;

	/** 언어 타입 코드 */
	private String codeCenter;
	
	/** 타이틀 */
	private String title;
	
	/** 급여 고시 번호 */
	private String payrollNoticeNumber;
	/** 게시물 내용 */
	private String content;
	
	/** 급여 고시 여부 */
	private String payrollNoticeFlag;

}
