package com.seegene.web.user.foundation.history.vo;

import lombok.Data;

@Data
public class HistoryUserListRO {
	
	/** 연혁 년 */
	private String year;

	/** 연혁 월 */
	private String month;

	/** 연혁 종료 년 */
	private String endYear;
	/** 연혁 내용 */
	private String content;

	/** 연혁 출력 순서 */
	private int printOrder;
}
