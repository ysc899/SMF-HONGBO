package com.seegene.web.admin.board.notice.vo;

import java.util.List;

import com.seegene.web.admin.code.vo.CodeSlaveRO;

import lombok.Data;

/**
 * 공문 등록 기본 정보
 */
@Data
public class BoardNoticeAddDefaultRO {
	/** 언어 구분 코드 */
	private List<CodeSlaveRO> langCodes;
	
	/** 센터 구분 코드 */
	private List<CodeSlaveRO> centerCodes;
	
}
