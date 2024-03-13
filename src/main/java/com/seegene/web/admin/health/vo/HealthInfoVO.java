package com.seegene.web.admin.health.vo;

import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 원클릭 건강정보 마스터
 */
@Getter
@Setter
@ToString
public class HealthInfoVO {

	/** 식별자 */
	private int seq;

	/** 타이틀 섬네일 이미지 경로 */
	private String imgTitleThumPath;
	
	/** 타이틀 섬네일 이미지 파일명 */
	private String imgTitleThumName;

	/** 언어 타입 코드 */
	private String codeLangType;

	/** 타이틀 */
	private String title;

	/** 보조 타이틀 */
	private String subTitle;

	/** 내용 파일 경로 */
	private String imgContentPath;
	
	/** 내용 파일 명 */
	private String imgContentName;

	/** 건강정보 작성자 */
	private String writer;

	/** 검수자 */
	private String inspector;

	/** 검수자 설명 */
	private String inspectorCmt;

	/** 관련 검사 코드 */
	private List<HealthInfoTestCodeVO> testCodes;

	/** 관련 검사 수기 입력 */
	private List<HealthInfoTestHardInfoVO> testHards;

	/** 언어벼별 출처 정보 */
	private List<HealthInfoSourceVO> sources;

	/** 출력 순서 */
	private int printOrder;

	/** 출력 여부 */
	private String printFlag;
	
	/** 조회 수 */
	private int viewCount;

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
