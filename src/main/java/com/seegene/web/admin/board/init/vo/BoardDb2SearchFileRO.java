package com.seegene.web.admin.board.init.vo;

import lombok.Data;

@Data
public class BoardDb2SearchFileRO implements Comparable<BoardDb2SearchFileRO>{
	
	
	private long s014seq;
	
	private String s014fpt;
	
	private String s014fnm;
	
	private String s014fsnm;
	
	@Override
	public int compareTo(BoardDb2SearchFileRO o) {
		return Long.compare(this.s014seq, o.getS014seq());
	}
	
	
}
