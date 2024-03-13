package com.seegene.web.admin.inspection.test.vo;

import lombok.Data;

/**
 * DB2 코드형 데이터 RO
 */
@Data
public class DB2CodeRO implements Comparable<DB2CodeRO>{

	/** 코드값 */
	private String s002scd;
	/** 부모 카테고리 */
	private String s002pscd;
	/** 출력 순서 */
	private int s002seq;
	/** 코드명 */
	private String s002cnm;

	@Override
	public int compareTo(DB2CodeRO o) {
		return Integer.compare(this.s002seq, o.s002seq);
	}
	
}
