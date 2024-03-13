package com.seegene.web.user.inspection.staffs.vo;

import java.util.List;

import com.seegene.web.user.code.vo.CodeRO;

import lombok.Data;

/**
 * 의료진현황에 기본적으로 필요한 데이터
 */
@Data
public class StaffsDefaultRO {

	/** 의료진현황 센터 코드 */
	private List<CodeRO> centerCodes;
	/** 인증현황 학과 코드 */
	private List<CodeRO> partCodes;
}
