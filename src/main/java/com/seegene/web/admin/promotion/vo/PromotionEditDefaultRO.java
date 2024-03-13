package com.seegene.web.admin.promotion.vo;

import java.util.List;

import com.seegene.web.admin.code.vo.CodeSlaveRO;

import lombok.Data;

/**
 * 홍보자료 수정 기본 정보
 */
@Data
public class PromotionEditDefaultRO {
	/** 언어 구분 코드 */
	private List<CodeSlaveRO> langCodes;
	
	/** 출력 순번 */
	private int maxPrintOrder;
}
