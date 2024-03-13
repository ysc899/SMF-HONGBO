package com.seegene.web.admin.log.edit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class LogEditListRO {
	
	private int row;
	
	/** 식별자 */
	private long seq;

	private String logType;
	
	/** 수정 메뉴 명 */
	private String menuName;


	/** 수정일 */
	private Date editDate;

	/** 수정한 사용자 */
	private String editUserId;
	private String editUserName;

	/** 접근 IP */
	private String ip;

}
