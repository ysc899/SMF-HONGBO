package com.seegene.web.user.foundation.history.vo;

import java.util.List;

import lombok.Data;

@Data
public class HistoryUserResultRO {
	
	/** 연혁 정보들 */
	private List<HistoryUserListRO> hitstoryByYears;

	/** 년도 정보들 */
	List<HistoryUserYearInfoRO> yearInfos;

}
