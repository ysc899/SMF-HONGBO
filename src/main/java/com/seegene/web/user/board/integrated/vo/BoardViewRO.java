package com.seegene.web.user.board.integrated.vo;

import java.util.Date;
import java.util.List;

import com.seegene.web.admin.board.integrated.vo.BoardIntegratedFileViewRO;

import lombok.Data;

/**
 * 게시물 상세 용
 */
@Data
public class BoardViewRO {
	
	/** 식별자 */
	private int seq;
	
	/** 타이틀 */
	private String title;

	/** 게시물 내용 */
	private String content;

	/** 조회 수 */
	private long hitCnt;

	/** 최종 수정일 */
	private Date editDate;
	
	/** 최초 등록일 */
	private Date regDate;
	
	/** 첨부 파일들 */
	private List<BoardIntegratedFileViewRO> files;
	
	private BoardViewNextPreRO nextBoard;
	
	private BoardViewNextPreRO preBoard;
	

	private String oneClickGcd;
	
	private String oneClickGnm;
}
