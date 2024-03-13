package com.seegene.web.admin.log.error.vo;

import java.util.Date;

import lombok.Data;

/**
 * 편집 로그
 */
@Data
public class LogErrorVO {

	/** 식별자 */
	private long seq;

	/** 접속 url */
	private String url;

	/** 메뉴명 */
	private String menuName;

	/** 파라미터 json */
	private String paramJson;

	/** 에러 메시지 */
	private String errorMsg;

	/** 수정일 */
	private Date regDate;

	/** 에러발생 사용자 */
	private String regUserId;

	/** 접근 IP */
	private String ip;

}
