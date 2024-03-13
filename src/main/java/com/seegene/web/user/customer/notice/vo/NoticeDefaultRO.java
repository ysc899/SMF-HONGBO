package com.seegene.web.user.customer.notice.vo;

import java.util.List;

import com.seegene.web.user.code.vo.CodeRO;

import lombok.Data;

/**
 * 공문에 기본적으로 필요한 데이터
 */
@Data
public class NoticeDefaultRO {

	/** 센터 구분 코드 */
	private List<CodeRO> centerCodes;
}
