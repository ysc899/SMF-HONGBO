package com.seegene.web.admin.board.recruit.vo;

import lombok.Data;

/** 채용 업무 수정용 po */
@Data
public class BoardRecruitTaskEditPO extends BoardRecruitTaskVO{

	/** 수정 여부 */
	private String editFlag;
	
}
