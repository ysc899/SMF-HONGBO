package com.seegene.web.user.task.request.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seegene.web.admin.inspection.request.vo.InspectionRequestVO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.FileComponent;
import com.seegene.web.common.UserSearchPaggingCommonPO;
import com.seegene.web.repository.mariadb.InspectionRequestMapper;
import com.seegene.web.user.task.request.vo.RequestDataRO;
import com.seegene.web.user.task.request.vo.RequestListRO;

@Service
public class RequestUserService {
	
	

	@Autowired
	private InspectionRequestMapper mapper;
//	
//	@Autowired
//	private InspectionTestService inspectionTestService;
//	
	@Autowired
	private FileComponent fileComponent;
	
	private final String FILE_PATH = "InspectionRequest";
	
	/**
	 * @param langCode 언어코드
	 * @return 화면에 필요한 기본 데이터
	 */
	public RequestListRO findRequestList(final String langCode, final UserSearchPaggingCommonPO param){
		
		param.setCodeLangType(langCode);
		
		List<RequestDataRO> list = mapper.findUserRequestList(param);
		
		
		RequestListRO result = new RequestListRO();
		
		result.setThumList(list.stream().filter(t ->{return t.getThumFlag().equals("Y");}).sorted().collect(Collectors.toList()));
		result.setNormalList(list.stream().filter(t ->{return t.getThumFlag().equals("N");}).sorted().collect(Collectors.toList()));
		
		result.getThumList().forEach(t ->{
			
			try {
				t.setThumFileContent(fileComponent.getImageToBase64(FILE_PATH + File.separator + t.getThumFilePath()));
			} catch (IOException e) {
				t.setThumFileContent("");
			}
			
		});
		
		
		return result;
	}
	/**
	 * @param langCode 언어코드
	 * @return 화면에 필요한 기본 데이터
	 */
	public CommonListReuslt<RequestDataRO> findRequestMainSearchList(final String langCode, final UserSearchPaggingCommonPO param){
		
		param.setCodeLangType(langCode);
		param.setMybatisPagging();

		
		List<RequestDataRO> list = mapper.findUserMainSearchRequestList(param);
		
		int count = mapper.countUserMainSearchRequestList(param);
		
		CommonListReuslt<RequestDataRO> result = new CommonListReuslt<>(list, count, param);

		return result;
	}

	public void downloadRequestFile(final int seq, final HttpServletRequest request, final HttpServletResponse response) {
		
		InspectionRequestVO result = mapper.findRequestFileInfoBySeq(seq);
		
		if(result != null){
			fileComponent.downloadFile(FILE_PATH, result.getFilePath(), result.getFileName(), request, response);
		}
		
	}

	public void viewRequestFile(final int seq, final HttpServletRequest request, final HttpServletResponse response) {
		InspectionRequestVO result = mapper.findRequestFileInfoBySeq(seq);
		
		if(result != null){
			fileComponent.viewPdfFile(FILE_PATH, result.getFilePath(), result.getFileName(), request, response);
		}
		
	}

	public void thumRequestFile(final int seq, final HttpServletRequest request, final HttpServletResponse response) {
		InspectionRequestVO result = mapper.findUserThumFileInfoBySeq(seq);
		if(result != null && result.getThumFlag().equals("Y") && StringUtils.isNotEmpty(result.getThumFilePath())){
			fileComponent.downloadFile(FILE_PATH, result.getThumFilePath(), result.getThumFilePath(), request, response);
		}
	}
	public String base64RequestFile(int seq, HttpServletRequest request, HttpServletResponse response) throws IOException {
		InspectionRequestVO result = mapper.findUserThumFileInfoBySeq(seq);
		
		return fileComponent.getImageToBase64(FILE_PATH + File.separator + result.getThumFilePath());
		
	}

	
	
}
