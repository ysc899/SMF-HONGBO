package com.seegene.web.admin.status.history.vo;

import lombok.Data;

/**
 * 연혁 수정 기본 정보
 */
@Data
public class HistoryEditDefaultRO extends HistoryAddDefaultRO{
	/** 출력 순서 최대값 */
	private int maxOrder;
}
