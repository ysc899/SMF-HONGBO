package com.seegene.web.admin.status.network.vo;

import lombok.Data;

/**
 * 네트워크 수정용 파라미터
 */
@Data
public class NetworkEditPO extends NetworkAddPO{
	
	/** 사용자 마스터 식별자 */
	private int seq;
	
	/** 삭제된 지역 정보*/
	private String locDeleteJSON;
	
}
