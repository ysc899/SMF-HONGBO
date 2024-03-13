package com.seegene.web.admin.inspection.vessel.vo;

import java.util.List;

import com.seegene.web.admin.code.vo.CodeSlaveRO;

import lombok.Data;

@Data
public class InspectionVesselAddDefaultRO {
	
	/** 언어 구분 코드 */
	private List<CodeSlaveRO> langCodes;
	
	/** 보관 방법 코드 */
	private List<CodeSlaveRO> vesselSCCodes;
	
}

