package com.seegene.web.repository.mariadb;

import java.util.List;

import com.seegene.web.admin.board.init.vo.BoardNoticeFileMigVO;
import com.seegene.web.admin.board.init.vo.BoardNoticeMigVO;
import com.seegene.web.admin.board.notice.vo.BoardFileDownPO;
import com.seegene.web.admin.board.notice.vo.BoardNoticeDeletePO;
import com.seegene.web.admin.board.notice.vo.BoardNoticeEditPO;
import com.seegene.web.admin.board.notice.vo.BoardNoticeFileDeletePO;
import com.seegene.web.admin.board.notice.vo.BoardNoticeFileVO;
import com.seegene.web.admin.board.notice.vo.BoardNoticeFileViewRO;
import com.seegene.web.admin.board.notice.vo.BoardNoticeListRO;
import com.seegene.web.admin.board.notice.vo.BoardNoticeVO;
import com.seegene.web.admin.board.notice.vo.BoardNoticeViewRO;
import com.seegene.web.common.SearchPaggingCommonPO;
import com.seegene.web.user.customer.notice.vo.NoticeListRO;
import com.seegene.web.user.customer.notice.vo.NoticeSearchPO;
import com.seegene.web.user.customer.notice.vo.NoticeViewNextPreRO;
import com.seegene.web.user.customer.notice.vo.NoticeViewRO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * 공문 맵퍼
 */
@Mapper()
public interface BoardNoticeMapper {
	/** 공문 로그용 */
	BoardNoticeVO findNoticeBySeq(int seq);
	/** 공문 파일 로그용 */
	List<BoardNoticeFileVO> findNoticeFileByNoticeSeq(int noticeSeq);
	/** 공문 검색 리스트 */
	List<BoardNoticeListRO> findNoticeList(SearchPaggingCommonPO param);
	/** 공문 검색 리스트 카운트 */
	int countNoticeList(SearchPaggingCommonPO param);
	/** 공문 상세 조회 */
	BoardNoticeViewRO findNoticeViewBySeq(int seq);
	/** 공문 상세 조회용 파일 */
	List<BoardNoticeFileViewRO> findNoticeFileViewByNoticeSeq (int noticeSeq);
	/** 공문 등록 */
	void addNotice(BoardNoticeVO param);
	/** 공문 파일 등록 */
	void addNoticeFile(List<BoardNoticeFileVO> param);
	/** 파일 다운로드용 */
	BoardNoticeFileVO findNoticeFile(BoardFileDownPO param);
	/** 공문 수정 */
	void editNotice(BoardNoticeEditPO param);
	/** 공문 삭제 */
	void deleteNotice(BoardNoticeDeletePO deletePO);
	/** 공문 파일 삭제 */
	void deleteNoticeFiles(BoardNoticeFileDeletePO param);
	
	//마이그레이션용
	/** 공문 등록 */
	void addMigNotice(BoardNoticeMigVO param);
	
	void addMigNoticeFile(BoardNoticeFileMigVO param);
	
	
	//사용자 페이지용
	/** 공문 검색 리스트 */
	List<NoticeListRO> findUserNoticeList(NoticeSearchPO param);
	/** 공문 검색 리스트 카운트 */
	int countUserNoticeList(NoticeSearchPO param);
	/** 공지 리스트 */
	List<NoticeListRO> getUserNoticeList(String langCode);
	/** 사용자 공문 상세 조회 */
	NoticeViewRO findUserNoticeViewBySeq(BoardNoticeVO param);
	/** 조회수 증가 */
	void updateNoticeHit(int noticeSeq);
	/** 이전글 다음글 확인용 */
	List<NoticeViewNextPreRO> findNoticeNextPreBySeq(BoardNoticeVO param);
	/** 파일 다운로드 수 업 */
	void updateNoticeFileHit(BoardFileDownPO param);
}
