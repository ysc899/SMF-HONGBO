package com.seegene.web.admin.promotion.vo;

import com.seegene.web.common.SearchPaggingCommonPO;

import lombok.Data;

/** 홍보 동영상, 영상 검색 조건 */
@Data
public class SearchPromotionPO extends SearchPaggingCommonPO{
	/** 종류 */
	private String type;

}
