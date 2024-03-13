package com.seegene.web.admin.code.vo;

import lombok.Data;

/**
 * 코드 수정용 파라미터
 */
@Data
public class CodeEditSlavePO {
	/** 식별자 */
	private int seq;
	/** 하위 코드 */
	private String slaveCode;
	/** 하위 설명 */
	private String slaveCodeName;
	/** 하위 이름 */
	private String slaveCodeDes;
	
	private int codeOrder;
	/** 신규여부 */
	private boolean newFlag;
	/** 수정 여부 */
	private boolean editFlag;
	
	/** 언어별 정보 json*/
	private String langsJSON;
}
