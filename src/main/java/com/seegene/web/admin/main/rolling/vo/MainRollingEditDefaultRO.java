package com.seegene.web.admin.main.rolling.vo;

import lombok.Data;

/**
 * 롤링 등록 기본 정보
 */
@Data
public class MainRollingEditDefaultRO extends MainRollingAddDefaultRO{
	
	private int maxCount;
	
}
