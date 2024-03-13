package com.seegene.web.admin.board.recruit.vo;

import java.util.List;

import lombok.Data;

/**
 * 채용 업부 삭제 처리용 po
 */
@Data
public class BoardRrecruitTaskDeletePO{

	/** 채용 seq */
	private int recruitSeq;
	
	/** 삭제될 seqs */
	private List<Integer> deleteSeqs;
	/** 수정자 ID */
	private String editUserId;
	
}
