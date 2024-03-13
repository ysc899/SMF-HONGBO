package com.seegene.web.user.customer.payrollNotice.vo;

import java.util.Date;
import java.util.List;

import com.seegene.web.admin.board.payrollNotice.vo.PayrollNoticeFileViewRO;

import lombok.Data;

/**
 * 공문에 리스트 객체
 */
@Data
public class PayrollViewRO {

	/** 식별자 */
	private int seq;
	
	private String title;
	/** 공문번호 */
	private String payrollNoticeNumber;
	
	private String content;
	
	private long hitCnt;
	
	private String codeCenterName;
	
	private Date editDate;
	
	private String editUserName;
	
	private List<PayrollNoticeFileViewRO> files;
	
	private PayrollViewNextPreRO nextNotice;
	
	private PayrollViewNextPreRO preNotice;
	
}
