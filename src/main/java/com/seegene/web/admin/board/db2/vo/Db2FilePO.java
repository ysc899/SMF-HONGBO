package com.seegene.web.admin.board.db2.vo;

import lombok.Data;

@Data
public class Db2FilePO {
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
	/** file seq */
	private int iFsq;
	/** 파일 경로 or url */
	private String iFpt;
	/** 파일 이름*/
	private String iFnm;
	/** 파일 이름2*/
	private String iFsnm;
}
