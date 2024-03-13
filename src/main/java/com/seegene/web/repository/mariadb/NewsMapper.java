package com.seegene.web.repository.mariadb;

import java.util.List;

import com.seegene.web.admin.board.init.vo.BoardDefaultFileMigVO;
import com.seegene.web.admin.board.init.vo.BoardDefaultSlaveMigVO;
import com.seegene.web.admin.board.integrated.vo.BoardDefaultFileVO;
import com.seegene.web.admin.board.integrated.vo.BoardDefaultSlaveVO;
import com.seegene.web.admin.board.integrated.vo.BoardIntegratedFileDeletePO;
import com.seegene.web.admin.board.integrated.vo.BoardIntegratedFileViewRO;
import com.seegene.web.admin.board.integrated.vo.BoardIntegratedListRO;
import com.seegene.web.admin.board.integrated.vo.BoardIntegratedViewRO;
import com.seegene.web.admin.board.integrated.vo.BoardOptInfoRO;
import com.seegene.web.common.SearchIntegrateSearchPaggingPO;
import com.seegene.web.user.board.integrated.vo.BoardListRO;
import com.seegene.web.user.board.integrated.vo.BoardViewNextPreRO;
import com.seegene.web.user.board.integrated.vo.BoardViewRO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * 통합 게시판 내용 맵퍼
 */
@Mapper()
public interface NewsMapper {
	/** 통합 게시판 내용 로그용 */
	BoardDefaultSlaveVO findBoardSlaveBySeq(BoardDefaultSlaveVO param);
	/** 통합 게시판 내용 파일 로그용 */
	List<BoardDefaultFileVO> findBoardSlaveFilesBySeq(int slaveSeq);
	
	/** 통합 게시판 옵션 */
	BoardOptInfoRO findMasterOptBySeq(int masterSeq);
	/** 통합 게시판 내용 검색 리스트 */
	List<BoardIntegratedListRO> findBoardIntegratedList(SearchIntegrateSearchPaggingPO param);
	/** 통합 게시판 내용 검색 리스트 카운트 */
	int countBoardIntegratedList(SearchIntegrateSearchPaggingPO param);
	/** 통합 게시판 상세 조회 */
	BoardIntegratedViewRO findBoardIntegratedViewBySeq(BoardDefaultSlaveVO param);
	/** 통합 게시판 파일들 조회 */
	List<BoardIntegratedFileViewRO> findBoardIntegratedFilesViewBySeq(BoardDefaultSlaveVO param);
	
	/** 첨부파일 다운로드용 정보 */
	BoardDefaultFileVO findBoarddIntegratedFileInfo(BoardDefaultFileVO param);
	
	/** 통합게시판 내용 등록 */
	void addBoardIntegrated(BoardDefaultSlaveVO param);
	/** 통합 게시판 파일들 등록 */
	void addBoardFileIntegrated(List<BoardDefaultFileVO> param);
	/** 통합 게시판 내용 수정용 */
	void editBoardIntegrated(BoardDefaultSlaveVO param);
	/** 통합 게시판 섬네일 삭제*/
	void deleteBoardIntegratedThumFile(BoardDefaultSlaveVO param);
	/** 통합 게시판 게시물 삭제*/
	void deleteBoardIntegratedFiles(BoardIntegratedFileDeletePO param);
	/** 통합 게시판 내용  삭제  */
	void deleteBoardIntegrated(BoardDefaultSlaveVO deletePO);
	
	//마이그레이션용
	/** 통합게시판 마이그레이션 내용 등록 */
	void addMigBoardIntegrated(BoardDefaultSlaveMigVO param);
	/** 통합게시판 마이그레이션 파일 등록 */
	void addMigBoardFileIntegrated(BoardDefaultFileMigVO param);
	
	
	//사용자용 
	/** 사용자 게시판 내용 내용 리스트 */
	List<BoardListRO> findUserBoardIntegratedList(SearchIntegrateSearchPaggingPO param);
	/** 통합게시판 사용자용 내용 리스트 카운트 */
	int countUserBoardIntegratedList(SearchIntegrateSearchPaggingPO param);
	/** 공지 리스트 */
	List<BoardListRO> findBoardNoticeList(int masterSeq);
	/** 통합게시판 사용자 내용 조회 */
	BoardViewRO findUserBoardIntegratedViewBySeq(BoardDefaultSlaveVO param);
	/** 조회수 업 */
	void updateBoardHit(BoardDefaultSlaveVO param);
	/** 이전 다음 가져오기 */
	List<BoardViewNextPreRO> findBoardNextPreBySeq(BoardDefaultSlaveVO param);
	/** 파일 다운로드 조회수 업 */
	void updateBoardFileHit(BoardDefaultFileVO param);
	/** 언어의 모든 게시판 리스트 */
	List<Integer> findLanguageBoards(String language);
}
