package com.seegene.web.repository.mariadb;

import java.util.List;

import com.seegene.web.admin.promotion.ebook.vo.EBookListRO;
import com.seegene.web.admin.promotion.ebook.vo.EBookSearchPO;
import com.seegene.web.admin.promotion.ebook.vo.EBookVO;
import com.seegene.web.admin.promotion.ebook.vo.EBookViewRO;
import com.seegene.web.admin.promotion.vo.PromotionVO;
import com.seegene.web.common.SearchPaggingCommonPO;
import com.seegene.web.user.customer.webzine.vo.WebzineListRO;
import com.seegene.web.user.customer.webzine.vo.WebzineSearchPO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * 전자책 맵퍼
 */
@Mapper()
public interface EBookMapper {
	/** 전자책 로그용 조회 */
	EBookVO findEBookBySeq(int seq);
	
	/** 전자책 검색 리스트 */
	List<EBookListRO> findEBookList(EBookSearchPO param);
	/** 전자책 검색 리스트 카운트 */
	int countEBookList(EBookSearchPO param);
	/** 전자책 상세 조회 */
	EBookViewRO findEBookViewBySeq(int param);
	/** 전자책 등록 */
	void addEBook(EBookVO param);
	/** 전자책 수정 */
	void editEBook(EBookVO param);
	/** 전자책 삭제 */
	void deleteEBook(EBookVO deletePO);
	/** 언어별 카테고리별 갯수 */
	int maxPrintOrder(EBookVO param);
	/** 전자책 순서 변경 로그용 */
	List<EBookVO> checkEBookOrder(EBookVO param);
	/** 전자책 순서 변경 로그 증가 업데이트 */
	void updateEBookOrderInc(EBookVO param);
	/** 전자책 순서 변경 로그 감소 업데이트 */
	void updateEBookOrderDec(EBookVO param);
	
	//사용자용
	/** 사용자용 전자책 리스트 조회 */
	List<WebzineListRO> findUserEBookList(WebzineSearchPO param);
	/** 메인용 전자책 리스트 조회 */
	List<WebzineListRO> findUserEBookMainList(WebzineSearchPO param);
	/** 사용자용 전자책 리스트 카운트 */
	int countUserEBookList(WebzineSearchPO param);
	/** 메인 검색  전자책 리스트 */
	List<WebzineListRO> findUserMainSearchEBookList(WebzineSearchPO param);
	/** 메인 검색  전자책  카운트*/
	int countUserMainSearchEBookList(WebzineSearchPO param);
	
	List<WebzineListRO> webzine_en_list(WebzineSearchPO param);
	
	
}
