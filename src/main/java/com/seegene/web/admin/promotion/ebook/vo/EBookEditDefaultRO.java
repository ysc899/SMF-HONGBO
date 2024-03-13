package com.seegene.web.admin.promotion.ebook.vo;

import com.seegene.web.admin.code.vo.CodeSlaveRO;
import lombok.Data;

import java.util.List;

/**
 * 전자책 등록 기본 정보
 */
@Data
public class EBookEditDefaultRO extends  EBookAddDefaultRO{

	/** 출력 순번 */
	private int maxPrintOrder;
	
}
