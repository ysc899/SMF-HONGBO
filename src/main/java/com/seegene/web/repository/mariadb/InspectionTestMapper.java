package com.seegene.web.repository.mariadb;

import com.seegene.web.admin.inspection.test.vo.*;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

import java.util.List;

@Mapper
public interface InspectionTestMapper {
	/** 로그 조회용 */
	InspectionTestEditVO findInspTestEditBySeq(int seq);
	/** 검사항목 수정 내용 등록 */
	void addInspTestEdit(InspectionTestEditVO param);
	/** 검사항목 수정 내용 Temp 임시로 쳐 박음 */
	
	/** 검사항목 신규 등록 내용 등록 */
//	void addNewInspTestEdit(InspectionTestEditVO param);
	/** 수정 요청 이력 */
	List<InspectionTestEditLogRO> findInspectionEditLog(InspectionTestEditVO param);
	/** 기존 등록 된 것이 있는지 확인 */
	int countByF010gcd(InspectionTestEditVO param);
	
	/** 수정 요청 리스트 */
	List<InspectionListRO> findInspectionEditList(InspSearchPO param);
	/** 수정 요청 리스트 카운트*/
	int countInspectionEditList(InspSearchPO param);
	/** 수정 요청 내용 상세 조회 */
	InspectionTestEditViewRO findInspectionEditInfo(InspectionTestEditVO param);
	
	/** 수정 반영 정보 업데이트 */
	void applyInspectionEdit(InspectionTestEditVO param);
	
	/** 수정 반려 정보 업데이트 */
	void rejectInspectionEdit(InspectionTestEditVO param);
	
	/** 엑셀 다운로드용 */
	List<InspectionTestEditViewRO> findInspectionEditInfoExcelList(InspSearchPO param);
	
	
}
