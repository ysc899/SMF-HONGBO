package com.seegene.web.repository.mariadb;

import java.util.List;

import com.seegene.web.admin.faq.manage.vo.BoardFaQMasterVO;
import com.seegene.web.admin.faq.manage.vo.FaqManageListRO;
import com.seegene.web.admin.faq.manage.vo.FaqManageViewRO;
import com.seegene.web.common.SearchPaggingCommonPO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * 통합 FAQ 맵퍼
 */
@Mapper()
public interface FaqManageMapper {
	/** 통합 FAQ 로그용 */
	BoardFaQMasterVO findFaqManageMasterBySeq(int seq);
	/** 통합 FAQ 검색 리스트 */
	List<FaqManageListRO> findFaqManageList(SearchPaggingCommonPO param);
	/** 통합 FAQ 검색 리스트 카운트 */
	int countFaqManageList(SearchPaggingCommonPO param);
	/** 통합 FAQ 상세 조회 */
	FaqManageViewRO findFaqManageViewBySeq(int seq);
	/** 통합 FAQ 등록 */
	void addFaqManage(BoardFaQMasterVO param);
	/** 통합 FAQ 수정용 */
	void editFaqManage(BoardFaQMasterVO param);
	/** 통합 FAQ 삭제 */
	void deleteFaqManage(BoardFaQMasterVO deletePO);

}
