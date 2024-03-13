package com.seegene.web.repository.db2;

import java.util.List;

import com.seegene.web.admin.board.db2.vo.Db2BoardPO;
import com.seegene.web.admin.board.db2.vo.Db2FilePO;
import com.seegene.web.admin.board.init.vo.BoardDb2SearchDtlPO;
import com.seegene.web.admin.board.init.vo.BoardDb2SearchDtlRO;
import com.seegene.web.admin.board.init.vo.BoardDb2SearchFileRO;
import com.seegene.web.admin.board.init.vo.BoardDb2SearchPO;
import com.seegene.web.admin.board.init.vo.BoardDb2SearchRO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * DB2 공문 새소식 관련 맵퍼
 */
@Mapper
public interface DB2BoardMapper {
	
	/** 게시물 등록 */
	void addBoardData(Db2BoardPO param);
	/** 게시물 첨부파일 등록 */
	void addBoardFileData(Db2FilePO param);
	/** 게시물 수정 */
	void updateBoardData(Db2BoardPO param);
	/** 게시물 삭제 */
	void deleteBoardData(Db2BoardPO param);
	/** 게시물 첨부파일 삭제 */
	void deleteBoardFileData(Db2FilePO param);
	
	
	List<BoardDb2SearchRO> findBoardList(BoardDb2SearchPO param);
	BoardDb2SearchDtlRO findBoardDtl(BoardDb2SearchDtlPO param);
	List<BoardDb2SearchFileRO> findBoardFileDtl(BoardDb2SearchDtlPO param);
}
