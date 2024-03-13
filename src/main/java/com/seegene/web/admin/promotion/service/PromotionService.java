package com.seegene.web.admin.promotion.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.jcodec.api.JCodecException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.seegene.web.admin.code.service.CodeService;
import com.seegene.web.admin.log.edit.service.LogEditService;
import com.seegene.web.admin.promotion.vo.PromotionAddDefaultRO;
import com.seegene.web.admin.promotion.vo.PromotionAddPO;
import com.seegene.web.admin.promotion.vo.PromotionAddRO;
import com.seegene.web.admin.promotion.vo.PromotionEditDefaultRO;
import com.seegene.web.admin.promotion.vo.PromotionEditPO;
import com.seegene.web.admin.promotion.vo.PromotionListRO;
import com.seegene.web.admin.promotion.vo.PromotionVO;
import com.seegene.web.admin.promotion.vo.PromotionViewRO;
import com.seegene.web.admin.promotion.vo.SearchPromotionPO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.FileComponent;
import com.seegene.web.common.SessionUtil;
import com.seegene.web.repository.mariadb.PromotionMapper;

@Service
@Transactional
public class PromotionService {
	
	@Autowired
	private PromotionMapper mapper;
	
	@Autowired
	private CodeService codeService;
	
	@Autowired
	private FileComponent fileComponent;
	
	@Autowired
	private LogEditService logEditService;
	
	private final String FILE_PATH = "promotion";

	
	private PromotionVO findPromotionBySeq(final int seq){
		return mapper.findPromotionBySeq(seq);
	}
	
	/**
	 * @param param 검색 조건
	 * @return 리스트
	 */
	public CommonListReuslt<PromotionListRO> findPromotionList(final SearchPromotionPO param) {
		
		param.setMybatisPagging();
		List<PromotionListRO> list = mapper.findPromotionList(param);
		int count = mapper.countPromotionList(param);
		
		CommonListReuslt<PromotionListRO> result = new CommonListReuslt<>(list, count, param);
		
		return result;
	}

	/**
	 * @param promotionType 프로모션 상세 조회
	 * @param seq seq
	 * @return 프로모션 영상 정보
	 * @throws IOException 
	 */
	public PromotionViewRO findPromotionInfo(final String promotionType, final int seq) throws IOException {
		
		PromotionVO param = new PromotionVO();
		param.setCodePromotionType(promotionType);
		param.setSeq(seq);
		
		PromotionViewRO result = mapper.findPromotionViewBySeq(param);
		if(StringUtils.isNotEmpty(result.getThumFilePath())){
			result.setThumFileContent(fileComponent.getImageToBase64(FILE_PATH + File.separator + result.getThumFilePath()));
		}
		
		
		return result;
	}

	/**
	 * @return 홍보 정보 기본 입력
	 */
	public PromotionAddDefaultRO getAddPromotionDefaultInfo() {
		
		PromotionAddDefaultRO item = new PromotionAddDefaultRO();
		item.setLangCodes(codeService.findLangCode());
		
		return item;
	}

	/**
	 * @param promotionType 홍보 종류
	 * @param lang 언어코드
	 * @return 총 갯수
	 */
	public int maxPrintOrder(final String promotionType, final String lang) {
		PromotionVO param = new PromotionVO();
		param.setCodePromotionType(promotionType);
		param.setCodeLangType(lang);
		
		return mapper.maxPrintOrder(param);
	}
	/**
	 * @param printOrder 변경될 출력 순번들
	 * @param incFlag 증가 감소 여부 증가 true, 감소 false
	 * @PAram req req
	 */
	private void updatePromotionOrder(final int printOrder, final String langCode, final String type,  final boolean incFlag, final HttpServletRequest req){
		
		PromotionVO item = new PromotionVO();
		item.setPrintOrder(printOrder);
		item.setCodeLangType(langCode);
		item.setCodePromotionType(type);
		item.setEditUserId(SessionUtil.getAuthUserId());
		
		List<PromotionVO> beforeData = mapper.checkPromotionOrder(item);
		
		if(beforeData.size() > 0){
			if(incFlag){
				mapper.updatePromotionOrderInc(item);
			}else{
				mapper.updatePromotionOrderDec(item);
			}
			
			List<PromotionVO> afterData = mapper.checkPromotionOrder(item);
			
			//로그 기록
			logEditService.insertEditLog(req, beforeData, afterData);
		}
		
	}
	/**
	 * @param promotionType 홍보 종류
	 * @param param 등록 정보
	 * @param file 동영상 파일
	 * @param thum 섬네일 파일
	 * @param req req
	 * @return seq
	 * @throws IOException 
	 * @throws JCodecException 
	 */
	public PromotionAddRO addPromotion(final String promotionType,final PromotionAddPO param, final MultipartFile[] file,final MultipartFile[] thum,
			final HttpServletRequest req) throws IOException, JCodecException {
		
		PromotionAddRO result = new PromotionAddRO();
		result.setStateCode(1);
		
		PromotionVO item = new PromotionVO();
		item.setCodeLangType(param.getCodeLang());
		item.setCodePromotionType(promotionType);
		item.setTitle(param.getTitle());
		if(StringUtils.isNotEmpty(param.getSubTitle())){
			item.setSubTitle(param.getSubTitle());
		}
		if(StringUtils.isNotEmpty(param.getUrl())){
			item.setUrl(param.getUrl());
			item.setThumFilePath(fileComponent.writeFile(FILE_PATH, thum[0]));
		}else{
			item.setFilePath(fileComponent.writeFile(FILE_PATH, file[0]));
			item.setFileName(file[0].getOriginalFilename());
			
			if(thum.length > 0){
				item.setThumFilePath(fileComponent.writeFile(FILE_PATH, thum[0]));
			}else{
				try{
					item.setThumFilePath(fileComponent.getVideoThum(item.getFilePath(), FILE_PATH, 366, 282));
				}catch(Exception e){
					result.setStateCode(-7);
					item.setThumFilePath("");
				}
			}
		}
		item.setPrintOrder(param.getPrintOrder());
		item.setPrintFlag(param.getPrintFlag());
		item.setRegUserId(SessionUtil.getAuthUserId());
		
		this.updatePromotionOrder(item.getPrintOrder(), item.getCodeLangType(), item.getCodePromotionType(), true, req);
		
		mapper.addPromotion(item);
		
		PromotionVO afterData = findPromotionBySeq(item.getSeq());
		
		logEditService.insertAddLog(req, afterData);
		
		result.setSeq(item.getSeq());
		
		return result;
	}

	/**
	 * @param seq 식별자
	 * @param type 프로모션 타입
	 * @param req req
	 * @param res res
	 */
	public void streamPromotion(final int seq, final String type, final HttpServletRequest req, final HttpServletResponse res) {
		PromotionVO param = new PromotionVO();
		param.setSeq(seq);
		param.setCodePromotionType(type);
		
		String filePath = mapper.findPromotionFileBySeq(param);
		
		if(StringUtils.isNotEmpty(filePath)){
			fileComponent.getVideo(FILE_PATH + File.separator + filePath, req, res);
		}
		
	}

	/**
	 * @param seq 식별자
	 * @param promotionType 프로모션 종류
	 * @param req req
	 * @return 삭제 성ㅇ공 여부
	 */
	public boolean deletePromotion(final int seq, final String promotionType, final HttpServletRequest req) {
		PromotionVO beforeData = this.findPromotionBySeq(seq);
		PromotionVO item = new PromotionVO();
		item.setSeq(seq);
		item.setCodePromotionType(promotionType);
		item.setEditUserId(SessionUtil.getAuthUserId());
		
		mapper.deletePromotion(item);
		
		PromotionVO afterData = this.findPromotionBySeq(seq);
		
		logEditService.insertEditLog(req, beforeData, afterData);
		
		this.updatePromotionOrder(beforeData.getPrintOrder(), beforeData.getCodeLangType(), promotionType, false, req);
		
		return true;
	}

	/**
	 * @param promotion 프로모션 정보
	 * @param promotionType 프로모션 타입
	 * @return 수정 기본 정보
	 */
	public PromotionEditDefaultRO getEditPromotionDefaultInfo(final PromotionViewRO promotion,final  String promotionType) {
		
		PromotionEditDefaultRO item = new PromotionEditDefaultRO();
		
		item.setLangCodes(codeService.findLangCode());
		item.setMaxPrintOrder(this.maxPrintOrder(promotionType, promotion.getCodeLangType()));
		
		return item;
	}

	/**
	 * @param promotionType 타입
	 * @param param 수정정보
	 * @param file 동영상 파일
	 * @param thum 섬네일 파일
	 * @param req req
	 * @return 수정 성공 여부 -7시 섬네일 생성 오류
	 * @throws JCodecException 
	 */
	public int editPromotion(final String promotionType, final PromotionEditPO param, final MultipartFile[] file,
			final MultipartFile[] thum, final HttpServletRequest req) throws IOException, JCodecException{
		
		int result = 1;
		
		PromotionVO beforeData = this.findPromotionBySeq(param.getSeq());
		
		if(!beforeData.getCodeLangType().equals(param.getCodeLang()) || beforeData.getPrintOrder() != param.getPrintOrder()){
			//언어 코드가 변경 되거나 출력 순서가 변경된 경우
			this.updatePromotionOrder(beforeData.getPrintOrder(), beforeData.getCodeLangType(), promotionType, false, req);
			this.updatePromotionOrder(param.getPrintOrder(), param.getCodeLang(), promotionType, true, req);
		}
		
		
		PromotionVO item = new PromotionVO();
		item.setSeq(param.getSeq());
		item.setCodeLangType(param.getCodeLang());
		item.setCodePromotionType(promotionType);
		item.setTitle(param.getTitle());
		if(StringUtils.isNotEmpty(param.getSubTitle())){
			item.setSubTitle(param.getSubTitle());
		}
		item.setPrintOrder(param.getPrintOrder());
		item.setPrintFlag(param.getPrintFlag());
		item.setEditUserId(SessionUtil.getAuthUserId());
		
		if(StringUtils.isEmpty(beforeData.getUrl())){
			//동영상 파일 모드일 경우
			if(file.length > 0){
				item.setFilePath(fileComponent.writeFile(FILE_PATH, file[0]));
				item.setFileName(file[0].getOriginalFilename());
				if(thum.length == 0){
					try{
						item.setThumFilePath(fileComponent.getVideoThum(item.getFilePath(), FILE_PATH, 366, 282));
					}catch(Exception e){
						item.setThumFilePath("");
						result = -7;
					}
				}else{
					item.setThumFilePath(fileComponent.writeFile(FILE_PATH, thum[0]));
				}
			}else{
				item.setFilePath(beforeData.getFilePath());
				item.setFileName(beforeData.getFileName());
			}
		}else{
			//url 모드일 경우
			item.setUrl(param.getUrl());
		}
		
		if(thum.length > 0 && StringUtils.isEmpty(item.getThumFilePath())){
			item.setThumFilePath(fileComponent.writeFile(FILE_PATH, thum[0]));
		}else if(thum.length == 0 && StringUtils.isEmpty(item.getThumFilePath())){
			item.setThumFilePath(beforeData.getThumFilePath());
		}
		
		
		mapper.editPromotion(item);
		
		PromotionVO afterData = this.findPromotionBySeq(param.getSeq());
		
		logEditService.insertEditLog(req, beforeData, afterData);
		
		return result;
	}
}

