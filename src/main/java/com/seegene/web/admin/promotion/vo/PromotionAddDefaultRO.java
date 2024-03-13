package com.seegene.web.admin.promotion.vo;

import java.util.List;

import com.seegene.web.admin.code.vo.CodeSlaveRO;

import lombok.Data;

/**
 * 홍보자료 등록 기본 정보
 */
@Data
public class PromotionAddDefaultRO {
	/** 언어 구분 코드 */
	private List<CodeSlaveRO> langCodes;
}
