package com.seegene.web.repository.mariadb;

import java.util.List;

import com.seegene.web.admin.faq.integrated.vo.BoardFaQSlaveVO;
import com.seegene.web.admin.faq.integrated.vo.FaqIntegratedResultRO;
import com.seegene.web.common.SearchIntegrateSearchPaggingPO;
import com.seegene.web.user.faq.vo.FaqUserListRO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * 통합 FAQ 맵퍼
 */
@Mapper()
public interface FaqIntegratedMapper {
	/** 공문 파일 로그용 */
	BoardFaQSlaveVO findFaqSlaveBySeq(BoardFaQSlaveVO param);
	/** 통합 FAQ 검색 리스트 */
	List<FaqIntegratedResultRO> findFaqIntegratedList(SearchIntegrateSearchPaggingPO param);
	/** 통합 FAQ 검색 리스트 카운트 */
	int countFaqIntegratedList(SearchIntegrateSearchPaggingPO param);
	/** 통합 faq 상세 조회 */
	FaqIntegratedResultRO findFaqIntegratedViewBySeq(BoardFaQSlaveVO param);
	/** 통합 FAQ 내용 등록 */
	void addFaqIntegrated(BoardFaQSlaveVO param);
	/** 통합 FAQ 내용 수정용 */
	void editFaqIntegrated(BoardFaQSlaveVO param);
	/** 통합 FAQ 내용  삭제  */
	void deleteFaqIntegrated(BoardFaQSlaveVO deletePO);
	
	//사용자용
	/** 카테고리 리스트 조회 */
	List<String> findUserFaqIntegratedCategory(BoardFaQSlaveVO param);
	/** faq 리스트 */
	List<FaqUserListRO> findUserFaqIntegratedList(BoardFaQSlaveVO param);
	
	/** 언어의 모든 faq 리스트 */
	List<Integer> findLanguageFaqs(String language);
	
	/** 통합 FAQ 메인 검색 리스트 */
	List<FaqUserListRO> findMainSearchFaqIntegratedList(SearchIntegrateSearchPaggingPO param);
	/** 통합 FAQ 메인 검색 리스트 카운트 */
	int countMainSearchFaqIntegratedList(SearchIntegrateSearchPaggingPO param);
	

}
