package com.seegene.web.admin.status.history.vo;

import lombok.Data;

/**
 * 연혁 등록 기본 정보
 */
@Data
public class HistoryAddPO {
	/** 언어 구분 코드 */
	private String codeLang;
	/** 선택된 날짜*/
	private String selectDate;
	/** 내용 */
	private String content;
	
	private int printOrder;
}
