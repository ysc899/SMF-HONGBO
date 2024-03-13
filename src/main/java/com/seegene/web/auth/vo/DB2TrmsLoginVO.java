package com.seegene.web.auth.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class DB2TrmsLoginVO {
	private String I_COR;
	private String I_UID;
	private String I_HLK;
	private String O_RSTCOD;
	
	public DB2TrmsLoginVO(String cor, String uid, String hlk) {
		super();
		this.I_COR = cor;
		this.I_UID = uid;
		this.I_HLK = hlk;
	}
}
