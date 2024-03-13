package com.seegene.web.admin.code.vo;

import lombok.Data;

/**
 * 코드 수정용 파라미터
 */
@Data
public class CodeEditPO {
	/** 식별자 */
	private int seq;
	/** 마스터 코드 */
	private String masterCode;
	/** 마스터 설명 */
	private String masterCodeDes;
	/** 마스터 이름 */
	private String masterCodeName;
	/** 하위 코드 json*/
	private String slaveCodeJSON;
}
