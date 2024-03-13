package com.seegene.web.admin.log.error.service;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.seegene.web.admin.log.error.vo.LogErrorListRO;
import com.seegene.web.admin.log.error.vo.LogErrorRemovePO;
import com.seegene.web.admin.log.error.vo.LogErrorSearchPO;
import com.seegene.web.admin.log.error.vo.LogErrorVO;
import com.seegene.web.admin.log.error.vo.LogErrorViewRO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.DateUtil;
import com.seegene.web.common.FileComponent;
import com.seegene.web.common.IpUtil;
import com.seegene.web.common.RequestUtil;
import com.seegene.web.common.SessionUtil;
import com.seegene.web.repository.mariadb.ErrorLogMapper;
import com.seegene.web.user.menu.service.UserMenuService;

@Service
public class LogErrorService {

	@Autowired
	private ErrorLogMapper mapper;
	
	@Autowired
	private UserMenuService userMenuService;
	
	@Autowired
	private FileComponent fileComponent;
	
	
	public void addErrorLog(final HttpServletRequest req, final Exception ex){
		
		LogErrorVO item = new LogErrorVO();
		item.setUrl(req.getRequestURI());
		try{
			item.setMenuName(SessionUtil.getNowMenuName(item.getUrl()));
		}catch(Exception e){
			
			try{
				item.setMenuName(userMenuService.getUrl2Name("ko", item.getUrl()));
			}catch(Exception e2){
				item.setMenuName("");
			}
		}
		
		Gson gson = new Gson();
		item.setParamJson(gson.toJson(RequestUtil.convertMap(req)));
		item.setErrorMsg(ex.getMessage());
		if(SessionUtil.isLogin()){
			item.setRegUserId(SessionUtil.getAuthUserId());
		}else{
		}
		item.setIp(IpUtil.getRequestIp(req));
		
		mapper.insertErrorLog(item);
		
	}
	
	
	public CommonListReuslt<LogErrorListRO> findErrorLogList(final LogErrorSearchPO param) {
		param.setMybatisPagging();
		if(StringUtils.isNotEmpty(param.getEndDate())){
			Date endDate = DateUtil.getDate(param.getEndDate());
			param.setEndDate(DateUtil.getFormatString(DateUtil.addHour(endDate, 24)));
		}
		
		List<LogErrorListRO> list = mapper.findErrorLogList(param);
		int count = mapper.countErrorLogList(param);
		
		CommonListReuslt<LogErrorListRO> result = new CommonListReuslt<>(list, count, param);
		
		return result;
	}

	public void excelErrorLogList(final LogErrorSearchPO param, final HttpServletRequest req, final HttpServletResponse res) throws IOException {
		if(StringUtils.isNotEmpty(param.getEndDate())){
			Date endDate = DateUtil.getDate(param.getEndDate());
			param.setEndDate(DateUtil.getFormatString(DateUtil.addHour(endDate, 24)));
		}
//		
		List<LogErrorViewRO> list = mapper.findDownloadErrorLogList(param);
		
		// 워크북 생성
		try (XSSFWorkbook workbook = new XSSFWorkbook();) {
			// 워크시트 생성
			XSSFSheet sheet = workbook.createSheet();

			// 셀 카운트
			int cellCount = 0;
			int rowCount = 0;

			// 행 생성
			XSSFRow row = sheet.createRow(rowCount++);
			// 쎌 생성
			XSSFCell cell;

			// 헤더 폰트
			Font headerFont = workbook.createFont();
			headerFont.setBold(true);

			// 해더 스타일
			CellStyle headerStyle = workbook.createCellStyle();
			headerStyle.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
			headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
			headerStyle.setFont(headerFont);
			headerStyle.setAlignment(HorizontalAlignment.CENTER);
			headerStyle.setVerticalAlignment(VerticalAlignment.CENTER);
			headerStyle.setBorderTop(BorderStyle.THIN);
			headerStyle.setBorderLeft(BorderStyle.THIN);
			headerStyle.setBorderRight(BorderStyle.THIN);
			headerStyle.setBorderBottom(BorderStyle.THIN);
			
			CellStyle normalStyle = workbook.createCellStyle();
			normalStyle.setBorderTop(BorderStyle.THIN);
			normalStyle.setBorderLeft(BorderStyle.THIN);
			normalStyle.setBorderRight(BorderStyle.THIN);
			normalStyle.setBorderBottom(BorderStyle.THIN);

			//헤더 생성
			cell = row.createCell(cellCount++);
			cell.setCellValue("로그 식별자");
			cell.setCellStyle(headerStyle);
			
			cell = row.createCell(cellCount++);
			cell.setCellValue("URL");
			cell.setCellStyle(headerStyle);
			
			cell = row.createCell(cellCount++);
			cell.setCellValue("메뉴명");
			cell.setCellStyle(headerStyle);
			
			cell = row.createCell(cellCount++);
			cell.setCellValue("에러 메시지");
			cell.setCellStyle(headerStyle);
			
			cell = row.createCell(cellCount++);
			cell.setCellValue("파라미터");
			cell.setCellStyle(headerStyle);
			
			cell = row.createCell(cellCount++);
			cell.setCellValue("사용자 ID");
			cell.setCellStyle(headerStyle);
			
			cell = row.createCell(cellCount++);
			cell.setCellValue("사용자 이름");
			cell.setCellStyle(headerStyle);
			
			cell = row.createCell(cellCount++);
			cell.setCellValue("IP");
			cell.setCellStyle(headerStyle);
			
			cell = row.createCell(cellCount++);
			cell.setCellValue("에러 일시");
			cell.setCellStyle(headerStyle);
			
			
			for(LogErrorViewRO item :list){
				// 행 생성
				row = sheet.createRow(rowCount++);
				
				// 셀 카운트
				cellCount = 0;

				cell = row.createCell(cellCount++);
				cell.setCellValue(item.getSeq());
				cell.setCellStyle(normalStyle);
				
				cell = row.createCell(cellCount++);
				cell.setCellValue(item.getUrl());
				cell.setCellStyle(normalStyle);
				
				cell = row.createCell(cellCount++);
				cell.setCellValue(item.getMenuName());
				cell.setCellStyle(normalStyle);
				
				if(StringUtils.isNotEmpty(item.getErrorMsg())){
					cell = row.createCell(cellCount++);
					if(item.getErrorMsg().length() < 32767){
						cell.setCellValue(item.getErrorMsg());
					}else{
//								cell.setCellValue(StringUtils.substring(item.getErrorMsg(), 0, 32700));
						cell.setCellValue("데이터 길이가 깁니다");
					}
					cell.setCellStyle(normalStyle);
				}else{
					cell = row.createCell(cellCount++);
					cell.setCellValue("");
					cell.setCellStyle(normalStyle);
					
				}
				
				if(StringUtils.isNotEmpty(item.getParamJson())){
					cell = row.createCell(cellCount++);
					if(item.getParamJson().length() < 32767){
						cell.setCellValue(item.getParamJson());
					}else{
//								cell.setCellValue(StringUtils.substring(item.getParamJson(), 0, 32700));
						cell.setCellValue("데이터 길이가 깁니다");
					}
					cell.setCellStyle(normalStyle);
				}else{
					cell = row.createCell(cellCount++);
					cell.setCellValue("");
					cell.setCellStyle(normalStyle);
					
				}
				
				
				if(StringUtils.isNotEmpty(item.getRegUserId())){
					cell = row.createCell(cellCount++);
					cell.setCellValue(item.getRegUserId());
					cell.setCellStyle(normalStyle);
				}else{
					cell = row.createCell(cellCount++);
					cell.setCellValue("");
					cell.setCellStyle(normalStyle);
					
				}
				
				if(StringUtils.isNotEmpty(item.getRegUserName())){
					cell = row.createCell(cellCount++);
					cell.setCellValue(item.getRegUserName());
					cell.setCellStyle(normalStyle);
				}else{
					cell = row.createCell(cellCount++);
					cell.setCellValue("");
					cell.setCellStyle(normalStyle);
					
				}
				
				
				cell = row.createCell(cellCount++);
				cell.setCellValue(item.getIp());
				cell.setCellStyle(normalStyle);
				
				
				cell = row.createCell(cellCount++);
				cell.setCellValue(DateUtil.getFormatStringDateTime(item.getRegDate()));
				cell.setCellStyle(normalStyle);
				
			}
			
			for (int i = 0; i < 9; i++) {
				sheet.autoSizeColumn(i);
				// 시트 자리수 에러로 인한 처리
				sheet.setColumnWidth(i, ((sheet.getColumnWidth(i) + (short) 512) > 25000) ? 25000
						: (sheet.getColumnWidth(i) + (short) 512));
			}
			
			res.setContentType("application/octet-stream");

			String fileName = "에러_로그_"+param.getStartDate()+"-"+param.getEndDate() + ".xlsx";
			// 파일명 한글 관련 처리
			String fileHeader = fileComponent.getFileDownHeader(req, fileName);
			res.setHeader("Content-Disposition", fileHeader);

			workbook.write(res.getOutputStream());
		
		}
	}

	public LogErrorViewRO findErrorLogView(final long seq) {
		
		return mapper.findErrorLogView(seq);
	}
	
	public boolean deleteLog(final long seq) {
		mapper.deleteLogError(seq);
		return true;
	}


	public int deleteLogs(final LogErrorRemovePO param) {
		if(StringUtils.isNotEmpty(param.getEndDate())){
			Date endDate = DateUtil.getDate(param.getEndDate());
			param.setEndDate(DateUtil.getFormatString(DateUtil.addHour(endDate, 24)));
		}
		int deleteCount = mapper.deleteCount(param);
		mapper.deleteLogErrors(param);
		return deleteCount;
	}


	
	
}
