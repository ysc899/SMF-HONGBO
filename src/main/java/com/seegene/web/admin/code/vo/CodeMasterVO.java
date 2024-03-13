package com.seegene.web.admin.code.vo;

import java.util.Date;

import lombok.Data;

/**
 * 마스터 코드
 */
@Data
public class CodeMasterVO {

	/** 식별자 */
	private int seq;

	/** 마스터 코드 */
	private String masterCode;

	/** 마스터 코드 이름 */
	private String masterCodeName;

	/** 마스터 코드 설명 */
	private String masterCodeDes;

	/** 시스템 코드 여부 */
	private String systemCodeFlag;
	
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
