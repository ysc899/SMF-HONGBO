package com.seegene.web.admin.main.rolling.vo;

import java.util.Date;

import lombok.Data;

/**
 * 메인 베너 롤링 관련 테이블
 */
@Data
public class MainRollingVO {

	/** 식별자 */
	private int seq;

	/** 메뉴 언어 타입 코드 */
	private String codeLangType;

	/** 내용 */
	private String content;

	/** 링크 url */
	private String url;

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
