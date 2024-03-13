package com.seegene.web.admin.code.vo;

import java.util.Date;

import lombok.Data;

/**
 * 자식 코드
 */
@Data
public class CodeSlaveVO implements Comparable<CodeSlaveVO>{

	/** 식별자 */
	private int seq;

	/** 자식 코드 */
	private String slaveCode;

	/** 자식 코드 이름 */
	private String slaveCodeName;

	/** 자식 코드 설명 */
	private String slaveCodeDes;

	/** 코드 마스터 */
	private String masterCode;
	/** 코드 순서 */
	private int codeOrder;

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
	
	@Override
	public int compareTo(CodeSlaveVO o) {
		return Integer.compare(this.codeOrder, o.getCodeOrder());
	}

}


