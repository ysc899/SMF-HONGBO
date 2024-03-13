package com.seegene.web.admin.main.banner.main.vo;


import java.util.Date;

import lombok.Data;

/**
 * 메인 하단 롤링 베너 관련 테이블
 */
@Data
public class MainBannerListRO {

	private int row;
	
	/** 식별자 */
	private int seq;

	/** 메뉴 언어 타입 코드 */
	private String codeLangType;
	private String codeLangName;

	/** 타이틀 */
	private String title;

	/** 출력 순서 */
	private int printOrder;

	/** 출력 여부 */
	private String printFlag;
	
	private Date editDate;

}
