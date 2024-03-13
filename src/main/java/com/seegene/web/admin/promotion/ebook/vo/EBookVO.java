package com.seegene.web.admin.promotion.ebook.vo;

import java.util.Date;

import lombok.Data;

/**
 * 학술제작물
 */
@Data
public class EBookVO {

	/** 식별자 */
	private int seq;

	/** 언어 타입 코드 */
	private String codeLangType;

	/** 카테고리 타입 코드 */
	private String codeCategoryType;

	/** 타이틀 */
	private String title;

	/** URL */
	private String url;

	/** 섬네일 경로 */
	private String thumFilePath;
	private int printOrder;

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
