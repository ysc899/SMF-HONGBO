package com.seegene.web.repository.mariadb;

import java.util.List;

import com.seegene.web.admin.board.recruit.vo.BoardRecruitListRO;
import com.seegene.web.admin.board.recruit.vo.BoardRecruitTaskEditPO;
import com.seegene.web.admin.board.recruit.vo.BoardRecruitTaskVO;
import com.seegene.web.admin.board.recruit.vo.BoardRecruitVO;
import com.seegene.web.admin.board.recruit.vo.BoardRecruitViewRO;
import com.seegene.web.admin.board.recruit.vo.BoardRrecruitTaskDeletePO;
import com.seegene.web.common.SearchPaggingCommonPO;
import com.seegene.web.user.board.recruit.vo.RecruitListRO;
import com.seegene.web.user.board.recruit.vo.RecruitSearchPO;
import com.seegene.web.user.board.recruit.vo.RecruitViewRO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * 채용 맵퍼
 */
@Mapper()
public interface BoardRecruitMapper {
	/** 채용 로그용 조회 */
	BoardRecruitVO findRecruitBySeq(int seq);
	/** 채용 부문 정보 로그용 조회 */
	List<BoardRecruitTaskVO> findRecruitTaskByRecruitSeq(int recruitSeq);
	/** 채용 검색 리스트 */
	List<BoardRecruitListRO> findRecruitList(SearchPaggingCommonPO param);
	/** 채용 검색 리스트 카운트 */
	int countRecruitList(SearchPaggingCommonPO param);
	/** 채용 상세 조회 */
	BoardRecruitViewRO findRecruitViewBySeq(int seq);
	/** 채용 상세 조회용 업무 리스트*/
	List<BoardRecruitTaskVO> findRecruitTaskViewByRecruitSeq (int recruitSeq);
	/** 채용정보 등록 */
	void addRecruit(BoardRecruitVO param);
	/** 채용 업무 등록 */
	void addRecruitTask(List<BoardRecruitTaskVO> param);
	/** 채용 업무 등록 2*/
	void addRecruitTask2(List<BoardRecruitTaskEditPO> param);
	/** 채용 수정 */
	void editRecruit(BoardRecruitVO param);
	/** 채용 업무 수정 */
	void editRecruitTask(BoardRecruitTaskEditPO param);
	/** 대기중인 상태의 채용을 채용 중으로 변경 */
	void updateRecruitIng2Wait();
	/** 채용중인 상태의 채용을 마감으로 변경 */
	void updateRecruitEnd2Ing();
	/** 채용 삭제 */
	void deleteRecruit(BoardRecruitVO deletePO);
	/** 공문 파일 삭제 */
	void deleteRecruitTasks(BoardRrecruitTaskDeletePO param);
	
	//사용자용
	/** 채용 리스트 조회 */
	List<RecruitListRO> findUserRecruitList(RecruitSearchPO param);
	/** 채용 검색 리스트 카운트 */
	int countUserRecruitList(RecruitSearchPO param);
	/** 채용 사용자 상세 조회 */
	RecruitViewRO findUserRecruitViewBySeq(BoardRecruitVO param);
	/** 조회수 증가 */
	void updateRecruitHit(BoardRecruitVO param);
	
}
