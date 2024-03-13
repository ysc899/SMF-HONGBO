package com.seegene.web.repository.mariadb;

import java.util.List;

import com.seegene.web.admin.health.vo.HealinfoTestEditPO;
import com.seegene.web.admin.health.vo.HealinfoTestPO;
import com.seegene.web.admin.health.vo.HealthInfoListRO;
import com.seegene.web.admin.health.vo.HealthInfoSourceEditPO;
import com.seegene.web.admin.health.vo.HealthInfoSourceVO;
import com.seegene.web.admin.health.vo.HealthInfoTestCodeVO;
import com.seegene.web.admin.health.vo.HealthInfoTestEditRO;
import com.seegene.web.admin.health.vo.HealthInfoTestHardInfoVO;
import com.seegene.web.admin.health.vo.HealthInfoTestListRO;
import com.seegene.web.admin.health.vo.HealthInfoVO;
import com.seegene.web.admin.health.vo.HealthInfoViewRO;
import com.seegene.web.admin.health.vo.HealthinfoCommonDeletePO;
import com.seegene.web.common.SearchPaggingCommonPO;
import com.seegene.web.common.UserSearchPaggingCommonPO;
import com.seegene.web.user.customer.healthinfo.vo.HealthInfoTitleRO;
import com.seegene.web.user.customer.healthinfo.vo.HealthInfoUserListRO;
import com.seegene.web.user.customer.healthinfo.vo.HealthInfoUserNextPreRO;
import com.seegene.web.user.customer.healthinfo.vo.HealthInfoUserSourcePO;
import com.seegene.web.user.customer.healthinfo.vo.HealthInfoUserTestHardInfoPO;
import com.seegene.web.user.customer.healthinfo.vo.HealthInfoUserViewRO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper()
public interface HealthInfoMapper {
	/** 건강정보 단일 조회 */
	HealthInfoVO findHealthInfoBySeq(int seq);
	/** 건강정보 출처 로그용 */
	List<HealthInfoSourceVO> findHealthSourceByHealthSeq(int healthSeq);
	/** 건강 정보 수기 검사 정보 로그용 조회 */
	List<HealthInfoTestHardInfoVO> findHealthHardTestByHealthSeq(int healthSeq);
	/** 건강 정보 검색 검사 정보 로그용 조회 */
	List<HealthInfoTestCodeVO> findHealthSearchTestByHealthSeq(int healthSeq);

	/** 관리자 원클릭 건강정보 조회 리스트 */
	List<HealthInfoListRO> findHelthInfoList(SearchPaggingCommonPO param);
	/** 관리자 원클릭 건강정보 조회 리스트 카운트 */
	int countHelthInfoList(SearchPaggingCommonPO param);
	
	/** 관리자 원클릭 건강정보 상세 조회 */
	HealthInfoViewRO findHealthInfoViewBySeq(int seq);
	/** 관리자 원클릭 건강정보 수정용 상세 조회 */
	HealthInfoTestEditRO findHealthInfoEditBySeq(int seq);
	/** 관리자 원클릭 건강 정보 출처 조회 */
	List<HealthInfoSourceVO> findHealthSourceViewByHealthSeq(int healthSeq);
	/** 관리자 원클릭 건강정보 검사 코드 조회 리스트 */
	List<HealthInfoTestListRO> findHealthTestViewByHealthSeq(int healthSeq);
	/** 관리자 원클릭 건강정보 검사 코드 수정 리스트 */
	List<HealinfoTestPO> findHealthTestEditByHealthSeq(int healthSeq);
	/** 건강정보 검사코드 수기입력 정보 조회  */
	HealthInfoTestHardInfoVO findHealthTestHardInfoBySeq(int hardInfoSeq);
	/** 건강정보 검사코드 검색입력 정보 조회  */
	HealthInfoTestHardInfoVO findHealthTestInfoBySeq(int testInfoSeq);
	
	
	/** 건강정보 로그 용 */
	List<HealthInfoVO> checkHealthInfoOrder(HealthInfoVO param);
	/** 건강정보 출력 순서 증가 업데이트 용 */
	void updateHealthInfoOrderInc(HealthInfoVO param);
	/** 건강정보 출력 순서 감소 업데이트 용 */
	void updateHealthInfoOrderDec(HealthInfoVO param);
	/** 언어코드에 따른 갯수 리턴 */
	int findMaxPrintOrderByLangCode(String langCode);
	/** 건강정보 등록 */
	void addHealthInfo(HealthInfoVO param);
	/** 건강정ㅈ보 출처 등록 */
	void addHealthSource(List<HealthInfoSourceVO> sourceList);
	/** 건강정보 검사코드 수기 등록 */
	void addHealthTestHardInfo(List<HealinfoTestPO> testList);
	/** 건강정보 검사코드 수기 등록 한개 */
	void addHealthTestHardInfoOne(HealinfoTestPO testItem);
	/** 건강정보 검사코드 검색 등록 */
	void addHealthTestSearchInfo(List<HealthInfoTestCodeVO> testList);
	void addHealthTestSearchInfoOne(HealthInfoTestCodeVO testItem);
	/** 건강정보 수정 */
	void editHealthInfo(HealthInfoVO param);
	/** 건강정보 출처 수정 */
	void editHealthSource(HealthInfoSourceEditPO param);
	/** 건강정보 수기 검사 코드 수정 */
	void editHealthHardTest(HealinfoTestEditPO param);
	/** 건강정보 검색 검사 코드 수정 */
	void editHealthSearchTest(HealinfoTestEditPO param);
	/** 건강정보 출처 삭제*/
	void deleteHealthSource(HealthinfoCommonDeletePO param);
	/** 건강정보 수기 검사정보 삭제*/
	void deleteHealthHardTest(HealthinfoCommonDeletePO param);
	/** 건강정보 검색 검사정보 삭제*/
	void deleteHealthSearchTest(HealthinfoCommonDeletePO param);
	/** 건강정보 삭제 */
	void deleteHealthInfo(HealthInfoVO param);
	
	//사용자용
	/** 건강정보 상위 전체 리스트용 */
	List<HealthInfoTitleRO> findAllInfoTitle(HealthInfoVO param);
	/** 원클릭 건강정보 사용자 리스트 */
	List<HealthInfoUserListRO> findUserHelthInfoList(UserSearchPaggingCommonPO param);
	/** 원클릭 건강정보 사용자 리스트 카운트 */
	int countUserHelthInfoList(UserSearchPaggingCommonPO param);
	
	/** 건강정보 기본 정보 사용자용 상세 조회용 */
	HealthInfoUserViewRO findUserHealthInfoViewBySeq(HealthInfoVO param);
	
	/** 건강정보 기본 정보 사용자용 섬네일 조회용 */
	String findUserHealthInfoThumBySeq(HealthInfoVO param);
	
	/** 건강정보 사용자용 검사코드 리스트 */
	List<HealthInfoUserTestHardInfoPO> findUserHealthTestViewByHealthSeq(int healthSeq);
	/** 건강정보 사용자 출처 정보 상세 조회용 */
	List<HealthInfoUserSourcePO> findUserHealthSourceViewByHealthSeq(int healthSeq);
	/** 건강정보 사용자 이전 다음 조회용 */
	List<HealthInfoUserNextPreRO> findUserHealthInfoNextPreBySeq(HealthInfoVO param);
	/** 조회수 증가 */
	void updateUserHealthInfoViewCount(int healthSeq);
	
}
