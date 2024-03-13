package com.seegene.web.admin.status.network.vo;

import java.util.List;

import com.seegene.web.admin.code.vo.CodeSlaveRO;

import lombok.Data;

/**
 * 네트워크 등록 기본 정보
 */
@Data
public class NetworkAddDefaultRO {
	/** 언어 구분 코드 */
	private List<CodeSlaveRO> langCodes;
	/** 지역별 출력 갯수 */
	private List<NetworkLocCountRO> locCount;
}
