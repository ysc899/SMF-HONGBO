package com.seegene.web.admin.board.manage.vo;

import lombok.Data;

/**
 * 통합 게시판 관리 등록용 PO
 */
@Data
public class BoardManageAddPO{

	/** 언어코드 */
	private String codeLang;
	/** 게시판 명 */
	private String name;
	/** 게시판 설명 */
	private String desc;
	/** 섬네일 사용 여부 */
	private String optThum;
	/** 첨부파일 사용 여부 */
	private String optFile;
	/** 공지글 사용 여부 */
	private String optNoti;


}

