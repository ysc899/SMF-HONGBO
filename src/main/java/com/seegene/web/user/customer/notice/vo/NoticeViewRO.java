package com.seegene.web.user.customer.notice.vo;

import java.util.Date;
import java.util.List;

import com.seegene.web.admin.board.notice.vo.BoardNoticeFileViewRO;

import lombok.Data;

/**
 * 공문에 리스트 객체
 */
@Data
public class NoticeViewRO {

	/** 식별자 */
	private int seq;
	
	private String title;
	/** 공문번호 */
	private String noticeNumber;
	
	private String content;
	
	private long hitCnt;
	
	private String codeCenterName;
	
	private Date editDate;
	
	private String editUserName;
	
	private List<BoardNoticeFileViewRO> files;
	
	private NoticeViewNextPreRO nextNotice;
	
	private NoticeViewNextPreRO preNotice;
	
}
