package com.seegene.web.admin.faq.manage.vo;

import java.util.List;

import com.seegene.web.admin.code.vo.CodeSlaveRO;

import lombok.Data;

/**
 * 통합 FAQ 관리 등록 기본 정보
 */
@Data
public class FaqManageAddDefaultRO {
	/** 언어 구분 코드 */
	private List<CodeSlaveRO> langCodes;
}

