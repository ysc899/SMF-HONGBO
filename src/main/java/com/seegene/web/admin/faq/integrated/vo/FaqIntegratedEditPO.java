package com.seegene.web.admin.faq.integrated.vo;

import lombok.Data;

/**
 * faq 내용 수정용 PO
 */
@Data
public class FaqIntegratedEditPO extends FaqIntegratedAddPO{
	/** 식별자 */
	private int seq;
}

