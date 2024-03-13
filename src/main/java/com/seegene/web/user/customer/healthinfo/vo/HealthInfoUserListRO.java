package com.seegene.web.user.customer.healthinfo.vo;

import java.util.Date;

import lombok.Data;

/**
 * 리스트용 RO
 */
@Data
public class HealthInfoUserListRO {
	
	private int seq;
	
	/** 타이틀 */
	private String title;

	/** 보조 타이틀 */
	private String subTitle;
	
	/** 타이틀 섬네일 이미지 경로 */
	private String imgTitleThumPath;
	private String imgTitleThumContent;
	
	/** 최종 수정일 **/
	private Date editDate;
	
	/** 최초 등록일 **/
	private Date regDate;
	
	/** 신규 등록 게시물**/
	private String newFlag;
	private int oneClick_newYn;
	

}
