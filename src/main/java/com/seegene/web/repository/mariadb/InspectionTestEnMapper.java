package com.seegene.web.repository.mariadb;

import java.util.List;

import com.seegene.web.admin.inspection.test.vo.InspectionTestEngListRO;
import com.seegene.web.admin.inspection.test.vo.InspectionTestEngVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface InspectionTestEnMapper {
	
	/** 로그 조회용 */
	InspectionTestEngVO findInspTestEngBySeq(int seq);
	
	/** 영문 검사 결과 한글에서 영문으로 변경할 데이터 조회 */
	List<InspectionTestEngListRO> findInspTestEnList();
	
	/** 영문 검사 결과 한글에서 영문으로 변경할 데이터 상세조회 */
	InspectionTestEngVO findInspTestEnView(String f010gcd);

	/** 검사항목 영문 내용 등록 */
	void addInspTestEng(InspectionTestEngVO param);
	/** 검사항목 영문 내용업데이트 */
	void editInspTestEng(InspectionTestEngVO param);
	
	
}
