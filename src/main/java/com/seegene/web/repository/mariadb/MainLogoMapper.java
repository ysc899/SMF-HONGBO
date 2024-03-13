package com.seegene.web.repository.mariadb;

import java.util.List;

import com.seegene.web.admin.main.logo.vo.MainLogoListRO;
import com.seegene.web.admin.main.logo.vo.MainLogoUserRO;
import com.seegene.web.admin.main.logo.vo.MainLogoVO;
import com.seegene.web.admin.main.logo.vo.MainLogoViewRO;
import com.seegene.web.common.SearchPaggingCommonPO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * 메인 로고 맵퍼
 */
@Mapper()
public interface MainLogoMapper {
	/** 로고 로그용 조회 */
	MainLogoVO findLogoBySeq(int seq);
	/** 로고 관리 리스트 */
	List<MainLogoListRO> findLogoList(SearchPaggingCommonPO param);
	/** 로고 관리 리스트 카운트 */
	int countLogoList(SearchPaggingCommonPO param);
	/** 기간 확인용 */
	int checkDate(MainLogoVO param);
	/** 기간 확인용 2*/
	int checkEditDate(MainLogoVO param);
	/** 로고 상세 조회 */
	MainLogoViewRO findLogoViewBySeq(int seq);
	/** 로고 등록 */
	void addLogo(MainLogoVO param);
	/** 로고 수정 */
	void editLogo(MainLogoVO param);
	/** 로고 삭제 */
	void deleteLogo(MainLogoVO deletePO);
	
	//사용자용
	/** 메인 로고 확인용 */
	MainLogoUserRO findMainUserLogo(MainLogoVO param);
}
