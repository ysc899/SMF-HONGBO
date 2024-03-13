package com.seegene.web.repository.mariadb;

import java.util.List;

import com.seegene.web.admin.status.certification.vo.CertificationListRO;
import com.seegene.web.admin.status.certification.vo.CertificationVO;
import com.seegene.web.admin.status.certification.vo.CertificationViewRO;
import com.seegene.web.admin.status.history.vo.HistoryListRO;
import com.seegene.web.admin.status.history.vo.HistoryVO;
import com.seegene.web.admin.status.history.vo.HistoryViewRO;
import com.seegene.web.common.SearchPaggingCommonPO;
import com.seegene.web.user.foundation.history.vo.HistorySearchPO;
import com.seegene.web.user.foundation.history.vo.HistoryUserListRO;
import com.seegene.web.user.foundation.history.vo.HistoryUserYearInfoRO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * 연혁 맵퍼
 */
@Mapper()
public interface HistoryMapper {
	/** 연혁 로그용 조회 */
	HistoryVO findHistoryBySeq(int seq);
	
	/** 연혁 검색 리스트 */
	List<HistoryListRO> findHistoryList(SearchPaggingCommonPO param);
	/** 연혁 검색 리스트 카운트 */
	int countHistoryList(SearchPaggingCommonPO param);
	/** 연혁 상세 조회 */
	HistoryViewRO findHistoryViewBySeq(int seq);
	
	/** 언어별 갯수 */
	int getPrintOrder(HistoryVO param);
	/** 연혁 순서 변경 로그용 */
	List<HistoryVO> checkHistoryOrder(HistoryVO param);
	/** 연혁 순서 변경 로그 증가 업데이트 */
	void updateHistoryOrderInc(HistoryVO param);
	/** 연혁 순서 변경 로그 감소 업데이트 */
	void updateHistoryOrderDec(HistoryVO param);
	/** 연혁 등록 */
	void addHistory(HistoryVO param);
	/** 연혁 수정 */
	void editHistory(HistoryVO param);
	/** 연혁 삭제 */
	void deleteHistory(HistoryVO deletePO);
	
	//사용자용
	/** 탭별 연혁 조회 */
	List<HistoryUserListRO> findUserHitstoryByYears(HistorySearchPO param);
	
	/** 년도들 정보 */
	List<HistoryUserYearInfoRO> findUserYearInfoByYears(HistorySearchPO param);
}
