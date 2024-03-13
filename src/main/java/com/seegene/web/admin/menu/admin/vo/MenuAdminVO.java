package com.seegene.web.admin.menu.admin.vo;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString(exclude = "parent")
@Entity
public class MenuAdminVO implements Comparable<MenuAdminVO> {

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
	
	/** 상위 메뉴 */
	private MenuAdminVO parent;

	/** 하위 메뉴 */
	private List<MenuAdminVO> childs;

	/** 등록일 */
	private Date regDate;

	/** 최초 등록한 사용자 */
	private String regUserId;

	/** 최종 수정일 */
	private Date editDate;

	/** 최종 수정한 사용자 */
	private String editUserId;

	/** 삭제 여부 */
	private String deleteFlag;

	@Override
	public int compareTo(MenuAdminVO o) {
		return Integer.compare(this.menuOrder, o.getMenuOrder());
	}

	
	
}
