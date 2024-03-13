package com.seegene.web.common;

import java.util.List;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class CommonListReuslt<T> {

	/**
	 * 결과 리스트
	 */
	private List<T> content;

	/**
	 * 총 갯수
	 */
	private int totalElements;

	/**
	 * 리턴 갯수
	 */
	private int returnCount;

	/**
	 * 현재 페이지 번호
	 */
	private int currentPage;

	/**
	 * 총 페이지 갯수
	 */
	private int totalPages;
	
	/** 검색 옵션 */
	private SearchPaggingCommonPO option;
	
	public CommonListReuslt(List<T> content, int totalElements, SearchPaggingCommonPO param){
		super();
		this.content = content;
		this.totalElements = totalElements;
		this.returnCount = param.getLimit();
		this.currentPage = param.getCurrentPage();
		this.option = param;
		
		setTotalPage();
	}
	

	public CommonListReuslt(List<T> content, int totalElements, int returnCount, int currentPage) {
		super();
		this.content = content;
		this.totalElements = totalElements;
		this.returnCount = returnCount;
		this.currentPage = currentPage;
		
		setTotalPage();

	}
	
	private void setTotalPage(){
		if (totalElements > 0 && returnCount > 0) {
			int tempRound = totalElements % returnCount;

			this.totalPages = totalElements / returnCount;

			if (tempRound > 0) {
				this.totalPages++;
			}
		} else {
			// 페이징 기본 출력을 위해 1로 설정
			this.totalPages = 1;
		}		
	}

}
