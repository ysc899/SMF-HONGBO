package com.seegene.web.admin.board.integrated.vo;

import lombok.Data;

/**
 * 게시물 수정 PO
 */
@Data
public class BoardIntegratedEditPO extends BoardIntegratedAddPO {

	/** 식별자 */
	private int seq;
	
	/** 첨부파일 삭제 JSON */
	private String deleteFileJSON;

}