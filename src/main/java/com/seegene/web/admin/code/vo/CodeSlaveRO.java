package com.seegene.web.admin.code.vo;

import lombok.Data;

/**
 * 관리자 에서 등룩 수정 할때 사용할 코드 
 */
@Data
public class CodeSlaveRO {
	/** 식별자 */
	private int seq;

	/** 자식 코드 */
	private String slaveCode;

	/** 자식 코드 이름 */
	private String slaveCodeName;
}
