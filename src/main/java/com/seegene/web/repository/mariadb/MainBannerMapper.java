package com.seegene.web.repository.mariadb;

import java.util.List;

import com.seegene.web.admin.main.banner.main.vo.MainBannerListRO;
import com.seegene.web.admin.main.banner.main.vo.MainBannerVO;
import com.seegene.web.admin.main.banner.main.vo.MainBannerViewRO;
import com.seegene.web.admin.main.banner.main.vo.MainUserBannerListRO;
import com.seegene.web.common.SearchPaggingCommonPO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * 채용 맵퍼
 */
@Mapper()
public interface MainBannerMapper {
	/** 채용 로그용 조회 */
	MainBannerVO findBannerBySeq(int seq);
	/** 채용 검색 리스트 */
	List<MainBannerListRO> findBannerList(SearchPaggingCommonPO param);
	/** 채용 검색 리스트 카운트 */
	int countBannerList(SearchPaggingCommonPO param);
	/** 롤링 상세 조회 */
	MainBannerViewRO findBannerViewBySeq(int seq);
	
	/** 언어별 갯수 */
	int getPrintOrder(String langCode);
	
	/** 롤링 순서 변경 로그용 */
	List<MainBannerVO> checkBannerOrder(MainBannerVO param);
	/** 롤링 순서 변경 로그 증가 업데이트 */
	void updateBannerOrderInc(MainBannerVO param);
	/** 롤링 순서 변경 로그 감소 업데이트 */
	void updateBannerOrderDec(MainBannerVO param);
	/** 롤링 등록 */
	void addBanner(MainBannerVO param);
	/** 롤링 수정 */
	void editBanner(MainBannerVO param);
	/** 채용 삭제 */
	void deleteBanner(MainBannerVO deletePO);
	
	//사용자용
	List<MainUserBannerListRO> userMainBannerList();
}
