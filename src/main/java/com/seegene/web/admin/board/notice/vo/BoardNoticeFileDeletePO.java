package com.seegene.web.admin.board.notice.vo;

import java.util.List;

import lombok.Data;

/**
 * 공문 파일 삭제 처리용 po
 */
@Data
public class BoardNoticeFileDeletePO{

	/** 공문 seq */
	private int noticeSeq;
	
	/** 삭제될 seqs */
	private List<Integer> deleteSeqs;
	/** 수정자 ID */
	private String editUserId;
	
}
