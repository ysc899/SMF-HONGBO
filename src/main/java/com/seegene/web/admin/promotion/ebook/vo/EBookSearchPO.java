package com.seegene.web.admin.promotion.ebook.vo;

import com.seegene.web.common.SearchPaggingCommonPO;
import lombok.Data;

/**
 * 학술제작물 조회 검색용
 */
@Data
public class EBookSearchPO extends SearchPaggingCommonPO{
	
	private String codeCategoryType;

}
