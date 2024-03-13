package com.seegene.web.admin.board.integrated.vo;

import java.util.Date;

import lombok.Data;

/**
 * 통합 게시판 파일
 */
@Data
public class BoardDefaultFileVO {
	
	/** 식별자 */
	private int seq;

	/** 파일 저장 경로 */
	private String filePath;

	/** 파일 이름 */
	private String fileName;

	/** 파일 사이즈 */
	private long fileSize;
	
	/** 섬네일 여부 */
	private String thumFlag;

	/** 파일 다운 수 */
	private int downCnt;

	/** 통합게시판 마스터 */
	private int boardDefaultSlaveSeq;

	/** 등록일 */
	private Date regDate;

	/** 최초 등록한 사용자 */
	private String regUserId;

	/** 최종 수정일 */
	private Date editDate;

	/** 최종 수정한 사용자 */
	private String editUserId;

	/** 삭제 여부 */
	private String deleteFlag;
}

