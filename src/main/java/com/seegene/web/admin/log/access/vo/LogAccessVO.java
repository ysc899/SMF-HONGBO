package com.seegene.web.admin.log.access.vo;

import java.util.Date;

import lombok.Data;

/**
 * 접속 로그
 */
@Data
public class LogAccessVO {

	/** 식별자 */
	private long seq;

	/** 접근 메뉴 */
	private int menuSeq;

	/** 접근 IP */
	private String ip;

	/** 접근 사용자 ID */
	private String userId;

	/** 등록일 */
	private Date regDate;

}
