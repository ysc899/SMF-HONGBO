package com.seegene.web.admin.status.network.vo;

import java.util.Date;

import lombok.Data;

/**
 * 지역 담당자 테이블
 */
@Data
public class NetworkStaffsVO {

	/** 식별자 */
	private int seq;

	/** 담당자 임시 이름 */
	private String name;

	/** 본부장 여부 */
	private String directorFlag;

	/** 이메일 */
	private String email;

	/** 이미지 경로 */
	private String imagePath;

	/** 등록일 */
	private Date regDate;

	/** 최초 등록한 사용자 */
	private String regUserId;

	/** 최종 수정일 */
	private Date editDate;

	/** 최종 수정한 사용자 */
	private String editUserId;

	/** 삭제 여부 */
	private String deleteFlag;

}
