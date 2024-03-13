package com.seegene.web.admin.inspection.test.vo;

import lombok.Data;

@Data
public class InspectionTestUpdatePO {
	/** cor */
	private String iCor;
	/** id */
	private String iUid;
	/** ip */
	private String iIp;
	/** 메세지 코드 */
	private String oMsgcod;
	/** 에러 코드 */
	private String oErrcod;
	/** 검사코드 */
	private String iGcd;
	/** 보존방법 */
	private String iSav;
	/** 참고치 */
	private String iRef;
	/** 임상정보 */
	private String iCont;
	/** 주의사항 */
	private String iEtc;
	/** QR코드 URL */
	private String iUrl;
}
