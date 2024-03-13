package com.seegene.web.admin.promotion.vo;

import java.util.Date;

import lombok.Data;

/**
 * 홍보 동영상 포토영상 vo
 */
@Data
public class PromotionVO {

	/** 식별자 */
	private int seq;

	/** 언어 타입 코드 */
	private String codeLangType;

	/** 홍보 타입 코드 */
	private String codePromotionType;

	/** 타이틀 */
	private String title;

	/** 보조 타이틀 */
	private String subTitle;

	/** 재생 url 유튜브 등 */
	private String url;

	/** 파일 저장 경로 */
	private String filePath;

	/** 섬네일 저장 경로 */
	private String thumFilePath;

	/** 파일 이름 */
	private String fileName;

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

