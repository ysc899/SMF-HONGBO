package com.seegene.web.admin.board.init.vo;

import lombok.Data;

@Data
public class BoardDb2SearchDtlRO implements Comparable<BoardDb2SearchDtlRO>{
	
	private String s014cor;
	
	private long s014seq;
	
	private long s014wdt;
	
	private String s014cnm;
	
	private String s014dno;
	
	private String s014dcl;
	
	private String s002dcl;
	
	private String s014sdv;
	
	private String s002sdv;
	
	private String s014pyn;
	
	private String s002pyn;
	
	private String s014pfr;
	
	private String s014pto;
	
	private String s014lco;
	
	private String s014tco;
	
	private String s014tit;
	
	private String s014con;
	
	private String s014cur;
	@Override
	public int compareTo(BoardDb2SearchDtlRO o) {
		return Long.compare(this.s014seq, o.getS014seq());
	}
	
	
}
