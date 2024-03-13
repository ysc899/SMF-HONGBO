package com.seegene.web.admin.code.vo;

import java.util.Date;

import lombok.Data;

/**
 * 자식 코드 설명
 */
@Data
public class CodeSlaveInfoVO {

	/** 식별자 */
	private int seq;
	/** 상위 코드 명 */
	private String masterCode;
	/** 하위 코드 명 */
	private String slaveCode;

	/** 언어 타입 코드 */
	private String codeLangType;

	/** 언어별 코드 이름 */
	private String infoName;

	/** 등록일 */
	private Date regDate;

	/** 최초 등록한 사용자 */
	private String regUserId;

	/** 최종 수정일 */
	private Date editDate;

	/** 최종 수정한 사용자 */
	private String editUserId;

	/** 삭제 여부 */
	private String deleteFlag;

}
