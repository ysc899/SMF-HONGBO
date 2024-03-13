package com.seegene.web.repository.mariadb;

import java.util.List;

import com.seegene.web.admin.log.error.vo.LogErrorListRO;
import com.seegene.web.admin.log.error.vo.LogErrorRemovePO;
import com.seegene.web.admin.log.error.vo.LogErrorSearchPO;
import com.seegene.web.admin.log.error.vo.LogErrorVO;
import com.seegene.web.admin.log.error.vo.LogErrorViewRO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * 편집 로그 맵퍼
 */
@Mapper()
public interface ErrorLogMapper {
	
	/**
	 * @param param 신규 추가 로그 내용
	 */
	void insertErrorLog(LogErrorVO param);
	
	
	/**
	 * @param param 검색조건
	 * @return 에러 로그 리스트
	 */
	List<LogErrorListRO> findErrorLogList(LogErrorSearchPO param);
	
	/**
	 * @param param 검색조건
	 * @return 총갯수
	 */
	int countErrorLogList(LogErrorSearchPO param);
	
	List<LogErrorViewRO> findDownloadErrorLogList(LogErrorSearchPO param);
	
	/**
	 * @param seq 식별자
	 * @return 수정로그 정보
	 */
	LogErrorViewRO findErrorLogView(long seq);
	
	void deleteLogError(long seq);
	
	int deleteCount(LogErrorRemovePO param);
	
	void deleteLogErrors(LogErrorRemovePO param);
}
