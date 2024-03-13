package com.seegene.web.admin.log.device.vo;

import java.util.Date;

import lombok.Data;

/**
 * 접속 장비 로그
 */
@Data
public class LogDeviceInfoVO {

	/** 식별자 */
	private long seq;

	/** 메뉴명 */
	private int screenWidth;

	/** 파라미터 json */
	private int screenHeight;

	private String os;

	private String browser;

	/** 등록일 */
	private Date regDate;

	/** 접속 사용자 */
	private String regUserId;

	/** 접근 IP */
	private String ip;

}
