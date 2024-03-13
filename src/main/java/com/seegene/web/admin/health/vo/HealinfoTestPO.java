package com.seegene.web.admin.health.vo;

import lombok.Data;

/**
 * 건강정보 테스트 코드 등록용 po
 */
@Data
public class HealinfoTestPO extends HealthInfoTestHardInfoVO implements Comparable<HealinfoTestPO>{

	/** 수기 입력 여부 */
	private String hardFlag;

	/** 출력 순서 조정을 위한 패딩 */
	private int paddingSecond;

	@Override
	public int compareTo(HealinfoTestPO o) {
		return Long.compare(getRegDate().getTime(), o.getRegDate().getTime());
	}
}
