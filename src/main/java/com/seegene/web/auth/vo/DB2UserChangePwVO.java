package com.seegene.web.auth.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class DB2UserChangePwVO {
	private String I_COR;
	private String I_UID;
	private String I_IP;
	private String O_MSGCOD;
	private String O_ERRCOD;
	private String I_LOGLID;
	private String I_SPWD;
	private String I_PWD;
	private String I_SPWD_SHA;
	private String I_PWD_SHA;
	
	
	public DB2UserChangePwVO(String cor, String uid, String ip, String nowPw, String nowPwEnc, String newPw, String newPwEnc) {
		super();
		this.I_COR = cor;
		this.I_UID = uid;
		this.I_IP = ip;
		this.I_LOGLID = uid;
		this.I_SPWD = nowPw;
		this.I_SPWD_SHA = nowPwEnc;
		this.I_PWD = newPw;
		this.I_PWD_SHA = newPwEnc;
	}
}
