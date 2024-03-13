package com.seegene.web.admin.log.access.service;

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
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.seegene.web.admin.log.access.vo.LogAccessDownloadListRO;
import com.seegene.web.admin.log.access.vo.LogAccessListRO;
import com.seegene.web.admin.log.access.vo.LogAccessRemovePO;
import com.seegene.web.admin.log.access.vo.LogAccessSearchPO;
import com.seegene.web.admin.log.access.vo.LogAccessVO;
import com.seegene.web.admin.log.access.vo.LogMenuStatisRO;
import com.seegene.web.admin.log.access.vo.LogStatisPO;
import com.seegene.web.admin.log.access.vo.LogUserStatisRO;
import com.seegene.web.admin.log.access.vo.LogUserYearStatisExcelRO;
import com.seegene.web.admin.log.access.vo.LogUserYearStatisRO;
import com.seegene.web.admin.log.device.service.DeviceService;
import com.seegene.web.admin.log.device.vo.LogDeviceStaticsRO;
import com.seegene.web.admin.menu.user.vo.MenuVO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.DateUtil;
import com.seegene.web.common.FileComponent;
import com.seegene.web.common.IpUtil;
import com.seegene.web.common.SessionUtil;
import com.seegene.web.repository.mariadb.AccessLogMapper;
import com.seegene.web.user.menu.service.UserMenuService;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class LogAccessService {
	
	@Autowired
	private UserMenuService userMenuService;
	
	@Autowired
	private DeviceService deviceService;
	
	@Autowired
	private FileComponent fileComponent;
	
	@Autowired
	private AccessLogMapper mapper;
	
	/** 스케줄러 작동 확인용 */
	@Value("${scheduler.hostname}")
	private String SCHEDULER_HOSTNAME;
	
	
	public void writeLog(final HttpServletRequest request, final String langCode){
		
		String url = request.getRequestURI();
		
		MenuVO menu = userMenuService.getUrl2Menu(langCode, url);
		if(menu != null){
			
			LogAccessVO item = new LogAccessVO();
			item.setMenuSeq(menu.getSeq());
			item.setIp(IpUtil.getRequestIp(request));
			if(SessionUtil.isLogin()){
				item.setUserId(SessionUtil.getAuthUserId());
			}
			
			mapper.insertAccessLog(item);
			
		}
		
		
	}
	
	
	public CommonListReuslt<LogAccessListRO> findAccessLogList(final LogAccessSearchPO param) {
		param.setMybatisPagging();
		
		if(StringUtils.isNotEmpty(param.getEndDate())){
			Date endDate = DateUtil.getDate(param.getEndDate());
			param.setEndDate(DateUtil.getFormatString(DateUtil.addHour(endDate, 24)));
		}
		
		List<LogAccessListRO> list = mapper.findAccessLogList(param);
		int count = mapper.countAccessLogList(param);
		
		CommonListReuslt<LogAccessListRO> result = new CommonListReuslt<>(list, count, param);
		
		return result;
	}
	
	public void excelAccessLogList(final LogAccessSearchPO param, final HttpServletRequest req, final HttpServletResponse res) throws IOException {
		
		if(StringUtils.isNotEmpty(param.getEndDate())){
			Date endDate = DateUtil.getDate(param.getEndDate());
			param.setEndDate(DateUtil.getFormatString(DateUtil.addHour(endDate, 24)));
		}
		
		List<LogAccessDownloadListRO> list = mapper.findDownloadAccessLogList(param);
		
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
			cell.setCellValue("메뉴 식별자");
			cell.setCellStyle(headerStyle);
			
			cell = row.createCell(cellCount++);
			cell.setCellValue("메뉴 명");
			cell.setCellStyle(headerStyle);
			
			cell = row.createCell(cellCount++);
			cell.setCellValue("접근 IP");
			cell.setCellStyle(headerStyle);
			
			cell = row.createCell(cellCount++);
			cell.setCellValue("사용자 ID");
			cell.setCellStyle(headerStyle);
			
			cell = row.createCell(cellCount++);
			cell.setCellValue("접속 일시");
			cell.setCellStyle(headerStyle);
			
			
			for(LogAccessDownloadListRO item :list){
				// 행 생성
				row = sheet.createRow(rowCount++);
				
				// 셀 카운트
				cellCount = 0;

				cell = row.createCell(cellCount++);
				cell.setCellValue(item.getSeq());
				cell.setCellStyle(normalStyle);
				
				cell = row.createCell(cellCount++);
				cell.setCellValue(item.getMenuSeq());
				cell.setCellStyle(normalStyle);
				
				cell = row.createCell(cellCount++);
				cell.setCellValue(item.getMenuName());
				cell.setCellStyle(normalStyle);
				
				cell = row.createCell(cellCount++);
				cell.setCellValue(item.getIp());
				cell.setCellStyle(normalStyle);
				
				cell = row.createCell(cellCount++);
				if(StringUtils.isNotEmpty(item.getUserId())){
					cell.setCellValue(item.getUserId());
				}else{
					cell.setCellValue("");
				}
				cell.setCellStyle(normalStyle);
				
				cell = row.createCell(cellCount++);
				cell.setCellValue(DateUtil.getFormatStringDateTime(item.getRegDate()));
				cell.setCellStyle(normalStyle);
				
				
				
			}
			
			for (int i = 0; i < 6; i++) {
				sheet.autoSizeColumn(i);
				// 시트 자리수 에러로 인한 처리
				sheet.setColumnWidth(i, ((sheet.getColumnWidth(i) + (short) 512) > 25000) ? 25000
						: (sheet.getColumnWidth(i) + (short) 512));
			}
			
			res.setContentType("application/octet-stream");

			String fileName = "접속로그_"+param.getStartDate()+"-"+param.getEndDate() + ".xlsx";
			// 파일명 한글 관련 처리
			String fileHeader = fileComponent.getFileDownHeader(req, fileName);
			res.setHeader("Content-Disposition", fileHeader);

			workbook.write(res.getOutputStream());
		
		}
		
		
	}

	
	
	public int deleteLogs(final LogAccessRemovePO param) {
		
		if(StringUtils.isNotEmpty(param.getEndDate())){
			Date endDate = DateUtil.getDate(param.getEndDate());
			param.setEndDate(DateUtil.getFormatString(DateUtil.addHour(endDate, 24)));
		}
		
		int deleteCount = mapper.deleteCount(param);
		mapper.deleteLogAccesss(param);
		return deleteCount;
	}
	
	/**
	 * 접속로그 집계 테이블에 입력
	 * 매일 0시 1분 0초에 실행
	 */
	@Scheduled(cron = "0 1 0 * * *")
	public void insertTotalAccessLog(){
		
		if(!IpUtil.getServerHostName().equals(SCHEDULER_HOSTNAME)){
			return;
		}
		//접속로그 집계 테이블에 입력
		log.debug("---------------------------------------");
		log.debug("로그 집계 시작");
		mapper.insertTotalAccessLog();
		log.debug("---------------------------------------");
	}


	public List<LogUserStatisRO> userStaticData(final LogStatisPO param) {
		
		param.setStartDate(DateUtil.getFormatString(DateUtil.getDate(param.getStartDate()),"yyyyMMdd"));
		param.setEndDate(DateUtil.getFormatString(DateUtil.getDate(param.getEndDate()),"yyyyMMdd"));
		
		List<LogUserStatisRO> result = mapper.userStaticData(param);
		return result;
	}
	
	public List<LogUserYearStatisRO> userYearStaticData(final LogStatisPO param) {
		
		List<LogUserYearStatisRO> result = mapper.userYearStaticData(param);
		
		return result;
	}
	
	public void userYearStaticDataExcel(final LogStatisPO param, final HttpServletRequest req, final HttpServletResponse res) throws IOException {
		param.setStartDate(DateUtil.getFormatString(DateUtil.getDate(param.getStartDate()),"yyyyMMdd"));
		param.setEndDate(DateUtil.getFormatString(DateUtil.getDate(param.getEndDate()),"yyyyMMdd"));
		
		List<LogUserYearStatisExcelRO> excelData = mapper.userYearStaticExcelData(param);
		
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
			cell.setCellValue("접속 일");
			cell.setCellStyle(headerStyle);
			
			cell = row.createCell(cellCount++);
			cell.setCellValue("사용자 ID");
			cell.setCellStyle(headerStyle);
			
			cell = row.createCell(cellCount++);
			cell.setCellValue("사용자 종류");
			cell.setCellStyle(headerStyle);
			
			cell = row.createCell(cellCount++);
			cell.setCellValue("접속 수");
			cell.setCellStyle(headerStyle);
			
			
			for(LogUserYearStatisExcelRO item :excelData){
				// 행 생성
				row = sheet.createRow(rowCount++);
				
				// 셀 카운트
				cellCount = 0;

				cell = row.createCell(cellCount++);
				cell.setCellValue(item.getLogYmd());
				cell.setCellStyle(normalStyle);
				
				cell = row.createCell(cellCount++);
				if(StringUtils.isNotEmpty(item.getUserId())){
					cell.setCellValue(item.getUserId());
				}else{
					cell.setCellValue("");
				}
				cell.setCellStyle(normalStyle);
				
				
				cell = row.createCell(cellCount++);
				cell.setCellValue(item.getUserType());
				cell.setCellStyle(normalStyle);
				
				
				cell = row.createCell(cellCount++);
				cell.setCellValue(item.getCnt());
				cell.setCellStyle(normalStyle);
				
			}
			
			for (int i = 0; i < 4; i++) {
				sheet.autoSizeColumn(i);
				// 시트 자리수 에러로 인한 처리
				sheet.setColumnWidth(i, ((sheet.getColumnWidth(i) + (short) 512) > 25000) ? 25000
						: (sheet.getColumnWidth(i) + (short) 512));
			}
			
			res.setContentType("application/octet-stream");

			String fileName = "사용자_접속_통계_"+param.getStartDate()+"-"+param.getEndDate() + ".xlsx";
			// 파일명 한글 관련 처리
			String fileHeader = fileComponent.getFileDownHeader(req, fileName);
			res.setHeader("Content-Disposition", fileHeader);

			workbook.write(res.getOutputStream());
		
		}
	}


	public List<LogMenuStatisRO> menuStaticData(final LogStatisPO param) {
		param.setStartDate(DateUtil.getFormatString(DateUtil.getDate(param.getStartDate()),"yyyyMMdd"));
		List<LogMenuStatisRO> result = mapper.menuStaticData(param);
		return result;
	}


	public void menuStaticExcel(final LogStatisPO param, final HttpServletRequest req, final HttpServletResponse res) throws IOException {
		param.setStartDate(DateUtil.getFormatString(DateUtil.getDate(param.getStartDate()),"yyyyMMdd"));
		param.setEndDate(DateUtil.getFormatString(DateUtil.getDate(param.getEndDate()),"yyyyMMdd"));
		
		List<LogMenuStatisRO> excelData = mapper.menuStaticExcelData(param);
		
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
			cell.setCellValue("접속 일");
			cell.setCellStyle(headerStyle);
			
			cell = row.createCell(cellCount++);
			cell.setCellValue("메뉴명");
			cell.setCellStyle(headerStyle);
			
			cell = row.createCell(cellCount++);
			cell.setCellValue("접속 수");
			cell.setCellStyle(headerStyle);
			
			
			for(LogMenuStatisRO item :excelData){
				// 행 생성
				row = sheet.createRow(rowCount++);
				
				// 셀 카운트
				cellCount = 0;

				cell = row.createCell(cellCount++);
				if(StringUtils.isNotEmpty(item.getLogYmd())){
					cell.setCellValue(item.getLogYmd());
				}else{
					cell.setCellValue("-");
				}
				cell.setCellStyle(normalStyle);
				
				cell = row.createCell(cellCount++);
				cell.setCellValue(item.getMenuName());
				cell.setCellStyle(normalStyle);
				
				cell = row.createCell(cellCount++);
				cell.setCellValue(item.getCnt());
				cell.setCellStyle(normalStyle);
				
			}
			
			for (int i = 0; i < 3; i++) {
				sheet.autoSizeColumn(i);
				// 시트 자리수 에러로 인한 처리
				sheet.setColumnWidth(i, ((sheet.getColumnWidth(i) + (short) 512) > 25000) ? 25000
						: (sheet.getColumnWidth(i) + (short) 512));
			}
			
			res.setContentType("application/octet-stream");

			String fileName = "메뉴별_접속_통계_"+param.getStartDate()+"-"+param.getEndDate() + ".xlsx";
			// 파일명 한글 관련 처리
			String fileHeader = fileComponent.getFileDownHeader(req, fileName);
			res.setHeader("Content-Disposition", fileHeader);

			workbook.write(res.getOutputStream());
		
		}
	}

	public List<LogDeviceStaticsRO> deviceStaticData(final LogStatisPO param){
		param.setStartDate(DateUtil.getFormatString(DateUtil.getDate(param.getStartDate(), "yyyy-MM"),"yyyyMM"));
		return deviceService.deviceStaticData(param);
	}
	

	public void deviceStaticExcel(final LogStatisPO param, final HttpServletRequest req, final HttpServletResponse res) throws IOException {
		param.setStartDate(DateUtil.getFormatString(DateUtil.getDate(param.getStartDate()),"yyyyMMdd"));
		param.setEndDate(DateUtil.getFormatString(DateUtil.getDate(param.getEndDate()),"yyyyMMdd"));
		
		
		List<LogDeviceStaticsRO> deviceStatic = deviceService.deviceStaticDataExcel(param);
		
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
			cell.setCellValue("접속 일");
			cell.setCellStyle(headerStyle);
			
			cell = row.createCell(cellCount++);
			cell.setCellValue("OS");
			cell.setCellStyle(headerStyle);
			
			cell = row.createCell(cellCount++);
			cell.setCellValue("브라우져");
			cell.setCellStyle(headerStyle);
			
			cell = row.createCell(cellCount++);
			cell.setCellValue("해상도 x");
			cell.setCellStyle(headerStyle);
			
			cell = row.createCell(cellCount++);
			cell.setCellValue("해상도 y");
			cell.setCellStyle(headerStyle);
			
			cell = row.createCell(cellCount++);
			cell.setCellValue("접속 수");
			cell.setCellStyle(headerStyle);
			
			for(LogDeviceStaticsRO item :deviceStatic){
				// 행 생성
				row = sheet.createRow(rowCount++);
				
				// 셀 카운트
				cellCount = 0;

				cell = row.createCell(cellCount++);
				cell.setCellValue(item.getLogYmd());
				cell.setCellStyle(normalStyle);
				
				cell = row.createCell(cellCount++);
				cell.setCellValue(item.getOs());
				cell.setCellStyle(normalStyle);
				
				cell = row.createCell(cellCount++);
				cell.setCellValue(item.getBrowser());
				cell.setCellStyle(normalStyle);
				
				cell = row.createCell(cellCount++);
				cell.setCellValue(item.getScreenWidth());
				cell.setCellStyle(normalStyle);
				
				cell = row.createCell(cellCount++);
				cell.setCellValue(item.getScreenHeight());
				cell.setCellStyle(normalStyle);
				
				cell = row.createCell(cellCount++);
				cell.setCellValue(item.getAccessCount());
				cell.setCellStyle(normalStyle);
				
			}
			
			for (int i = 0; i < 6; i++) {
				sheet.autoSizeColumn(i);
				// 시트 자리수 에러로 인한 처리
				sheet.setColumnWidth(i, ((sheet.getColumnWidth(i) + (short) 512) > 25000) ? 25000
						: (sheet.getColumnWidth(i) + (short) 512));
			}
			
			res.setContentType("application/octet-stream");

			String fileName = "디바이스별_접속_통계_"+param.getStartDate()+"-"+param.getEndDate() + ".xlsx";
			// 파일명 한글 관련 처리
			String fileHeader = fileComponent.getFileDownHeader(req, fileName);
			res.setHeader("Content-Disposition", fileHeader);

			workbook.write(res.getOutputStream());
		
		}
	}


}
