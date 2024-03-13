package com.seegene.web.repository.mariadb;

import java.util.List;

import com.seegene.web.admin.main.banner.sub.vo.MainSubBannerListRO;
import com.seegene.web.admin.main.banner.sub.vo.MainSubBannerVO;
import com.seegene.web.admin.main.banner.sub.vo.MainSubBannerViewRO;
import com.seegene.web.admin.main.banner.sub.vo.MainUserBannerSubListRO;
import com.seegene.web.common.SearchPaggingCommonPO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * 채용 맵퍼
 */
@Mapper()
public interface MainBannerSubMapper {
	/** 채용 로그용 조회 */
	MainSubBannerVO findSubBannerBySeq(int seq);
	/** 채용 검색 리스트 */
	List<MainSubBannerListRO> findSubBannerList(SearchPaggingCommonPO param);
	/** 채용 검색 리스트 카운트 */
	int countSubBannerList(SearchPaggingCommonPO param);
	/** 롤링 상세 조회 */
	MainSubBannerViewRO findSubBannerViewBySeq(int seq);
	
	/** 언어별 갯수 */
	int getPrintOrder(String langCode);
	
	/** 롤링 순서 변경 로그용 */
	List<MainSubBannerVO> checkSubBannerOrder(MainSubBannerVO param);
	/** 롤링 순서 변경 로그 증가 업데이트 */
	void updateSubBannerOrderInc(MainSubBannerVO param);
	/** 롤링 순서 변경 로그 감소 업데이트 */
	void updateSubBannerOrderDec(MainSubBannerVO param);
	/** 롤링 등록 */
	void addSubBanner(MainSubBannerVO param);
	/** 롤링 수정 */
	void editSubBanner(MainSubBannerVO param);
	/** 채용 삭제 */
	void deleteSubBanner(MainSubBannerVO deletePO);
	
	//사용자용
	List<MainUserBannerSubListRO> userSubBannerList();
}
