package com.seegene.web.repository.mariadb;

import java.util.List;

import com.seegene.web.admin.status.staffs.vo.StaffsHistoryVO;
import com.seegene.web.admin.status.staffs.vo.StaffsHistoryViewRO;
import com.seegene.web.admin.status.staffs.vo.StaffsInfoVO;
import com.seegene.web.admin.status.staffs.vo.StaffsInfoViewRO;
import com.seegene.web.admin.status.staffs.vo.StaffsListRO;
import com.seegene.web.admin.status.staffs.vo.StaffsVO;
import com.seegene.web.admin.status.staffs.vo.StaffsViewRO;
import com.seegene.web.common.SearchPaggingCommonPO;
import com.seegene.web.user.inspection.staffs.vo.StaffsUserHistoryListRO;
import com.seegene.web.user.inspection.staffs.vo.StaffsUserListRO;
import com.seegene.web.user.inspection.staffs.vo.StaffsUserViewRO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * 의료진 현황 맵퍼
 */
@Mapper()
public interface StaffsMapper {
	/** 의료진 현황 로그용 조회 */
	StaffsVO findStaffsBySeq(int seq);
	/** 의료진현황 상세 정보 로그용 조회 */
	List<StaffsInfoVO> findStaffsInfoByStaffsSeq(int staffsSeq);
	/** 의료진현황 이력 정보 로그용 조회 */
	List<StaffsHistoryVO> findStaffsHistoryByStaffsSeq(int staffsSeq);
	/** 의료진 현황 검색 리스트 */
	List<StaffsListRO> findStaffsList(SearchPaggingCommonPO param);
	/** 의료진 현황 검색 리스트 카운트 */
	int countStaffsList(SearchPaggingCommonPO param);
	/** 의료진 현황 상세 조회 */
	StaffsViewRO findStaffsViewBySeq(int seq);
	/** 의료진 현황 언어별 상세 정보 조회용 */
	List<StaffsInfoViewRO> findStaffsInfoViewByStaffsSeq(int staffsSeq);
	/** 의료진 현황 약력 상세 조회용 */
	List<StaffsHistoryViewRO> findStaffsHistoryViewByStaffsSeq(int staffsSeq);
	
	/** 언어별 갯수 */
	int getPrintOrder(StaffsVO param);
	/** 의료진 현황 순서 변경 로그용 */
	List<StaffsVO> checkStaffsOrder(StaffsVO param);
	/** 의료진 현황 순서 변경 로그 증가 업데이트 */
	void updateStaffsOrderInc(StaffsVO param);
	/** 의료진 현황 순서 변경 로그 감소 업데이트 */
	void updateStaffsOrderDec(StaffsVO param);
	/** 의료진 현황 등록 */
	void addStaffs(StaffsVO param);
	/** 의료진 현황 언어별 정보 등록 */
	void addStaffsInfos(List<StaffsInfoVO> param);
	/** 의료진 현황 약력 정보 등록 */
	void addStaffsHistory(List<StaffsHistoryVO> param);
	/** 의료진 현황 수정 */
	void editStaffs(StaffsVO param);
	/** 의료진 현황 언어별 정보 수정 */
	void editStaffsInfos(StaffsInfoVO param);
	/** 의료진 현황 이력 정보 수정 */
	void editStaffsHistory(StaffsHistoryVO param);
	/** 의료진 현황 삭제 */
	void deleteStaffs(StaffsVO param);
	/** 의료진 현황  이력 삭제 */
	void deleteStaffsHistory(StaffsHistoryVO param);
	
	
	//사용자용
	/** 사용자용 의료진 현황 리스트 */
	List<StaffsUserListRO> findUserStaffsList(String codeLangType);
	/** 사용자 의료진 현황 상세 조회 */
	StaffsUserViewRO findUserStaffsViewBySeq(StaffsInfoVO param);
	/** 사용자용 의료진 현황  약력 상세 조회용 */
	List<StaffsUserHistoryListRO> findUserStaffsHistoryViewByStaffsSeq(StaffsInfoVO param);
	
	
}
