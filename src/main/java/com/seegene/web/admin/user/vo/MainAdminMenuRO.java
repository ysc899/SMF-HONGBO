package com.seegene.web.admin.user.vo;

import java.io.Serializable;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MainAdminMenuRO implements Comparable<MainAdminMenuRO>, Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -441679347426904072L;

	/** 식별자 */
	private int seq;

	/** 메뉴명 */
	private String menuName;

	/** 메뉴 출력 순서 */
	private int menuOrder;

	/** 메뉴 url */
	private String menuUrl;

	/** 부모 메뉴 seq */
	private int parentSeq;
	
	/** 하위 메뉴 */
	private List<MainAdminMenuRO> childs;
	
	/** 읽기 여부 */
	private String readFlag;

	/** 쓰기 여부 */
	private String writeFlag;


	@Override
	public int compareTo(MainAdminMenuRO o) {
		return Integer.compare(this.menuOrder, o.getMenuOrder());
	}

	
	
}
