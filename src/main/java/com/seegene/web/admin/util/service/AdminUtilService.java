package com.seegene.web.admin.util.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.client.ClientProtocolException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.multipart.MultipartFile;

import com.seegene.web.admin.user.service.AdminUserService;
import com.seegene.web.admin.user.vo.EditMyInfoPO;
import com.seegene.web.common.FileComponent;
import com.seegene.web.common.HttpSendUtil;

/**
 * 관리자 웹 유틸 서비스
 */
@Service
public class AdminUtilService {

	@Autowired
	private FileComponent fileComponent;
	
	@Autowired
	private AdminUserService adminUserService;
	
	@Value("#{'${reload.servers}'.split(',')}")
	private String[] servers;
	

	public List<String> pdf2Image(final MultipartFile file) throws IOException {
		
		return fileComponent.pdfToBase64Img(fileComponent.getTempFileFolder(), file);
	}
	
	public void reloadServer() throws ClientProtocolException, IOException{
		
		for(String server: servers){
			HttpSendUtil.doGet(server+"/reload/server.do");
		}
		
	}
	
	public int editMyInfo( final EditMyInfoPO param, final HttpServletRequest req){
		
		return adminUserService.editMyInfo(param, req);
	}

	
	
}
