package com.seegene.web.admin.log.error.vo;

import java.util.Date;

import lombok.Data;

@Data
public class LogErrorListRO {
	
	private int row;
	
	/** 식별자 */
	private long seq;

	private String url;
	
	/** 수정 메뉴 명 */
	private String menuName;

	/** 접근 IP */
	private String ip;

	/** 수정일 */
	private Date regDate;

	/** 수정한 사용자 */
	private String regUserId;
	private String regUserName;

}
