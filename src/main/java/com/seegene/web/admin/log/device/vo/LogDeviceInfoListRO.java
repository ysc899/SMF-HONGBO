package com.seegene.web.admin.log.device.vo;

import java.util.Date;

import lombok.Data;

/**
 * 접속 장비 로그
 */
@Data
public class LogDeviceInfoListRO {

	private long row;
	
	/** 식별자 */
	private long seq;

	/** 접근 IP */
	private String ip;
	/** os*/
	private String os;
	/** 브라우져*/
	private String browser;
	/** 스크린 x*/
	private int screenWidth;

	/** 스크린 y*/
	private int screenHeight;
	/** 등록일 */
	private Date regDate;

	/** 접속 사용자 */
	private String regUserId;

}
