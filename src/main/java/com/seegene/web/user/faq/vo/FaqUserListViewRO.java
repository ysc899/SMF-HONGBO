package com.seegene.web.user.faq.vo;

import java.util.List;

import com.seegene.web.user.code.vo.CodeRO;

import lombok.Data;

@Data
public class FaqUserListViewRO {
	
	/** 카테고리들 */
	private List<CodeRO> codes;
	/** faq 리스트 */
	private List<FaqUserListRO> faqList;
	
}
