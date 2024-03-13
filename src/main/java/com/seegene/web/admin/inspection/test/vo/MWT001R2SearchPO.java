package com.seegene.web.admin.inspection.test.vo;

import lombok.Data;

/**
 * MWT001R2 프로시져 파라미터용 PO
 */
@Data
public class MWT001R2SearchPO {
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
	/** 검사코드 */
	private String iGcd = "";
	private String locale = "ko";
}
