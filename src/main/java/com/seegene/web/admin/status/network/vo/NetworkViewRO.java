package com.seegene.web.admin.status.network.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class NetworkViewRO {
	
	private int seq;
	
	/** 본부장 여부 */
	private String directorFlag;

	/** 이메일 */
	private String email;

	/** 이미지 경로 */
	private String imagePath;
	
	/** 이미지 데이터 */
	private String imageContent;
	
	/** 최종 수정일 */
	private Date editDate;

	/** 최종 수정한 사용자 */
	private String editUserId;
	/** 최종 수정한 사용자 */
	private String editUserName;

	/** 지역 정보 */
	List<NetworkMappingRO> locInfos;
	
	/** 언어별 직원 정보 */
	List<NetworkStaffsInfoRO> staffsInfos; 
	
}

