package com.seegene.web.admin.main.popup.vo;

import java.util.List;

import com.seegene.web.admin.code.vo.CodeSlaveRO;

import lombok.Data;

/**
 * 팝업 등록 기본 정보
 */
@Data
public class MainPopupAddDefaultRO {
	/** 언어 구분 코드 */
	private List<CodeSlaveRO> langCodes;
	/** 로그인 여부 코드 */
	private List<CodeSlaveRO> loginCodes;
	
}
