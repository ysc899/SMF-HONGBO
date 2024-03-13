package com.seegene.web.admin.faq.integrated.vo;

import java.util.List;

import com.seegene.web.admin.code.vo.CodeSlaveRO;

import lombok.Data;

/**
 * 통합 FAQ 내용 등록 기본 정보
 */
@Data
public class FaqIntegratedAddDefaultRO {
	/** 카테고리 구분 코드 */
	private List<CodeSlaveRO> categoryCodes;
}

