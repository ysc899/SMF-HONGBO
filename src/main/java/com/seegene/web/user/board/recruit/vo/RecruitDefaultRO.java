package com.seegene.web.user.board.recruit.vo;

import java.util.List;

import com.seegene.web.user.code.vo.CodeRO;

import lombok.Data;

/**
 * 채용에 기본적으로 필요한 데이터
 */
@Data
public class RecruitDefaultRO {

	/** 채용 구분 코드 */
	private List<CodeRO> recruitTPCodes;
}
