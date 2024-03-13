package com.seegene.web.admin.health.vo;

import java.util.List;

import lombok.Data;

/**
 * 건강정보 공통 삭제 처리용 po
 */
@Data
public class HealthinfoCommonDeletePO{

	/** 건강정보 seq */
	private int hardInfoSeq;
	
	/** 삭제될 seqs */
	private List<Integer> deleteSeqs;
	/** 수정자 ID */
	private String editUserId;
	
}
