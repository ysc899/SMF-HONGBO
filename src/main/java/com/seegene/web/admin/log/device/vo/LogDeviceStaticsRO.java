package com.seegene.web.admin.log.device.vo;

import lombok.Data;

@Data
public class LogDeviceStaticsRO {

	private String logYmd;
	
	private String os;
	private String browser;
	private int  screenWidth;
	private int screenHeight;
	private int accessCount;
}
