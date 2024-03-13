package com.seegene.web.admin.status.history.vo;

import java.util.List;

import com.seegene.web.admin.code.vo.CodeSlaveRO;

import lombok.Data;

/**
 * 연혁 등록 기본 정보
 */
@Data
public class HistoryAddDefaultRO {
	/** 언어 구분 코드 */
	private List<CodeSlaveRO> langCodes;
}
