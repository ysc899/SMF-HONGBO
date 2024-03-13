package com.seegene.web.user.customer.webzine.vo;

import java.util.List;

import com.seegene.web.user.code.vo.CodeRO;

import lombok.Data;

/**
 * 웹진에 기본적으로 필요한 데이터
 */
@Data
public class WebzineDefaultRO {

	/** 인증현황 분류 코드 */
	private List<CodeRO> ebookCatCodes;
}
