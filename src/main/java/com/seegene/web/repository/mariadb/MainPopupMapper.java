package com.seegene.web.repository.mariadb;

import java.util.List;

import com.seegene.web.admin.main.popup.vo.MainPopupListRO;
import com.seegene.web.admin.main.popup.vo.MainPopupUserRO;
import com.seegene.web.admin.main.popup.vo.MainPopupVO;
import com.seegene.web.admin.main.popup.vo.MainPopupViewRO;
import com.seegene.web.common.SearchPaggingCommonPO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * 메인 팝업 맵퍼
 */
@Mapper()
public interface MainPopupMapper {
	/** 팝업 로그용 조회 */
	MainPopupVO findPopupBySeq(int seq);
	/** 팝업 관리 리스트 */
	List<MainPopupListRO> findPopupList(SearchPaggingCommonPO param);
	/** 팝업 관리 리스트 카운트 */
	int countPopupList(SearchPaggingCommonPO param);
	/** 팝업 상세 조회 */
	MainPopupViewRO findPopupViewBySeq(int seq);
	/** 팝업 등록 */
	void addPopup(MainPopupVO param);
	/** 팝업 수정 */
	void editPopup(MainPopupVO param);
	/** 팝업 삭제 */
	void deletePopup(MainPopupVO deletePO);
	
	//사용자용
	/** 메인 팝업 확인용 */
	List<MainPopupUserRO> findMainUserPopup();
}
