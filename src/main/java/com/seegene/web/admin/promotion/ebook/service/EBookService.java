package com.seegene.web.admin.promotion.ebook.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.seegene.web.admin.code.vo.CodeSlaveRO;
import com.seegene.web.admin.promotion.ebook.vo.*;
import com.seegene.web.admin.promotion.vo.PromotionVO;
import org.apache.http.client.ClientProtocolException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.seegene.web.admin.code.service.CodeService;
import com.seegene.web.admin.log.edit.service.LogEditService;
import com.seegene.web.admin.util.service.AdminUtilService;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.FileComponent;
import com.seegene.web.common.SearchPaggingCommonPO;
import com.seegene.web.common.SessionUtil;
import com.seegene.web.repository.mariadb.EBookMapper;

@Service
@Transactional
public class EBookService {
	
	@Autowired
	private EBookMapper mapper;

	@Autowired
	private CodeService codeService;
	
	@Autowired
	private FileComponent fileComponent;
	
	@Autowired
	private LogEditService logEditService;
	
	@Autowired
	private AdminUtilService adminUtilService;
	
	private final String FILE_PATH = "ebook";
	
	
	private EBookVO findEBookBySeq(final int seq){
		return mapper.findEBookBySeq(seq);
	}


	public List<CodeSlaveRO> getCategorys(){
		return codeService.findSlaveByMaster("ebookCat");
	}
	/**
	 * @param param 검색조건
	 * @return 검색조건에 해당하는 리스트
	 */
	public CommonListReuslt<EBookListRO> findEBookList(final EBookSearchPO param) {
		
		param.setMybatisPagging();
		List<EBookListRO> list = mapper.findEBookList(param);
		int count = mapper.countEBookList(param);
		
		CommonListReuslt<EBookListRO> result = new CommonListReuslt<>(list, count, param);
		
		return result;
	}

	/**
	 * @return 전자책 등록시 사용할 기본 데이터
	 */
	public EBookAddDefaultRO getAddEbookDefaultInfo() {
		
		EBookAddDefaultRO item = new EBookAddDefaultRO();
		item.setLangCodes(codeService.findLangCode());
		item.setCategoryCodes(getCategorys());

		return item;
	}
	/**
	 * @return 전자책 수정시 사용할 기본 데이터
	 */
	public EBookEditDefaultRO getAddEbookDefaultInfo(final String lang, final String category) {

		EBookEditDefaultRO item = new EBookEditDefaultRO();
		item.setLangCodes(codeService.findLangCode());
		item.setCategoryCodes(getCategorys());
		item.setMaxPrintOrder(this.maxPrintOrder(lang, category));

		return item;
	}



	public int addeBook(final EBookAddPO param, final MultipartFile[] thumFile, final HttpServletRequest req) throws IOException, InterruptedException {
		
		String filePath = fileComponent.writeImageThumFile(FILE_PATH, thumFile[0], 210, 296);
		
		EBookVO item = new EBookVO();
		
		item.setCodeLangType(param.getCodeLang());
		item.setCodeCategoryType(param.getCategory());
		item.setTitle(param.getTitle());
		item.setUrl(param.getUrl());
		item.setThumFilePath(filePath);
		item.setRegUserId(SessionUtil.getAuthUserId());
		item.setPrintOrder(param.getPrintOrder());


		this.updateEBookOrder(item.getPrintOrder(), item.getCodeLangType(), item.getCodeCategoryType(), true, req);

		
		mapper.addEBook(item);
		
		EBookVO afterData = this.findEBookBySeq(item.getSeq());
		
		logEditService.insertAddLog(req, afterData);
		
		adminUtilService.reloadServer();
		
		return item.getSeq();
	}

	public EBookViewRO findEbookInfo(final int seq) throws IOException {
		
		
		EBookViewRO item = mapper.findEBookViewBySeq(seq);
		if(item != null){
			item.setThumFileContent(fileComponent.getImageToBase64(FILE_PATH + File.separator + item.getThumFilePath()));
		}
		
		return item;
	}

	public boolean deleteeBook(final int seq, final HttpServletRequest req) throws ClientProtocolException, IOException {
		
		EBookVO beforeData = this.findEBookBySeq(seq);
		
		EBookVO param = new EBookVO();
		param.setSeq(seq);
		param.setEditUserId(SessionUtil.getAuthUserId());
		
		mapper.deleteEBook(param);
		
		
		EBookVO afterData = this.findEBookBySeq(seq);
		logEditService.insertEditLog(req, beforeData, afterData);

		this.updateEBookOrder(beforeData.getPrintOrder(), beforeData.getCodeLangType(), beforeData.getCodeCategoryType(), false, req);

		adminUtilService.reloadServer();
		
		return true;
	}

	public boolean editeBook(final EBookEditPO param, final MultipartFile[] thumFile, final HttpServletRequest req) throws IOException, InterruptedException {
		EBookVO beforeData = this.findEBookBySeq(param.getSeq());

		if(!beforeData.getCodeLangType().equals(param.getCodeLang())
				|| !beforeData.getCodeCategoryType().equals(param.getCategory())
				|| beforeData.getPrintOrder() != param.getPrintOrder()){
			//언어 코드가 변경 되거나 출력 순서가 변경된 경우
			this.updateEBookOrder(beforeData.getPrintOrder(), beforeData.getCodeLangType(), beforeData.getCodeCategoryType(), false, req);
			this.updateEBookOrder(param.getPrintOrder(), param.getCodeLang(), param.getCategory(), true, req);
		}

		EBookVO editParam = new EBookVO();
		editParam.setSeq(param.getSeq());
		editParam.setCodeLangType(param.getCodeLang());
		editParam.setCodeCategoryType(param.getCategory());
		editParam.setTitle(param.getTitle());
		editParam.setUrl(param.getUrl());
		editParam.setPrintOrder(param.getPrintOrder());
		if(thumFile.length > 0){
			editParam.setThumFilePath(fileComponent.writeImageThumFile(FILE_PATH, thumFile[0], 248, 350));
		}else{
			editParam.setThumFilePath(beforeData.getThumFilePath());
			
		}
		
		editParam.setEditUserId(SessionUtil.getAuthUserId());


		mapper.editEBook(editParam);
		
		
		EBookVO afterData = this.findEBookBySeq(param.getSeq());
		logEditService.insertEditLog(req, beforeData, afterData);
		adminUtilService.reloadServer();
		return true;
	}

	public int maxPrintOrder(final String lang, final String category) {

		EBookVO param = new EBookVO();
		param.setCodeLangType(lang);
		param.setCodeCategoryType(category);


		return mapper.maxPrintOrder(param);
	}

	/**
	 * @param printOrder 변경될 출력 순번들
	 * @param incFlag 증가 감소 여부 증가 true, 감소 false
	 * @PAram req req
	 */
	private void updateEBookOrder(final int printOrder, final String langCode, final String category,  final boolean incFlag, final HttpServletRequest req){

		EBookVO item = new EBookVO();
		item.setPrintOrder(printOrder);
		item.setCodeLangType(langCode);
		item.setCodeCategoryType(category);
		item.setEditUserId(SessionUtil.getAuthUserId());

		List<EBookVO> beforeData = mapper.checkEBookOrder(item);

		if(beforeData.size() > 0){
			if(incFlag){
				mapper.updateEBookOrderInc(item);
			}else{
				mapper.updateEBookOrderDec(item);
			}

			List<EBookVO> afterData = mapper.checkEBookOrder(item);

			//로그 기록
			logEditService.insertEditLog(req, beforeData, afterData);
		}

	}
}
