package com.seegene.web.user.faq.vo;

import lombok.Data;

@Data
public class FaqUserListRO {
	/** 질문 */
	private String question;
	/** 답변 */
	private String answer;
	/** 카테고리 종류 */
	private String codeCategoryType;
	
}
