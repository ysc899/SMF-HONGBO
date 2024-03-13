package com.seegene.web.admin.health.vo;

import lombok.Data;

/**
 * 건강정보 테스트 코드 수정용 po
 */
@Data
public class HealinfoTestEditPO extends HealinfoTestPO {

	/** 수정 여부 */
	private String editFlag;
	
}
