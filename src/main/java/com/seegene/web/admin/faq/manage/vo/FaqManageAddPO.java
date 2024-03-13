package com.seegene.web.admin.faq.manage.vo;

import lombok.Data;

/**
 * 통합 FAQ 관리 등록용 PO
 */
@Data
public class FaqManageAddPO{

	/** 언어코드 */
	private String codeLang;
	/** FAQ 명 */
	private String name;
	/** FAQ 설명 */
	private String desc;


}

