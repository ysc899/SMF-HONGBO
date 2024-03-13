package com.seegene.web.admin.board.integrated.vo;

import java.util.List;

import lombok.Data;

/**
 * 통합 게시판 파일 삭제 처리용 po
 */
@Data
public class BoardIntegratedFileDeletePO{

	/** 게시물 내용 seq */
	private int slaveSeq;
	
	/** 삭제될 seqs */
	private List<Integer> deleteSeqs;
	/** 수정자 ID */
	private String editUserId;
	
}
