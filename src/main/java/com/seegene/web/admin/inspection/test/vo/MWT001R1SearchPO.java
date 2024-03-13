package com.seegene.web.admin.inspection.test.vo;

import lombok.Data;

/**
 * MWT001R1 프로시져 파라미터용 PO
 */
@Data
public class MWT001R1SearchPO {
	/** cor */
	private String iCor = "NML";
	/** 사용자 ID */
	private String iUid = "";
	/** 로그인 IP */
	private String iIp = "";
	/** 메세지 코드 */
	private String oMsgcod = "";
	/** 에러코드 */
	private String oErrcod = "";
	/** 조회 필드 DB2 TEST_INFO 코드 값 */
	private String iSerfnm = "";
	/** 검색어 */
	private String iSernm = "";
	/** 검사학부 코드 DB2 MEDI_CLS 코드 값 */
	private String iHak = "";
	/** 질병검사코드 확인 필요 */
	private String iIsc = "";
	/** 질병검사코드 확인 필요 */
	private String iAlhnm = "";
	
}
