package com.seegene.web.admin.board.integrated.vo;

import lombok.Data;

/**
 * 게시물 파일 ro
 */
@Data
public class BoardIntegratedFileViewRO {

	/** 식별자 */
	private int seq;

	/** 파일 이름 */
	private String fileName;
	
	/** 파일 경로 */
	private String filePath;

	/** 파일 사이즈 */
	private long fileSize;
	
	/** 섬네일 여부 */
	private String thumFlag;

	/** 파일 다운 수 */
	private int downCnt;

}