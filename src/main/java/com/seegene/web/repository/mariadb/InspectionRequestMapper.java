package com.seegene.web.repository.mariadb;

import java.util.List;

import com.seegene.web.admin.inspection.request.vo.InspectionRequestListRO;
import com.seegene.web.admin.inspection.request.vo.InspectionRequestVO;
import com.seegene.web.admin.inspection.request.vo.InspectionRequestViewRO;
import com.seegene.web.common.SearchPaggingCommonPO;
import com.seegene.web.common.UserSearchPaggingCommonPO;
import com.seegene.web.user.task.request.vo.RequestDataRO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * 검사의뢰서 맵퍼
 */
@Mapper()
public interface InspectionRequestMapper {
	/** 검사의뢰서 로그용 조회 */
	InspectionRequestVO findRequestBySeq(int seq);
	
	/** 검사의뢰서 검색 리스트 */
	List<InspectionRequestListRO> findRequestList(SearchPaggingCommonPO param);
	/** 검사의뢰서 검색 리스트 카운트 */
	int countRequestList(SearchPaggingCommonPO param);
	/** 검사의뢰서 상세 조회 */
	InspectionRequestViewRO findRequestViewBySeq(int seq);
	/** 검사의뢰서 파일라운로드용 조회용 */
	InspectionRequestVO findRequestFileInfoBySeq(int seq);
	
	/** 언어별 갯수 */
	int getPrintOrder(InspectionRequestVO param);
	/** 검사의뢰서 순서 변경 로그용 */
	List<InspectionRequestVO> checkRequestOrder(InspectionRequestVO param);
	/** 검사의뢰서 순서 변경 로그 증가 업데이트 */
	void updateRequestOrderInc(InspectionRequestVO param);
	/** 검사의뢰서 순서 변경 로그 감소 업데이트 */
	void updateRequestOrderDec(InspectionRequestVO param);
	/** 검사의뢰서 등록 */
	void addRequest(InspectionRequestVO param);
	/** 검사의뢰서 수정 */
	void editRequest(InspectionRequestVO param);
	/** 검사의뢰서 삭제 */
	void deleteRequest(InspectionRequestVO deletePO);
	
	//사용자용
	/** 검사항목 사용자 리스트 */
	List<RequestDataRO> findUserRequestList(UserSearchPaggingCommonPO param);
	/** 검사의뢰서 메인 검색 리스트 */
	List<RequestDataRO> findUserMainSearchRequestList(UserSearchPaggingCommonPO param);
	/**  검사의뢰서 메인 검색 리스트 카운트 */
	int countUserMainSearchRequestList(UserSearchPaggingCommonPO param);
	/** 섬네일 파일 조회용 */
	InspectionRequestVO findUserThumFileInfoBySeq(int seq);
}
