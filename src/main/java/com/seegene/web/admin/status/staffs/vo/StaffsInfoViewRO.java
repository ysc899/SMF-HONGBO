package com.seegene.web.admin.status.staffs.vo;

import java.util.Date;

import lombok.Data;

/**
 * 의료진 현황 의료진 정보 테이블
 */
@Data
public class StaffsInfoViewRO {

	/** 식별자 */
	private int seq;

	/** 언어 타입 코드 */
	private String codeLangType;
	private String codeLangName;

	/** 직위 */
	private String position;

	/** 이름 */
	private String name;

	/** 학위 */
	private String degree;

	/** 전문분야 */
	private String specialty;

	/** 최종 수정일 */
	private Date editDate;

	/** 최종 수정한 사용자 */
	private String editUserId;
	private String editUserName;

}
