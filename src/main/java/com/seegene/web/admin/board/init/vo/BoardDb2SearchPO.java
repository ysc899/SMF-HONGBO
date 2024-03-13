package com.seegene.web.admin.board.init.vo;

import lombok.Data;

@Data
public class BoardDb2SearchPO {
	/** 회사코드 */
	private String iCor = "NML";
	/** 등록자 ID */
	private String iUid = "system";
	/** ip */
	private String iIp = "192.168.1.159";
	/** 성공 코드 */
	private String oMsgcod;
	/** 에러 코드 */
	private String oErrcod;
	
	private String iDcl;
	
	private String iTit = "";
	private String iCon = "";
	private String iCnm = "";
	private int iFwdt;
	private int iTwdt;
}
