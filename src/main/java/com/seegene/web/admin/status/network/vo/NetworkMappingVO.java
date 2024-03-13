package com.seegene.web.admin.status.network.vo;

import java.util.Date;

import lombok.Data;

/**
 * 지역 과 담당자 맵핑용
 */
@Data
public class NetworkMappingVO {

	/** 식별자 */
	private int seq;

	/** 전국 네트워크 지역 코드 */
	private String codeNetworkType;

	/** 담당자 마스터 */
	private int networkStaffsSeq;

	/** 담당자 출력 순서 */
	private int printOrder;

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
