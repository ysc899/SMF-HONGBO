package com.seegene.web.admin.menu.user.vo;

import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MenuVO implements Comparable<MenuVO>{
	

	/** 식별자 */
	private int seq;

	/** 메뉴명 */
	private String menuName;
	/** 메뉴 단계*/
	private int menuLevel;

	/** 메뉴 출력 순서 */
	private int menuOrder;

	/** 메뉴 url */
	private String menuUrl;

	/** 메뉴 타입 코드 */
	private String codeMenuType;
	/** 메뉴 타입 코드 명*/
	private String codeMenuName;
	/** 메뉴 언어 타입 코드 */
	private String codeLangType;
	/** 메뉴 언어 타입 코드 명 */
	private String codeLangName;

	/** 메뉴 로그인 타입 코드 */
	private String codeLoginType;
	/** 메뉴 로그인 타입 코드 명 */
	private String codeLoginName;

	/** 상위 메뉴 */
	private MenuVO parent;
	/** 상위 메뉴 seq*/
	private int parentSeq;
	/** 상위 메뉴 이름 */
	private String parentName;
	/** 하위 메뉴 */
	private List<MenuVO> childs;

	/** 등록일 */
	private Date regDate;

	/** 최초 등록한 사용자 */
	private String regUserId;

	/** 최종 수정일 */
	private Date editDate;

	/** 최종 수정한 사용자 */
	private String editUserId;
	
	/** 최종 수정 사용자 명 */
	private String editUserName;

	/** 삭제 여부 */
	private String deleteFlag;
	
	@Override
	public int compareTo(MenuVO o) {
		return Integer.compare(this.menuOrder, o.getMenuOrder());
	}


}
