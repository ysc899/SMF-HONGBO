package com.seegene.web.admin.status.history.vo;

import java.util.Date;

import lombok.Data;

@Data
public class HistoryListRO {
	
	private int row;
	
	/** 식별자 */
	private int seq;


	/** 언어 타입 코드 */
	private String codeLangType;
	private String codeLangName;

	/** 년도 */
	private String year;
	/** 월 */
	private String month;

	/** 내용 */
	private String content;


	/** 출력 순서 */
	private int printOrder;

	/** 최종 수정일 */
	private Date editDate;


}

