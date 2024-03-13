package com.seegene.web.admin.main.rolling.vo;

import lombok.Data;

/**
 * 롤링 리스트용 RO
 */
@Data
public class MainRollingViewRO extends MainRollingVO{
	
	/** 메뉴 언어 타입 코드 명*/
	private String codeLangName;
	
	/** 최종 수정자 명*/
	private String editUserName;

}
