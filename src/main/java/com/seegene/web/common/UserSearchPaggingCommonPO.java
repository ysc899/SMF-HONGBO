package com.seegene.web.common;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 사용자 페이징 기본 VO
 */
@Getter
@Setter
@ToString
public class UserSearchPaggingCommonPO extends SearchPaggingCommonPO{

	/** 언어코드 */
	private String codeLangType;
}
