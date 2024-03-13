package com.seegene.web.admin.log.access.vo;

import lombok.Data;

@Data
public class LogMenuStatisRO {

	private String menuName;
	
	private int seq;
	
	private String logYmd;
	
	private int cnt;
}
