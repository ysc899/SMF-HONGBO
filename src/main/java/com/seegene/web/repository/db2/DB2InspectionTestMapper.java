package com.seegene.web.repository.db2;

import com.seegene.web.admin.inspection.test.vo.*;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

import java.util.List;

/**
 * DB2 검사 조회 관련 맵퍼
 */
@Mapper
public interface DB2InspectionTestMapper {

	/** db2 검사 코드 조회 */
	List<DB2CodeRO> findInspectionTestCodes(List<String> parentCodes);

	/** db2 검사 코드 조회 영문용 */
	List<DB2CodeRO> findInspectionTestCodesEn(List<String> parentCodes);

	/** 한글 검사 항목 조회 */
	List<MWT001R1ListRO> inspectionTestList(MWT001R1SearchPO param);

	/** 영문En 검사 항목 조회 */
	List<MWT001R1ListRO> inspectionTestListEn(MWT001R1SearchPO param);

	/** 한글 검사 항목 상세 조회 */
	MWT001R2ViewRO inspectionTestView(MWT001R2SearchPO param);

	/** 영문En 검사 항목 상세 조회 */
	MWT001R2ViewRO inspectionTestViewEn(MWT001R2SearchPO param);
	
	/** 검사 항목 추가 가능 리스트 조회  */
	List<MWT001R3ListRO> inspectionAddTestList(MWT001R3SearchPO param);
	
	void inspectionTestUpdate(InspectionTestUpdatePO param);
}
