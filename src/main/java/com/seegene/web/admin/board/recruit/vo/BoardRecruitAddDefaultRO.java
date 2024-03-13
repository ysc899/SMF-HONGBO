package com.seegene.web.admin.board.recruit.vo;

import java.util.List;

import com.seegene.web.admin.code.vo.CodeSlaveRO;

import lombok.Data;

/**
 * 채용 등록 기본 정보
 */
@Data
public class BoardRecruitAddDefaultRO {
	/** 언어 구분 코드 */
	private List<CodeSlaveRO> langCodes;
	
	/** 채용 종류 코드 */
	private List<CodeSlaveRO> recruitTPCodes;
	
	/** 채용 상태 코드 */
	private List<CodeSlaveRO> recruitSTCodes;
	
}
