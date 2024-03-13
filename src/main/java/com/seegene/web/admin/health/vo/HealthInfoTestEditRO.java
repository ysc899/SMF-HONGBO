package com.seegene.web.admin.health.vo;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 관리자 원클릭 건강정보 검사코드 리스트 RO
 */
@Getter
@Setter
@ToString
public class HealthInfoTestEditRO extends HealthInfoViewRO {
	

	/** 검사 항목 */
	private List<HealinfoTestPO> testEditList;


}
