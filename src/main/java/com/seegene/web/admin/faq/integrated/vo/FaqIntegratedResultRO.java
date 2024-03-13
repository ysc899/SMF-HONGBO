package com.seegene.web.admin.faq.integrated.vo;

import java.util.Date;

import lombok.Data;

/**
 * 통합 FAQ 내용 리스트용 RO
 */
@Data
public class FaqIntegratedResultRO {

	private int row;
	
	/** 식별자 */
	private int seq;

	/** 카테고리 코드 */
	private String codeCategoryType;
	/** 카테고리 이름 */
	private String codeCategoryName;

	/** 질문 */
	private String question;
	/** 답변 */
	private String answer;

	/** 최종 수정일 */
	private Date editDate;

	/** 최종 수정한 사용자 */
	private String editUserId;
	
	/** 최종 수정한 사용자 */
	private String editUserName;

}

