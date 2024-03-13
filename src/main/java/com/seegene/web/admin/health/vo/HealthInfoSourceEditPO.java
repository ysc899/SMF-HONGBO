package com.seegene.web.admin.health.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 건강정보 출처 수정 내용
 */
@Getter
@Setter
@ToString
public class HealthInfoSourceEditPO extends HealthInfoSourceVO{

	/** 수정 여부 */
	private String editFlag;

}
