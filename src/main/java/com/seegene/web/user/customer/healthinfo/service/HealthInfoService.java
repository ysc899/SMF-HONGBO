package com.seegene.web.user.customer.healthinfo.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seegene.web.admin.health.vo.HealthInfoVO;
import com.seegene.web.admin.inspection.test.service.InspectionTestService;
import com.seegene.web.admin.inspection.test.vo.MWT001R2ViewRO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.FileComponent;
import com.seegene.web.common.UserSearchPaggingCommonPO;
import com.seegene.web.repository.mariadb.HealthInfoMapper;
import com.seegene.web.user.customer.healthinfo.vo.HealthInfoTitleRO;
import com.seegene.web.user.customer.healthinfo.vo.HealthInfoUserListRO;
import com.seegene.web.user.customer.healthinfo.vo.HealthInfoUserNextPreRO;
import com.seegene.web.user.customer.healthinfo.vo.HealthInfoUserTestHardInfoPO;
import com.seegene.web.user.customer.healthinfo.vo.HealthInfoUserViewRO;

@Service
public class HealthInfoService {

	@Autowired
	private HealthInfoMapper mapper;
	
	@Autowired
	private InspectionTestService inspectionTestService;
	
	@Autowired
	private FileComponent fileComponent;
	
	/** 건강정보 파일 경로 */
	private final String FILE_PATH = "healthInfo";
	
	/**
	 * @param langCode 언어코드
	 * @return 화면에 필요한 기본 데이터
	 */
	public List<HealthInfoTitleRO> findAllInfoTitle(final String langCode){
		
		HealthInfoVO param = new HealthInfoVO();
		param.setCodeLangType(langCode);
		
		return mapper.findAllInfoTitle(param);
	}

	/**
	 * @param param 검색조건
	 * @param locale 언어코드
	 * @return
	 */
	public CommonListReuslt<HealthInfoUserListRO> findHealthInfoList(final UserSearchPaggingCommonPO param, final Locale locale) {
		
		
		List<HealthInfoUserListRO> content = this.findHealthInfoMoreList(param, locale.getLanguage());
		
		int count = mapper.countUserHelthInfoList(param);
		
		CommonListReuslt<HealthInfoUserListRO> result = new CommonListReuslt<>(content, count, param);
		
		return result;
	}
	
	/**
	 * @param param 검색 조건
	 * @param locale 언어정보
	 * @return
	 */
	public List<HealthInfoUserListRO> findHealthInfoMoreList(final UserSearchPaggingCommonPO param, final String locale) {
		
		param.setCodeLangType(locale);
		param.setMybatisPagging();
		
		List<HealthInfoUserListRO> content = mapper.findUserHelthInfoList(param);
		
		content.forEach(t ->{
			if(StringUtils.isNotEmpty(t.getImgTitleThumPath())){
				try {
					t.setImgTitleThumContent(fileComponent.getImageToBase64(FILE_PATH+File.separator+t.getImgTitleThumPath()));
				} catch (IOException e) {
					t.setImgTitleThumContent("");
				}
			}
		});
		
		return content;
	}
	
	
	/**
	 * @param seq 식별자
	 * @param language 언어코드
	 * @return
	 * @throws IOException 
	 */
	public HealthInfoUserViewRO findHealthInfoView(final int seq, final String language, final HttpServletRequest request) throws IOException {
		
		HealthInfoVO param = new HealthInfoVO();
		param.setSeq(seq);
		param.setCodeLangType(language);
		
		HealthInfoUserViewRO item = mapper.findUserHealthInfoViewBySeq(param);
		if(item == null){
			return null;
		}
		if(StringUtils.isNotEmpty(item.getImgContentPath())){
			item.setImgContent(fileComponent.getImageToBase64(FILE_PATH + File.separator + item.getImgContentPath()));
		}else{
			item.setImgContent("");
		}
		
		List<HealthInfoUserTestHardInfoPO> tests = mapper.findUserHealthTestViewByHealthSeq(seq).stream().sorted().collect(Collectors.toList());
		tests.stream().filter(t -> {return t.getHardFlag().equals("N");})
			.forEach(t->{
				MWT001R2ViewRO inspectionData = inspectionTestService.findInspectionTestView(t.getTestCode(), request);
				
				if(inspectionData != null){
					t.setTestName(inspectionData.getF010fkn());
					t.setSpecimen(inspectionData.getF010tnm());
//					t.setVolume("프로시져에 값이 없음;;");
					t.setTestMethod(inspectionData.getF010msnm());
					t.setTestDay(inspectionData.getT001day());
					t.setProcessDay(inspectionData.getF010eed() + "일");
				}
//				
			});
		item.setTests(tests);

		item.setSources(mapper.findUserHealthSourceViewByHealthSeq(seq));
		
		param.setPrintOrder(item.getPrintOrder());
		List<HealthInfoUserNextPreRO> nextPre = mapper.findUserHealthInfoNextPreBySeq(param);
		
		HealthInfoUserNextPreRO pre = nextPre.stream().filter(t ->{return t.getType().equals("pre");}).findFirst().orElse(null);
		if(pre == null){
			pre = new HealthInfoUserNextPreRO();
			pre.setSeq(0);
		}
		item.setPre(pre);
		
		HealthInfoUserNextPreRO next = nextPre.stream().filter(t ->{return t.getType().equals("next");}).findFirst().orElse(null);
		if(next == null){
			next = new HealthInfoUserNextPreRO();
			next.setSeq(0);
		}
		item.setNext(next);
		
		
		mapper.updateUserHealthInfoViewCount(seq);
		
		return item;
	}
	
	/**
	 * @param seq 건강정보 seq
	 * @param language 언어코드
	 * @param request req
	 * @param response res
	 */
	public void findHealthThumView(final int seq, final String language, final HttpServletRequest request, final HttpServletResponse response) {
		
		HealthInfoVO param = new HealthInfoVO();
		param.setSeq(seq);
		param.setCodeLangType(language);
		
		String thumFilePath = mapper.findUserHealthInfoThumBySeq(param);
		
		fileComponent.streamImageFile(FILE_PATH, thumFilePath, request, response);
	}
	
}
