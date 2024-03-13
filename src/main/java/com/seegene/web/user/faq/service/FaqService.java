package com.seegene.web.user.faq.service;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seegene.web.admin.faq.integrated.vo.BoardFaQSlaveVO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.SearchIntegrateSearchPaggingPO;
import com.seegene.web.repository.mariadb.FaqIntegratedMapper;
import com.seegene.web.user.board.integrated.vo.BoardListRO;
import com.seegene.web.user.code.service.UserCodeService;
import com.seegene.web.user.faq.vo.FaqUserListRO;
import com.seegene.web.user.faq.vo.FaqUserListViewRO;

@Service
public class FaqService {
	
	@Autowired
	private FaqIntegratedMapper mapper;
	
	@Autowired
	private UserCodeService codeService;

	public FaqUserListViewRO findFaqList(final int masterSeq, final Locale locale) {
		
		BoardFaQSlaveVO param = new BoardFaQSlaveVO();
		param.setBoardFaqMasterSeq(masterSeq);
		
		
		List<String> categorys = mapper.findUserFaqIntegratedCategory(param);
		
		List<FaqUserListRO> faqList = mapper.findUserFaqIntegratedList(param);
		
		FaqUserListViewRO result = new FaqUserListViewRO();
		result.setCodes(codeService.findCodeList("FAQ", categorys, locale.getLanguage()));
		result.setFaqList(faqList);
		
		return result;
	}
	
	public CommonListReuslt<FaqUserListRO> findMainSearchFaqList(final SearchIntegrateSearchPaggingPO param) {
		param.setLimit(3);
		param.setMybatisPagging();
		
		List<FaqUserListRO> content = mapper.findMainSearchFaqIntegratedList(param);
		
		int count = mapper.countMainSearchFaqIntegratedList(param);
		
		CommonListReuslt<FaqUserListRO> result = new CommonListReuslt<>(content, count, param);
		
		return result;
	}
	
	/**
	 * @param language 언어
	 * @return 언어에 해당하는 모든 faq 마스터 seq
	 */
	public List<Integer> findLanguageFaqs(final String language){
		return mapper.findLanguageFaqs(language);
	}
}
