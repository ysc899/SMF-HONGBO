package com.seegene.web.user.promotion.service;

import java.io.File;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.FileComponent;
import com.seegene.web.repository.mariadb.PromotionMapper;
import com.seegene.web.user.promotion.vo.PromotionSearchPO;
import com.seegene.web.user.promotion.vo.PromotionUserListRO;

@Service
public class PromotionUserService {
	
	@Autowired
	private PromotionMapper mapper;
	
//	@Autowired
//	private UserCodeService userCodeService;
	
	@Autowired
	private FileComponent fileComponent;
	
	private final String FILE_PATH = "promotion";
	
//	/**
//	 * @param langCode 언어코드
//	 * @return 화면에 필요한 기본 데이터
//	 */
//	public WebzineDefaultRO getDefaultData(final String langCode){
//		
//		WebzineDefaultRO item = new WebzineDefaultRO();
//		item.setEbookCatCodes(userCodeService.findCodeList("ebookCat", langCode));
//		
//		return item;
//	}

	public CommonListReuslt<PromotionUserListRO> findPromotionMoreList(final PromotionSearchPO param, final Locale locale) {
		param.setLimit(12);
		param.setCodeLangType(locale.getLanguage());
		param.setMybatisPagging();
		
		List<PromotionUserListRO> list = mapper.findUserPromotionList(param);
		
		list.forEach(t ->{
			try{
				t.setThumFileContent(fileComponent.getImageToBase64(FILE_PATH+File.separator+t.getThumFilePath()));
			}catch(Exception e){
				t.setThumFileContent("");
			}
			
			t.setThumFilePath("");
		});
		
		int count = mapper.countUserPromotionList(param);
		
		CommonListReuslt<PromotionUserListRO> result = new CommonListReuslt<>(list, count, param);
		
		return result;
	}
	
	public CommonListReuslt<PromotionUserListRO> findMainSearchPromotionList(final PromotionSearchPO param, final Locale locale) {
		param.setLimit(3);
		param.setCodeLangType(locale.getLanguage());
		param.setMybatisPagging();
		
		List<PromotionUserListRO> list = mapper.findUserMainSearchPromotionList(param);
		
		list.forEach(t ->{
			try{
				t.setThumFileContent(fileComponent.getImageToBase64(FILE_PATH+File.separator+t.getThumFilePath()));
			}catch(Exception e){
				t.setThumFileContent("");
			}
			
			t.setThumFilePath("");
		});
		
		int count = mapper.countUserMainSearchPromotionList(param);
		
		CommonListReuslt<PromotionUserListRO> result = new CommonListReuslt<>(list, count, param);
		
		return result;
	}
	

	public void streamPromotion(final int seq, final HttpServletRequest req, final HttpServletResponse res) {
		
		String filePath = mapper.findUserPromotionFileBySeq(seq);
		
		if(StringUtils.isNotEmpty(filePath)){
			fileComponent.getVideo(FILE_PATH + File.separator + filePath, req, res);
		}
		
	}
	

	
}
