package com.seegene.web.admin.board.payrollNotice.vo;

import java.util.Date;

import lombok.Data;

/**
 * 공문  파일 vo
 */
@Data
public class PayrollNoticeFileVO {

	/** 식별자 */
	private int seq;

	/** 파일 저장 경로 */
	private String filePath;

	/** 파일 이름 */
	private String fileName;

	/** 파일 사이즈 */
	private long fileSize;

	/** 파일 다운 수 */
	private int downCnt;

	/** 급여 고시 마스터 */
	private int payrollNoticeSeq;

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