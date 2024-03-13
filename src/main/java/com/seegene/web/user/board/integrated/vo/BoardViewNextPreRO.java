package com.seegene.web.user.board.integrated.vo;

import lombok.Data;

/**
 * 게시판 리스트 객체
 */
@Data
public class BoardViewNextPreRO {

	/** 식별자 */
	private int seq;

	/** 파일 이름 */
	private String title;
	/** 이전 다음 타입 */
	private String type;
	
}
