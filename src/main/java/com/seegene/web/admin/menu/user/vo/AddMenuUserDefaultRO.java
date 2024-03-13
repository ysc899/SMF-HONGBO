package com.seegene.web.admin.menu.user.vo;

import java.util.List;

import com.seegene.web.admin.code.vo.CodeSlaveRO;

import lombok.Data;

/**
 * 사용자 메뉴 등록 수정 시 필요한 기본 정보
 */
@Data
public class AddMenuUserDefaultRO {

	/** 언어 구분 코드 */
	private List<CodeSlaveRO> langCodes;
	/** 메뉴 타입 코드 */
	private List<CodeSlaveRO> typeCodes;
	/** 로그인 여부 코드 */
	private List<CodeSlaveRO> loginCodes;
}
