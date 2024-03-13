package com.seegene.web.admin.board.notice.vo;

import lombok.Data;

/**
 * 공문 파일 다운로드용
 */
@Data
public class BoardFileDownPO {
	
	/** 공문 seq */
	private int boardNoticeSeq;
	/** 공문  파일 seq */
	private int boardNoticeFileSeq;
	
}

