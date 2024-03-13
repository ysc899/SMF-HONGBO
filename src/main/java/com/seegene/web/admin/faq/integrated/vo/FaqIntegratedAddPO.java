package com.seegene.web.admin.faq.integrated.vo;

import lombok.Data;

/**
 * 통합 FAQ 내용 등록용 PO
 */
@Data
public class FaqIntegratedAddPO {


	/** 카테고리 코드 */
	private String codeCategory;

	/** 질문 */
	private String question;
	/** 답변 */
	private String answer;


}

