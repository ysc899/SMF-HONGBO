package com.seegene.web.repository.mariadb;

import java.util.List;

import com.seegene.web.admin.log.edit.vo.LogEditListRO;
import com.seegene.web.admin.log.edit.vo.LogEditRemovePO;
import com.seegene.web.admin.log.edit.vo.LogEditSearchPO;
import com.seegene.web.admin.log.edit.vo.LogEditVO;
import com.seegene.web.admin.log.edit.vo.LogEditViewRO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * 편집 로그 맵퍼
 */
@Mapper()
public interface EditLogMapper {
	
	/**
	 * @param param 신규 추가 로그 내용
	 */
	void insertAddLog(LogEditVO param);
	/**
	 * @param param 수정 로그 내용
	 */
	void insertEditLog(LogEditVO param);
	
	
	/**
	 * @param param 검색조건
	 * @return 수정 로그 리스트
	 */
	List<LogEditListRO> findEditLogList(LogEditSearchPO param);
	
	/**
	 * @param param 검색조건
	 * @return 총갯수
	 */
	int countEditLogList(LogEditSearchPO param);
	
	List<LogEditViewRO> findDownloadEditLogList(LogEditSearchPO param);
	
	/**
	 * @param seq 식별자
	 * @return 수정로그 정보
	 */
	LogEditViewRO findEditLogView(long seq);
	
	void deleteLogEdit(long seq);
	
	int deleteCount(LogEditRemovePO param);
	
	void deleteLogEdits(LogEditRemovePO param);
}
