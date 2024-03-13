package com.seegene.web.repository.mariadb;

import java.util.List;

import com.seegene.web.admin.board.manage.vo.BoardDefaultMasterVO;
import com.seegene.web.admin.board.manage.vo.BoardManageListRO;
import com.seegene.web.admin.board.manage.vo.BoardManageViewRO;
import com.seegene.web.common.SearchPaggingCommonPO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * 통합 게시판 맵퍼
 */
@Mapper()
public interface BoardManageMapper {
	/** 통합 게시판 로그용 */
	BoardDefaultMasterVO findBoardManageMasterBySeq(int seq);
	/** 통합 게시판 검색 리스트 */
	List<BoardManageListRO> findBoardManageList(SearchPaggingCommonPO param);
	/** 통합 게시판 검색 리스트 카운트 */
	int countBoardManageList(SearchPaggingCommonPO param);
	/** 통합 게시판 상세 조회 */
	BoardManageViewRO findBoardManageViewBySeq(int seq);
	/** 통합 게시판 등록 */
	void addBoardManage(BoardDefaultMasterVO param);
	/** 통합 게시판 수정용 */
	void editBoardManage(BoardDefaultMasterVO param);
	/** 통합 게시판 삭제 */
	void deleteBoardManage(BoardDefaultMasterVO deletePO);

}
