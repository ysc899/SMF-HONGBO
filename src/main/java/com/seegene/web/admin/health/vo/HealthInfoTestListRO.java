package com.seegene.web.admin.health.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 관리자 원클릭 건강정보 검사코드 리스트 RO
 */
@Getter
@Setter
@ToString
public class HealthInfoTestListRO implements Comparable<HealthInfoTestListRO> {
	

	/** 식별자 */
	private int seq;

	/** 검사코드 */
	private String testCode;

	/** 검사명 */
	private String testName;
	
	/** 코멘트 */
	private String comment;
	
	/** 하드 코딩 여부 */
	private String hardFlag;

	/** 최종 수정일 */
	private Date editDate;

	/** 최종 수정한 사용자 */
	private String editUserId;


	@Override
	public int compareTo(HealthInfoTestListRO o) {
		return Long.compare(editDate.getTime(), o.getEditDate().getTime());
	}
}
