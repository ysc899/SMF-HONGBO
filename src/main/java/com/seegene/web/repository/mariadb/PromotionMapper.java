package com.seegene.web.repository.mariadb;

import java.util.List;

import com.seegene.web.admin.promotion.vo.PromotionListRO;
import com.seegene.web.admin.promotion.vo.PromotionVO;
import com.seegene.web.admin.promotion.vo.PromotionViewRO;
import com.seegene.web.admin.promotion.vo.SearchPromotionPO;
import com.seegene.web.user.promotion.vo.PromotionSearchPO;
import com.seegene.web.user.promotion.vo.PromotionUserListRO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * 홍보 동영상 맵퍼
 */
@Mapper()
public interface PromotionMapper {
	/** 홍보 영상 로그용 조회 */
	PromotionVO findPromotionBySeq(int seq);
	
	/** 홍보 영상 검색 리스트 */
	List<PromotionListRO> findPromotionList(SearchPromotionPO param);
	/** 홍보 영상 검색 리스트 카운트 */
	int countPromotionList(SearchPromotionPO param);
	/** 홍보 영상 상세 조회 */
	PromotionViewRO findPromotionViewBySeq(PromotionVO param);
	
	/** 홍보 영상 파일 조회 */
	String findPromotionFileBySeq(PromotionVO param);
	
	
	/** 언어별 갯수 */
	int maxPrintOrder(PromotionVO param);
	/** 홍보 영상 순서 변경 로그용 */
	List<PromotionVO> checkPromotionOrder(PromotionVO param);
	/** 홍보 영상 순서 변경 로그 증가 업데이트 */
	void updatePromotionOrderInc(PromotionVO param);
	/** 홍보 영상 순서 변경 로그 감소 업데이트 */
	void updatePromotionOrderDec(PromotionVO param);
	/** 홍보 영상 등록 */
	void addPromotion(PromotionVO param);
	/** 홍보 영상 수정 */
	void editPromotion(PromotionVO param);
	/** 홍보 영상 삭제 */
	void deletePromotion(PromotionVO deletePO);
	
	//사용자용
	/** 홍보 영상 사용자 리스트 */
	List<PromotionUserListRO> findUserPromotionList(PromotionSearchPO param);
	/** 홍보 영상 사용자 리스트 카운트 */
	int countUserPromotionList(PromotionSearchPO param);
	/** 홍보 영상 메인검색 리스트 */
	List<PromotionUserListRO> findUserMainSearchPromotionList(PromotionSearchPO param);
	/** 홍보 영상 메인검색 리스트 카운트 */
	int countUserMainSearchPromotionList(PromotionSearchPO param);
	/** 사용자 홍보영상 조회 */
	String findUserPromotionFileBySeq(int seq);
}
