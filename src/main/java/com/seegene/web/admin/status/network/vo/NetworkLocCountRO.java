package com.seegene.web.admin.status.network.vo;

import lombok.Data;

/**
 * 지역별 카운트 용
 */
@Data
public class NetworkLocCountRO {
	/** 지역코드 */
	private String slaveCode;
	/** 지역코드 명 */
	private String slaveCodeName;
	/** 카운트 */
	private int cnt;
}
