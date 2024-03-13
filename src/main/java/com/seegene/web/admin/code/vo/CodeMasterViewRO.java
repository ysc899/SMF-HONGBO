package com.seegene.web.admin.code.vo;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

/**
 * 마스터 코드 뷰용
 */
@Getter
@Setter
public class CodeMasterViewRO extends CodeMasterVO{

	/** 최종 수정한 사용자 */
	private String editUserName;

	/** 자식 코드 리스트 */
	private List<CodeSlaveVO> slaveList;

}
