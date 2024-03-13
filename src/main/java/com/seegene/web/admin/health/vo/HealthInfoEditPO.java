package com.seegene.web.admin.health.vo;

import lombok.Data;

/**
 * 건강정보 수정 정보
 */
@Data
public class HealthInfoEditPO extends HealthInfoAddPO{
	/** 식별자 */
	private int seq;
	
	/** 삭제되는 출처 seqs JSON */
	private String sourceDeleteJSON;
	/** 삭제되는 검사항목 seqs JSON */
	private String testDeleteJSON;
	/** 삭제되는 검색 검사항목 seqs JSON */
	private String testSearchDeleteJSON;
	
}
