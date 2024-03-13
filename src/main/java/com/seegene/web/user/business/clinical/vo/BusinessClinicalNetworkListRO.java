package com.seegene.web.user.business.clinical.vo;

import lombok.Data;

/**
 * 의료진현황에 기본적으로 필요한 데이터
 */
@Data
public class BusinessClinicalNetworkListRO {

	//NetworkStaffsVO
	/** 맵핑 식별자 */
	private int seq;
	/** 본부장 여부 */
	private String directorFlag;
	/** 이메일 */
	private String email;
	/** 이미지 경로 */
	private String imagePath;
	private String imageContent;
	

	//NetworkStaffsInfoVO
	/** 이름 */
	private String name;

	/** 사업소명 */
	private String company;

	/** 직책 */
	private String department;
	
	/** 휴대폰 번호 */
	private String mobilePhone;

	/** FAX 번호 */
	private String fax;

	/** 주소 */
	private String address;
	
	private String codeNetworkType;
	
}
