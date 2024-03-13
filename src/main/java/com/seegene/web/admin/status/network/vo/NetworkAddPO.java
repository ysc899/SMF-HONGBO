package com.seegene.web.admin.status.network.vo;

import lombok.Data;

/**
 * 네트워크 등록 파라미터
 */
@Data
public class NetworkAddPO {
	
	/** 이메일 */
	private String email;
	
	/** 본부장 여부 */
	private String directorFlag;
	
	/** 언어별 사용자 정보 */
	private String userInfoJSON;
	
	/** 사용자 지역 등록 정보 */
	private String locInfoJSON;
	
}
