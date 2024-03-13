package com.seegene.web.admin.status.certification.vo;

import lombok.Data;

/**
 * 인증현황 수정 기본 정보
 */
@Data
public class CertificationEditDefaultRO extends CertificationAddDefaultRO{
	/** 출력 순서 최대값 */
	private int maxOrder;
	
}
