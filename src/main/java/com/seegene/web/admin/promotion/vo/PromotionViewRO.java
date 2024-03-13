package com.seegene.web.admin.promotion.vo;

import java.util.Date;

import lombok.Data;

/**
 * 홍로 리스트용 RO
 */
@Data
public class PromotionViewRO {
	
	private int seq;
	
	/** 언어 타입 코드 */
	private String codeLangType;
	private String codeLangName;
	
	/** 타이틀 */
	private String title;

	/** 보조 타이틀 */
	private String subTitle;
	
	/** 재생 url 유튜브 등 */
	private String url;

	/** 섬네일 저장 경로 */
	private String thumFilePath;
	
	private String thumFileContent;

	/** 파일 이름 */
	private String fileName;
	
	private int printOrder;

	/** 출력 여부 */
	private String printFlag;
	
	/** 최종 수정일 */
	private Date editDate;
	
	/** 최종 수정한 사용자 */
	private String editUserId;
	private String editUserName;
	
}

