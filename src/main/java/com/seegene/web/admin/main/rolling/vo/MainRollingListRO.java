package com.seegene.web.admin.main.rolling.vo;

import java.util.Date;

import lombok.Data;

/**
 * 롤링 리스트용 RO
 */
@Data
public class MainRollingListRO {
	
	private int row;
	
	/** 식별자 */
	private int seq;

	/** 메뉴 언어 타입 코드 */
	private String codeLangType;
	/** 메뉴 언어 타입 코드 명*/
	private String codeLangName;

	/** 내용 */
	private String content;

	/** 출력 순서 */
	private int printOrder;

	/** 출력 여부 */
	private String printFlag;


	/** 최종 수정일 */
	private Date editDate;

	/** 최종 수정한 사용자 */
	private String editUserId;
	/** 최종 수정한 사용자 */
	private String editUserName;

}
