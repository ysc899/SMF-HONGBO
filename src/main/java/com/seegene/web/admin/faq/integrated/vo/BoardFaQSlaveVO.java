package com.seegene.web.admin.faq.integrated.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BoardFaQSlaveVO {
	/** 식별자 */
	private int seq;

	/** 카테고리 코드 */
	private String codeCategoryType;

	/** 자주하는 질문 마스터 */
	private int boardFaqMasterSeq;

	/** 질문 */
	private String question;

	/** 답변 */
	private String answer;

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

