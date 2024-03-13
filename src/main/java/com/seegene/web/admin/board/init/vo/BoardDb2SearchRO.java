package com.seegene.web.admin.board.init.vo;

import lombok.Data;

@Data
public class BoardDb2SearchRO implements Comparable<BoardDb2SearchRO>{
	/** 회사코드 */
	private String s014fyn;
	/** 등록자 ID */
	private String s014ryn;
	/** ip */
	private String s014cor;
	/** 성공 코드 */
	private long s014seq;
	/** 에러 코드 */
	private String s014wdt;
	
	private String s014dno;
	
	private String s014dcl;
	private String s002cnm;
	private String s014sdv;
	private String s014pyn;
	private int s014pfr;
	private int s014pto;
	private int s014lco;
	private int s014tco;
	private int s014wid;
	private int s014hit;
	private String s014tit;
	private String s014cnm;
	@Override
	public int compareTo(BoardDb2SearchRO o) {
		return Long.compare(this.s014seq, o.getS014seq());
	}
	
	
}
