package com.seegene.web.user.inspection.staffs.vo;

import java.util.List;

import lombok.Data;

/**
 * 의료진현황에 팝업용 필요한 데이터
 */
@Data
public class StaffsUserViewRO {

	/** 식별자 */
	private int seq;

	
	private String imagePath;
	private String imageContent;
	
	/** 부서 타입 코드 */
	private String codePartType;
	
	/** 직위 */
	private String position;

	/** 이름 */
	private String name;

	/** 학위 */
	private String degree;

	/** 전문분야 */
	private String specialty;
	
	/** 현재이력 */
	List<StaffsUserHistoryListRO> nowHistory;
	/** 과거이력 */
	List<StaffsUserHistoryListRO> beforeHistory;
	
}
