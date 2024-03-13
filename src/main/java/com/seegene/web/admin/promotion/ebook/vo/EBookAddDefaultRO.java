package com.seegene.web.admin.promotion.ebook.vo;

import java.util.List;

import com.seegene.web.admin.code.vo.CodeSlaveRO;

import lombok.Data;

/**
 * 전자책 등록 기본 정보
 */
@Data
public class EBookAddDefaultRO {
	/** 언어 구분 코드 */
	private List<CodeSlaveRO> langCodes;
	/** 카테고리 코드 */
	private List<CodeSlaveRO> categoryCodes;

	
}
