package com.seegene.web.auth.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class DB2UserLoginVO {
	private String I_COR;
	private String I_UID;
	private String I_IP;
	private String O_MSGCOD;
	private String O_ERRCOD;
	private String I_PWD;
	private String I_PWD_NXT;
	private String O_PHCD;
	private String O_PUNM;
	private String O_PUGB;
	private String O_PIYN;
	
	private String trmsUrl;
	
	public DB2UserLoginVO(String cor, String uid, String ip, String pw, String pwEnc) {
		super();
		this.I_COR = cor;
		this.I_UID = uid;
		this.I_IP = ip;
		this.I_PWD = pw;
		this.I_PWD_NXT = pwEnc;
	}
}
