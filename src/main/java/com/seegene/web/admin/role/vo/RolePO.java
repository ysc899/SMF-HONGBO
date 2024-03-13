package com.seegene.web.admin.role.vo;

import lombok.Data;

/**
 * 롤 추가시 사용할 po
 */
@Data
public class RolePO {
	/** 롤 이름 */
	private String roleName;
	/** 롤 설명 */
	private String roleDesc;

	/** 읽기 권한 들 */
	private int[] readSeqs;
	/** 쓰기 권한 들 */
	private int[] writeSeqs;
	/** 부모 메뉴들 */
	private int[] parentSeqs;
}
