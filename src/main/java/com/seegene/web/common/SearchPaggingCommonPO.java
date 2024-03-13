package com.seegene.web.common;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 페이징 기본 VO
 */
@Getter
@Setter
@ToString
public class SearchPaggingCommonPO {

	/** 검색어 */
	private String searchKeyword;
	
	/** 검색 옵션 */
	private String searchOption;

	/** 현재 페이지 번호 */
	private int currentPage;

	/** 리턴 받을 양 */
	private int limit;

	/** 커서 시작 위치 */
	private int offset;

	/**
	 * 마이바티스에서 사용할 리미트 설정
	 */
	public void setMybatisPagging() {
		if (this.limit == 0) {
			this.limit = 10;
		}

		if (this.getCurrentPage() > 0) {
			this.offset = (this.getCurrentPage() - 1) * this.limit;
		} else {
			this.currentPage = 1;
			this.offset = 0;
		}

	}

}
