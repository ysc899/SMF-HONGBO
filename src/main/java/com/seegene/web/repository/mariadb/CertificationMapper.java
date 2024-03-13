package com.seegene.web.repository.mariadb;

import java.util.List;

import com.seegene.web.admin.status.certification.vo.CertificationListRO;
import com.seegene.web.admin.status.certification.vo.CertificationVO;
import com.seegene.web.admin.status.certification.vo.CertificationViewRO;
import com.seegene.web.common.SearchPaggingCommonPO;
import com.seegene.web.user.inspection.cert.vo.CertListRO;
import com.seegene.web.user.inspection.cert.vo.CertSearchPO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * 인증현황 맵퍼
 */
@Mapper()
public interface CertificationMapper {
	/** 인증현황 로그용 조회 */
	CertificationVO findCertificationBySeq(int seq);
	/** 인증현황 검색 리스트 */
	List<CertificationListRO> findCertificationList(SearchPaggingCommonPO param);
	/** 인증현황 검색 리스트 카운트 */
	int countCertificationList(SearchPaggingCommonPO param);
	/** 인증현황 상세 조회 */
	CertificationViewRO findCertificationViewBySeq(int seq);
	
	/** 언어별 갯수 */
	int getPrintOrder(CertificationVO param);
//	
	/** 인증현황 순서 변경 로그용 */
	List<CertificationVO> checkCertificationOrder(CertificationVO param);
	/** 인증현황 순서 변경 로그 증가 업데이트 */
	void updateCertificationOrderInc(CertificationVO param);
	/** 인증현황 순서 변경 로그 감소 업데이트 */
	void updateCertificationOrderDec(CertificationVO param);
	/** 인증현황 등록 */
	void addCertification(CertificationVO param);
	/** 인증현황 수정 */
	void editCertification(CertificationVO param);
	/** 인증현황 삭제 */
	void deleteCertification(CertificationVO deletePO);
	
	
	//사용자 
	/** 사용자 인증현황  리스트 */
	List<CertListRO> findUserCertificationList(CertSearchPO param);
	/** 사용자 인증현황 리스트 카운트 */
	int countUserCertificationList(CertSearchPO param);
	/** 인증현황 파일 다운로드용 */
	CertificationVO findUserCertificationFileBySeq(int seq);
}
