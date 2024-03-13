package com.seegene.web.user.inspection.cert.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seegene.web.admin.status.certification.vo.CertificationVO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.FileComponent;
import com.seegene.web.repository.mariadb.CertificationMapper;
import com.seegene.web.user.code.service.UserCodeService;
import com.seegene.web.user.inspection.cert.vo.CertDefaultRO;
import com.seegene.web.user.inspection.cert.vo.CertListRO;
import com.seegene.web.user.inspection.cert.vo.CertSearchPO;

@Service
public class CertService {
	
	@Autowired
	private CertificationMapper mapper;
	
	@Autowired
	private UserCodeService userCodeService;
	
	@Autowired
	private FileComponent fileComponent;
	
	private final String FILE_PATH = "certification";
	
	/**
	 * @param langCode 언어코드
	 * @return 화면에 필요한 기본 데이터
	 */
	public CertDefaultRO getDefaultData(final String langCode){
		
		CertDefaultRO item = new CertDefaultRO();
		item.setCenterCodes(userCodeService.findCodeList("center", langCode));
		item.setCertCodes(userCodeService.findCodeList("cert", langCode));
		item.setCertLocCodes(userCodeService.findCodeList("certLoc", langCode));
		
		return item;
	}

	public CommonListReuslt<CertListRO> findCertInfoMoreList(final CertSearchPO param, final Locale locale) {
		param.setLimit(999);
		param.setCodeLangType(locale.getLanguage());
		param.setMybatisPagging();
		
		List<CertListRO> list = mapper.findUserCertificationList(param);
		
		list.forEach(t ->{
			try{
				t.setThumFileContent(fileComponent.getImageToBase64(FILE_PATH+File.separator+t.getThumFilePath()));
			}catch(Exception e){
				t.setThumFileContent("");
			}
			
			t.setThumFilePath("");
		});
		
		int count = mapper.countUserCertificationList(param);
		
		CommonListReuslt<CertListRO> result = new CommonListReuslt<>(list, count, param);
		
		return result;
	}

	public void downloadCert(final int seq, final HttpServletRequest request, final HttpServletResponse response) {
		
		CertificationVO item = mapper.findUserCertificationFileBySeq(seq);
		
		fileComponent.downloadFile(FILE_PATH, item.getFilePath(), item.getFileName(), request, response);
		
	}

	public String streamCert(final int seq) throws IOException {
		CertificationVO item = mapper.findUserCertificationFileBySeq(seq);
		
		return fileComponent.getImageToBase64(FILE_PATH + File.separator + item.getFilePath());
	}
	
	
}
