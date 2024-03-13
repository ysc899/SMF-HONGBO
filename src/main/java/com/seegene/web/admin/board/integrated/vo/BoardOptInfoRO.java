
package com.seegene.web.admin.board.integrated.vo;

import lombok.Data;

/**
 * 통합 게시판 옵션
 */
@Data
public class BoardOptInfoRO {
	
	/** 섬네일 사용 여부 */
	private String optThumFlag;
	
	/** 첨부파일 사용 여부 */
	private String optFileFlag;
	
	/** 공지글 사용 여부 */
	private String optNotiFlag;
	
	/** 언어코드 */
	private String langType;
}
