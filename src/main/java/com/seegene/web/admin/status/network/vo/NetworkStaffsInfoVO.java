package com.seegene.web.admin.status.network.vo;

import java.util.Date;

import lombok.Data;

/**
 * 언어별 네트워크 담당자 정보 테이블
 */
@Data
public class NetworkStaffsInfoVO {

	/** 식별자 */
	private int seq;

	/** 언어 타입 코드 */
	private String codeLangType;

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

	/** 담당자 마스터 */
	private int networkStaffsSeq;

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
