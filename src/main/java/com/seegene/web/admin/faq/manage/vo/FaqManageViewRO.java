package com.seegene.web.admin.faq.manage.vo;

import lombok.Data;

/**
 * 통합 FAQ 관리 상세용 RO
 */
@Data
public class FaqManageViewRO extends BoardFaQMasterVO{

	/** 게시글 수 */
	private int contentCount;
	/** 언어코드명 */
	private String codeLangName;

	/** 최종 수정한 사용자 */
	private String editUserName;

}

