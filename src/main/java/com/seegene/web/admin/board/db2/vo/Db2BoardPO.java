package com.seegene.web.admin.board.db2.vo;

import lombok.Data;

@Data
public class Db2BoardPO {
	/** 회사코드 */
	private String iCor = "NML";
	/** 등록자 ID */
	private String iUid;
	/** ip */
	private String iIp;
	/** 성공 코드 */
	private String oMsgcod;
	/** 에러 코드 */
	private String oErrcod;
	/** seq */
	private long iSeq;
	/** 작성자 이름 */
	private String iCnm;
	/** 문서번호 */
	private String iDno;
	/** 문서종류 공문 : OFF_DOCU, 새소식 : NOTICE */
	private String iDcl;
	/** 시스템 구분 */
	private String iSdv = "ALL";
	/** 팝업 관련 */
	private String iPyn="N";
	private int iPfr=0;
	private int iPto=0;
	private int iLco=0;
	private int iTco=0;
	/** 타이틀 */
	private String iTit;
	/** 내용 */
	private String iCon;
	
	
}
