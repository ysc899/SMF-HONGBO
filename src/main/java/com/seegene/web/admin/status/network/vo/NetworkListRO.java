package com.seegene.web.admin.status.network.vo;

import java.util.Date;

import lombok.Data;

/**
 * 전국 네트워크 리스트용 RO
 */
@Data
public class NetworkListRO {
	
	private int row;
	/** 맵핑 식별자 */
	private int seq;
	
	/** 전국 네트워크 지역 코드 */
	private String codeNetworkType;
	private String codeNetworkName;
	
	/** 담당자 출력 순서 */
	private int printOrder;
	
	/** 이름 */
	private String name;
	/** 직책 */
	private String department;
	/** 사업소명 */
	private String company;
	
	/** 최종 수정일 */
	private Date editDate;
	
}

