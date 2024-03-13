package com.seegene.web.admin.status.network.vo;

import lombok.Data;

/**
 * 전국 네트워크 사용자 상세 조회용
 */
@Data
public class NetworkStaffsInfoRO extends NetworkStaffsInfoVO{
	
	/** 언어 타입 코드 */
	private String codeLangName;
	
	/** 최종 수정한 사용자 */
	private String editUserName;
}

