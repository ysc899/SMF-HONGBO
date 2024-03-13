package com.seegene.web.user.inspection.staffs.vo;

import lombok.Data;

/**
 * 의료진현황에 약력 데이터
 */
@Data
public class StaffsUserHistoryListRO implements Comparable<StaffsUserHistoryListRO>{

	/** 현재 여부 */
	private String nowFlag;
	
	/** 내용 */
	private String content;

	/** 보조 내용 */
	private String comment;
	
	private int printOrder;

	@Override
	public int compareTo(StaffsUserHistoryListRO o) {
		return Integer.compare(this.printOrder, o.getPrintOrder());
	}
	
	
	
}
