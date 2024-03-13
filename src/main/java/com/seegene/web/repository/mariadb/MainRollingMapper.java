package com.seegene.web.repository.mariadb;

import java.util.List;

import com.seegene.web.admin.main.rolling.vo.MainRollingListRO;
import com.seegene.web.admin.main.rolling.vo.MainRollingVO;
import com.seegene.web.admin.main.rolling.vo.MainRollingViewRO;
import com.seegene.web.common.SearchPaggingCommonPO;
import com.seegene.web.user.main.vo.RollingRO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * 채용 맵퍼
 */
@Mapper()
public interface MainRollingMapper {
	/** 채용 로그용 조회 */
	MainRollingVO findRollingBySeq(int seq);
	/** 채용 검색 리스트 */
	List<MainRollingListRO> findRollingList(SearchPaggingCommonPO param);
	/** 채용 검색 리스트 카운트 */
	int countRollingList(SearchPaggingCommonPO param);
	/** 롤링 상세 조회 */
	MainRollingViewRO findRollingViewBySeq(int seq);
	
	/** 언어별 갯수 */
	int getPrintOrder(String langCode);
	
	/** 롤링 순서 변경 로그용 */
	List<MainRollingVO> checkRollingOrder(MainRollingVO param);
	/** 롤링 순서 변경 로그 증가 업데이트 */
	void updateRollingOrderInc(MainRollingVO param);
	/** 롤링 순서 변경 로그 감소 업데이트 */
	void updateRollingOrderDec(MainRollingVO param);
	/** 롤링 등록 */
	void addRolling(MainRollingVO param);
	/** 롤링 수정 */
	void editRolling(MainRollingVO param);
	/** 채용 삭제 */
	void deleteRolling(MainRollingVO deletePO);
	
	//사용자용
	List<RollingRO> userRollingList();
}
