package com.seegene.web.repository.mariadb;

import java.util.List;

import com.seegene.web.admin.log.access.vo.LogAccessDownloadListRO;
import com.seegene.web.admin.log.access.vo.LogAccessListRO;
import com.seegene.web.admin.log.access.vo.LogAccessRemovePO;
import com.seegene.web.admin.log.access.vo.LogAccessSearchPO;
import com.seegene.web.admin.log.access.vo.LogAccessVO;
import com.seegene.web.admin.log.access.vo.LogMenuStatisRO;
import com.seegene.web.admin.log.access.vo.LogStatisPO;
import com.seegene.web.admin.log.access.vo.LogUserStatisRO;
import com.seegene.web.admin.log.access.vo.LogUserYearStatisExcelRO;
import com.seegene.web.admin.log.access.vo.LogUserYearStatisRO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * 접속 로그 맵퍼
 */
@Mapper()
public interface AccessLogMapper {
	
	/**
	 * @param param 접속로그 추가
	 */
	void insertAccessLog(LogAccessVO param);
	
	/** 집게 테이블에 데이터 입력 */
	void insertTotalAccessLog();
	
	/**
	 * @param param 검색조건
	 * @return 수정 로그 리스트
	 */
	List<LogAccessListRO> findAccessLogList(LogAccessSearchPO param);
	
	/**
	 * @param param 검색조건
	 * @return 총갯수
	 */
	int countAccessLogList(LogAccessSearchPO param);
	
	List<LogAccessDownloadListRO> findDownloadAccessLogList(LogAccessSearchPO param);
	
	int deleteCount(LogAccessRemovePO param);
	
	void deleteLogAccesss(LogAccessRemovePO param);
	
	List<LogUserStatisRO> userStaticData(LogStatisPO param);
	
	List<LogUserYearStatisRO> userYearStaticData(LogStatisPO param);
	
	List<LogUserYearStatisExcelRO> userYearStaticExcelData(LogStatisPO param);
	
	List<LogMenuStatisRO> menuStaticData(LogStatisPO param);
	
	List<LogMenuStatisRO> menuStaticExcelData(LogStatisPO param);
}
