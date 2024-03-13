package com.seegene.web.admin.status.staffs.vo;

import lombok.Data;

/**
 * 의료진 등록 기본 정보
 */
@Data
public class StaffsEditDefaultRO extends StaffsAddDefaultRO{
	
	private int maxOrder;
}
