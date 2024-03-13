package com.seegene.web.admin.status.staffs.vo;

import lombok.Data;

/**
 * 의료진 수정 기본 정보
 */
@Data
public class StaffsEditPO extends StaffsAddPO{

	/** 의료진 현황 식별자 */
	private int seq;
	
	/** 삭제된 약력 정보 json */
	private String staffsDeleteHistoryJSON;
	
}
