package com.seegene.web.admin.main.rolling.vo;

import lombok.Data;

/**
 * 롤링 등록 파라미터 정보
 */
@Data
public class MainRollingAddPO {
	
	/** 언어코드 */
	private String codeLang;
	/** 내용 */
	private String content;
	/** 링크 url */
	private String url;
	/** 출력 여부 */
	private String printFlag;
	/** 출력 순서 */
	private int printOrder;
	
	
	
}
