package com.seegene.web.admin.main.banner.sub.vo;


import java.util.Date;

import lombok.Data;

/**
 * 메인 하단 롤링 베너 관련 테이블
 */
@Data
public class MainSubBannerViewRO extends MainSubBannerVO {


	/** 메뉴 언어 타입 코드 */
	private String codeLangName;
	
	private String fileContent;
	
	private String editUserName;


}
