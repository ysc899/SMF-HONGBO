package com.seegene.web.admin.status.history.vo;

import lombok.Data;

/**
 * 연혁 수정 기본 정보
 */
@Data
public class HistoryEditPO extends HistoryAddPO{
	/** 식별자 */
	private int seq;
}
