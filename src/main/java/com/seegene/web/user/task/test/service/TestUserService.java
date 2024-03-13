package com.seegene.web.user.task.test.service;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.seegene.web.admin.inspection.test.service.InspectionTestService;
import com.seegene.web.admin.inspection.test.vo.InspectionTestListDefaultRO;
import com.seegene.web.admin.inspection.test.vo.InspectionTestSearchOption;
import com.seegene.web.admin.inspection.test.vo.MWT001R2ViewRO;
import com.seegene.web.user.task.test.vo.TestSearchOption;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

@Service
public class TestUserService {

	@Autowired
	private InspectionTestService inspectionTestService;

	
//	@Autowired
//	private UserCodeService userCodeService;
	
	
	/**
	 * @param langCode 언어코드
	 * @return 화면에 필요한 기본 데이터
	 */
	public InspectionTestListDefaultRO getDefaultData(final String langCode){

		if(langCode.equals("ko")){
			return inspectionTestService.listSearchOption();
		}else{
			return inspectionTestService.listSearchOptionEn();
		}
	}


	public String getTestDataList(final TestSearchOption param, final String language, final HttpServletRequest request) {
		
		String result = "";
		
		
		if(param.getSearchFlag().equals("N")){
			return result;
		}
		
		InspectionTestSearchOption searchParam = new InspectionTestSearchOption();
		
		if(param.getDissClss() != null && param.getDissClss().length > 0){
			searchParam.setDissClsOption(String.join("|", param.getDissClss()));
		}
		
		searchParam.setSearchKeyword(param.getSearchKeyword());
		searchParam.setTestInfoOption(param.getTestInfoOption());
		searchParam.setMediClsOption(param.getMediClsOption());
		
		if(StringUtils.isNotEmpty(param.getSearchAlp())){
			searchParam.setSearchAlp(param.getSearchAlp());
		}

		
		if(language.equals("ko")){
			searchParam.setLocale("ko");
			result = inspectionTestService.findInspectionTestKrList(searchParam, request);
		}else{
			searchParam.setLocale("en");
			result = inspectionTestService.findInspectionTestKrList(searchParam, request);
		}
		
		

		return result;
	}


	public MWT001R2ViewRO getTestDataView(final String seq, final String language, final HttpServletRequest request) throws IOException, WriterException {

		MWT001R2ViewRO result = inspectionTestService.findInspectionTestView(seq, language, request);

		if (!StringUtils.isNotEmpty(result.getT001url())) {
			//생성은 350으로 생성하고 html에서는 64,128등 사이즈를 고정해서 쓴다.
			try {
				result.setT001urlqr(generateQRCodeImage(result.getT001url(), 350, 350));
			} catch (Exception e) {
				result.setT001urlqr("");
			}
		}
		return result;
	}

	// QR코드 생성
	private static String generateQRCodeImage(String text, int width, int height)
			throws WriterException, IOException {
		QRCodeWriter qrCodeWriter = new QRCodeWriter();
		Map<EncodeHintType, Object> hints = new HashMap<>();
		hints.put(EncodeHintType.MARGIN, 0);
		hints.put(EncodeHintType.CHARACTER_SET, StandardCharsets.UTF_8.name());
		BitMatrix bitMatrix = qrCodeWriter.encode(text, BarcodeFormat.QR_CODE, width, height, hints);

		ByteArrayOutputStream pngOutputStream = new ByteArrayOutputStream();
		MatrixToImageWriter.writeToStream(bitMatrix, "PNG", pngOutputStream);
		byte[] pngData = pngOutputStream.toByteArray();

		String base64Encoded = Base64.getEncoder().encodeToString(pngData);
		return base64Encoded;
	}
}

