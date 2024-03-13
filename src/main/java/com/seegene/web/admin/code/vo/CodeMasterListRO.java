package com.seegene.web.admin.code.vo;

import lombok.Getter;
import lombok.Setter;

/**
 * 마스터 코드
 */
@Getter
@Setter
public class CodeMasterListRO extends CodeMasterVO{

	/** 식별자 */
	private int row;

	/** 최종 수정한 사용자 */
	private String editUserName;


}
