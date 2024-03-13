package com.seegene.web.admin.main.banner.sub.vo;

import java.util.Date;

import lombok.Data;

/**
 * 메인 하단 롤링 베너 관련 테이블
 */
@Data
public class MainSubBannerVO {

	/** 식별자 */
	private int seq;

	/** 메뉴 언어 타입 코드 */
	private String codeLangType;

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

	/** 등록일 */
	private Date regDate;

	/** 최초 등록한 사용자 */
	private String regUserId;

	/** 최종 수정일 */
	private Date editDate;

	/** 최종 수정한 사용자 */
	private String editUserId;

	/** 삭제 여부 */
	private String deleteFlag;

}
