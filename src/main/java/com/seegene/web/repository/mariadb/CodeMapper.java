package com.seegene.web.repository.mariadb;

import java.util.List;

import com.seegene.web.admin.code.vo.CodeMasterListRO;
import com.seegene.web.admin.code.vo.CodeMasterVO;
import com.seegene.web.admin.code.vo.CodeMasterViewRO;
import com.seegene.web.admin.code.vo.CodeSlaveInfoRO;
import com.seegene.web.admin.code.vo.CodeSlaveInfoVO;
import com.seegene.web.admin.code.vo.CodeSlaveRO;
import com.seegene.web.admin.code.vo.CodeSlaveVO;
import com.seegene.web.common.SearchPaggingCommonPO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * 시스템 코드 맵퍼
 */
@Mapper()
public interface CodeMapper {
	
	/**
	 * @param masterCode 마스터 코드
	 * @return 하위 코드 리스트
	 */
	List<CodeSlaveRO> findSlaveCodeByMasterCode(String masterCode);
	/**  코드 마스터 로그용 조회 */
	CodeMasterVO findMasterBySeq(int seq);
	/** 코드 보조 로그용 조회 */
	List<CodeSlaveVO> findSlaveByMasterCode(String masterCode);
	/** 코드 보조 언어별 정보 로그용 조회 */
	List<CodeSlaveInfoVO> findSlaveInfoByMasterCode(String masterCode);
	
	/** 코드 마스터 리스트 검색 용 */
	List<CodeMasterListRO> findMasterCodeList(SearchPaggingCommonPO param);
	/** 코드 마스터 리스트  카운트 */
	int countMasterCodeList(SearchPaggingCommonPO param);
	
	/** 코드 마스터 상세 조회용 */
	CodeMasterViewRO findMasterCodeBySeq(int seq);
	/** 서브 코드 리스트 조회 */
	List<CodeSlaveVO> findSlaveCodeViewByMasterCode(String masterCode);
	/** 서브 코드 언어별 내용 조회용 */
	List<CodeSlaveInfoRO> findSlaveCodeInfoByCode(CodeSlaveVO param);
	/** 마스터 코드 수정 */
	void editMasterCode(CodeMasterVO param);
	/** 하위 코드 정보 수정 */
	void editSlaveCode(CodeSlaveVO param);
	/** 하위코드 다국어 정보 수정 */
	void editSlaveInfo(CodeSlaveInfoVO param);
	/** 하위코드 다중 등록 */
	void addSlaveCodes(List<CodeSlaveVO> param);
	/** 하위코드 다국어 다중 등록 */
	void addSlaveCodeInfos(List<CodeSlaveInfoVO> param);
	
	// 사용자용 코드
	/** 메모리 로드용 모든 코드 마스터 */
	List<String> findAllMasterCode();
	/** 메모리 로드용 모든 코드 서브 */
	List<CodeSlaveVO> findAllSlave();
	/** 메모리 로드용 모든 코드 서브 데이터 */
	List<CodeSlaveInfoVO> findAllSlaveInfo();
	
	
}
