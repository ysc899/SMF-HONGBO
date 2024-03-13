package com.seegene.web.admin.board.notice.vo;

import lombok.Data;

/**
 * 공문 수정용
 */
@Data
public class BoardNoticeEditPO extends BoardNoticeAddPO{
	
	/** 공문 seq */
	private int seq;
	/** 삭제될 파일 json */
	private String deleteFileJSON;
	/** 수정한 사용자 ID */
	private String editUserId;
}

