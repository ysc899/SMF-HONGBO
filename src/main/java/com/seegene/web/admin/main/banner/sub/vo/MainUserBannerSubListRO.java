package com.seegene.web.admin.main.banner.sub.vo;


import lombok.Data;

/**
 * 메인 하단 롤링 베너 관련 테이블
 */
@Data
public class MainUserBannerSubListRO implements Comparable<MainUserBannerSubListRO>{

	/** 메뉴 언어 타입 코드 */
	private String codeLangType;

	/** 타이틀 */
	private String title;
	/** 타이틀 */
	private String content;
	/** 타이틀 */
	private String url;

	/** 출력 순서 */
	private int printOrder;

	private String filePath;
	
	private String fileContent;
	
	private String newYn;

	@Override
	public int compareTo(MainUserBannerSubListRO o) {
		return Integer.compare(this.printOrder, o.getPrintOrder());
	}
	


}
