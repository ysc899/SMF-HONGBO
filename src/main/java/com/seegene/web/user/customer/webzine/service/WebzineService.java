package com.seegene.web.user.customer.webzine.service;

import java.io.File;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.FileComponent;
import com.seegene.web.repository.mariadb.EBookMapper;
import com.seegene.web.user.code.service.UserCodeService;
import com.seegene.web.user.customer.webzine.vo.WebzineDefaultRO;
import com.seegene.web.user.customer.webzine.vo.WebzineListRO;
import com.seegene.web.user.customer.webzine.vo.WebzineSearchPO;

@Service
public class WebzineService {
	
	@Autowired
	private EBookMapper mapper;
	
	@Autowired
	private UserCodeService userCodeService;
	
	@Autowired
	private FileComponent fileComponent;
	
	private final String FILE_PATH = "ebook";
	
	/**
	 * @param langCode 언어코드
	 * @return 화면에 필요한 기본 데이터
	 */
	public WebzineDefaultRO getDefaultData(final String langCode){
		
		WebzineDefaultRO item = new WebzineDefaultRO();
		item.setEbookCatCodes(userCodeService.findCodeList("ebookCat", langCode));
		
		return item;
	}

	public CommonListReuslt<WebzineListRO> findWebzineInfoMoreList(final WebzineSearchPO param, final Locale locale) {
		param.setLimit(12);
		param.setCodeLangType(locale.getLanguage());
		param.setMybatisPagging();
		
		System.out.println("#################### codeEbookCatType " + param.getCodeEbookCatType());
		
		List<WebzineListRO> list = mapper.findUserEBookList(param);
		
		list.forEach(t ->{
			try{
				t.setThumFileContent(fileComponent.getImageToBase64(FILE_PATH+File.separator+t.getThumFilePath()));
			}catch(Exception e){
				t.setThumFileContent("");
			}
			
			t.setThumFilePath("");
		});
		
		int count = mapper.countUserEBookList(param);
		
		CommonListReuslt<WebzineListRO> result = new CommonListReuslt<>(list, count, param);
		
		return result;
	}

	public List<WebzineListRO> findMainWebzineInfoMoreList( final String lang) {
		WebzineSearchPO param = new WebzineSearchPO();
		param.setLimit(6);
		param.setCodeLangType(lang);
		param.setMybatisPagging();
		
		return mapper.findUserEBookMainList(param);
	}
	
	public CommonListReuslt<WebzineListRO> findWebzineInfoMainSearch(final WebzineSearchPO param, final Locale locale) {
		param.setCodeLangType(locale.getLanguage());
		param.setMybatisPagging();
		
		List<WebzineListRO> list = mapper.findUserMainSearchEBookList(param);
		
		
		int count = mapper.countUserMainSearchEBookList(param);
		
		CommonListReuslt<WebzineListRO> result = new CommonListReuslt<>(list, count, param);
		
		return result;
	}
	
	
	public List<WebzineListRO> webzine_en_list( final String lang) {
		WebzineSearchPO param = new WebzineSearchPO();
		System.out.println("######### service");
		return mapper.webzine_en_list(param);
	}
	
	
}
