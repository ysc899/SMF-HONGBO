package com.seegene.web.user.task.vessel.vo;

import lombok.Data;

/**
 * 검체용기 사용자 리스트용
 */
@Data
public class VesselUserListRO {
	private int seq;
	
	private String title;
	
	private String subTitle;
	
	private String inspectionName;
	
	private String filePath;
	private String fileContent;
}
