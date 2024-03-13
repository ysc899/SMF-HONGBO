package com.seegene.web.admin.main.banner.main.vo;

import java.util.List;

import com.seegene.web.admin.code.vo.CodeSlaveRO;

import lombok.Data;

@Data
public class MainBannerAddDefaultRO {
	/** 언어 구분 코드 */
	private List<CodeSlaveRO> langCodes;

}
