package com.seegene.web.admin.log.edit.vo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 편집 로그
 */
@Getter
@Setter
@ToString
public class LogEditVO {

	/** 식별자 */
	private long seq;

	/** 수정 메뉴 명  */
	private String menuName;
	
	/** 로그 종류 add or edit */
	private String logType;

	/** 수정된 vo 클래스 명 */
	private String className;

	/** 수정전 json */
	private String beforeJson;

	/** 수정된 json */
	private String afterJson;

	/** 수정일 */
	private Date editDate;

	/** 수정한 사용자 */
	private String editUserId;

	/** 접근 IP */
	private String ip;

}
