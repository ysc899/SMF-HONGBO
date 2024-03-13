package com.seegene.web.user.main.vo;

import lombok.Data;

/**
 * 메인 롤링용
 */
@Data
public class RollingRO implements Comparable<RollingRO> {
	/** 메뉴 언어 타입 코드 */
	private String codeLangType;

	/** 내용 */
	private String content;

	/** 링크 url */
	private String url;

	/** 출력 순서 */
	private int printOrder;

	@Override
	public int compareTo(RollingRO o) {
		return Integer.compare(this.printOrder, o.getPrintOrder());
	}
}
