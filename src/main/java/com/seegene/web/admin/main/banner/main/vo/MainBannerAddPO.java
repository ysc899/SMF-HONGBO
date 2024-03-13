package com.seegene.web.admin.main.banner.main.vo;

import lombok.Data;

/**
 * 메인 하단 롤링 베너 관련 테이블
 */
@Data
public class MainBannerAddPO {


	/** 메뉴 언어 타입 코드 */
	private String codeLang;

	/** 타이틀 */
	private String title;
	/** 내용 */
	private String content;

	/** 링크 url */
	private String url;
	/** 파일 저장 경로 */
	private String filePath;
	/** 출력 순서 */
	private int printOrder;

	/** 출력 여부 */
	private String printFlag;


}
