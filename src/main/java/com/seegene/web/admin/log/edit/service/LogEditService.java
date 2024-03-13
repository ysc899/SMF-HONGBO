package com.seegene.web.admin.log.edit.service;

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
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.seegene.web.admin.log.edit.vo.LogEditListRO;
import com.seegene.web.admin.log.edit.vo.LogEditRemovePO;
import com.seegene.web.admin.log.edit.vo.LogEditSearchPO;
import com.seegene.web.admin.log.edit.vo.LogEditVO;
import com.seegene.web.admin.log.edit.vo.LogEditViewRO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.DateUtil;
import com.seegene.web.common.FileComponent;
import com.seegene.web.common.IpUtil;
import com.seegene.web.common.SessionUtil;
import com.seegene.web.repository.mariadb.EditLogMapper;

@Service
@Transactional
public class LogEditService {

	@Autowired
	private EditLogMapper logMapper;
	
	@Autowired
	private FileComponent fileComponent;
	
	private Gson gson = new Gson();
	
	
	/**
	 * @param req 리퀘스트
	 * @param obj 추가되는 오브젝트
	 */
	public void insertAddLog(final HttpServletRequest req, final Object obj){
		
		LogEditVO item = setAfterData(req, obj);
		
		if(item != null){
			logMapper.insertAddLog(item);
		}
		
	}

	
	/**
	 * @param req 리퀘스트
	 * @param before 이전 데이터
	 * @param after 수정 후 데이터
	 */
	public void insertEditLog(final HttpServletRequest req,final Object before, final Object after){
		LogEditVO item = setAfterData(req, after);
		
		if(item != null){
			item.setBeforeJson(gson.toJson(before));
			
			logMapper.insertEditLog(item);
		}
	}
	

	/**
	 * @param req 리퀘스트
	 * @param obj 이후 데이터
	 * @return 로그 등록할 vo
	 */
	private LogEditVO setAfterData(final HttpServletRequest req, final Object obj) {
		if(gson == null){
			gson = new Gson();
		}
		
		String url = req.getRequestURI();
		String nowMenuName = SessionUtil.getNowMenuName(url);
		
		String className = "";
		
		if(obj.getClass().getSimpleName().equals("ArrayList")){
			
			@SuppressWarnings("unchecked")
			List<Object> checkList = (List<Object>) obj;
			if(checkList.size() > 0){
				className = checkList.get(0).getClass().getName();
			}else{
				return null;
			}
			
		}else{
			className = obj.getClass().getName();
		}
		
		LogEditVO item = new LogEditVO();
		item.setAfterJson(gson.toJson(obj));
		item.setIp(IpUtil.getRequestIp(req));
		item.setMenuName(nowMenuName);
		item.setClassName(className);
		item.setEditUserId(SessionUtil.getAuthUserId());
		return item;
	}


	public CommonListReuslt<LogEditListRO> findEditLogList(final LogEditSearchPO param) {
		param.setMybatisPagging();
		
		if(StringUtils.isNotEmpty(param.getEndDate())){
			Date endDate = DateUtil.getDate(param.getEndDate());
			param.setEndDate(DateUtil.getFormatString(DateUtil.addHour(endDate, 24)));
		}
		
		List<LogEditListRO> list = logMapper.findEditLogList(param);
		int count = logMapper.countEditLogList(param);
		
		CommonListReuslt<LogEditListRO> result = new CommonListReuslt<>(list, count, param);
		
		return result;
	}

	public void excelEditLogList(final LogEditSearchPO param, final HttpServletRequest req, final HttpServletResponse res) throws IOException {
		if(StringUtils.isNotEmpty(param.getEndDate())){
			Date endDate = DateUtil.getDate(param.getEndDate());
			param.setEndDate(DateUtil.getFormatString(DateUtil.addHour(endDate, 24)));
		}
		
		List<LogEditViewRO> list = logMapper.findDownloadEditLogList(param);
		
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
			cell.setCellValue("메뉴명");
			cell.setCellStyle(headerStyle);
			
			cell = row.createCell(cellCount++);
			cell.setCellValue("종류");
			cell.setCellStyle(headerStyle);
			
			cell = row.createCell(cellCount++);
			cell.setCellValue("클래스 명");
			cell.setCellStyle(headerStyle);
			
			cell = row.createCell(cellCount++);
			cell.setCellValue("수정전 내용");
			cell.setCellStyle(headerStyle);
			
			cell = row.createCell(cellCount++);
			cell.setCellValue("수정후 내용");
			cell.setCellStyle(headerStyle);
			
			cell = row.createCell(cellCount++);
			cell.setCellValue("수정자 ID");
			cell.setCellStyle(headerStyle);
			
			cell = row.createCell(cellCount++);
			cell.setCellValue("수정자 이름");
			cell.setCellStyle(headerStyle);
			
			cell = row.createCell(cellCount++);
			cell.setCellValue("IP");
			cell.setCellStyle(headerStyle);
			
			cell = row.createCell(cellCount++);
			cell.setCellValue("수정 일시");
			cell.setCellStyle(headerStyle);
			
			
			for(LogEditViewRO item :list){
				// 행 생성
				row = sheet.createRow(rowCount++);
				
				// 셀 카운트
				cellCount = 0;

				cell = row.createCell(cellCount++);
				cell.setCellValue(item.getSeq());
				cell.setCellStyle(normalStyle);
				
				cell = row.createCell(cellCount++);
				cell.setCellValue(item.getMenuName());
				cell.setCellStyle(normalStyle);
				
				if(item.getLogType().equals("edit")){
					cell = row.createCell(cellCount++);
					cell.setCellValue("수정");
					cell.setCellStyle(normalStyle);
				}else{
					cell = row.createCell(cellCount++);
					cell.setCellValue("추가");
					cell.setCellStyle(normalStyle);
				}
				
				cell = row.createCell(cellCount++);
				cell.setCellValue(item.getClassName());
				cell.setCellStyle(normalStyle);
				
				if(StringUtils.isNotEmpty(item.getBeforeJson())){
					cell = row.createCell(cellCount++);
					if(item.getBeforeJson().length() < 32767){
						cell.setCellValue(item.getBeforeJson());
					}else{
//						cell.setCellValue(StringUtils.substring(item.getBeforeJson(), 0, 32700));
						cell.setCellValue("데이터 길이가 깁니다");
					}
					cell.setCellStyle(normalStyle);
				}else{
					cell = row.createCell(cellCount++);
					cell.setCellValue("");
					cell.setCellStyle(normalStyle);
					
				}
				
				cell = row.createCell(cellCount++);
				if(item.getAfterJson().length() < 32767){
					cell.setCellValue(item.getAfterJson());
				}else{
//					cell.setCellValue(StringUtils.substring(item.getAfterJson(), 0, 32700));
					cell.setCellValue("데이터 길이가 깁니다");
				}
				cell.setCellStyle(normalStyle);
				
				cell = row.createCell(cellCount++);
				cell.setCellValue(item.getEditUserId());
				cell.setCellStyle(normalStyle);
				
				cell = row.createCell(cellCount++);
				cell.setCellValue(item.getEditUserName());
				cell.setCellStyle(normalStyle);
				
				
				cell = row.createCell(cellCount++);
				cell.setCellValue(item.getIp());
				cell.setCellStyle(normalStyle);
				
				
				cell = row.createCell(cellCount++);
				cell.setCellValue(DateUtil.getFormatStringDateTime(item.getEditDate()));
				cell.setCellStyle(normalStyle);
				
			}
			
			for (int i = 0; i < 10; i++) {
				sheet.autoSizeColumn(i);
				// 시트 자리수 에러로 인한 처리
				sheet.setColumnWidth(i, ((sheet.getColumnWidth(i) + (short) 512) > 25000) ? 25000
						: (sheet.getColumnWidth(i) + (short) 512));
			}
			
			res.setContentType("application/octet-stream");

			String fileName = "수정_로그_"+param.getStartDate()+"-"+param.getEndDate() + ".xlsx";
			// 파일명 한글 관련 처리
			String fileHeader = fileComponent.getFileDownHeader(req, fileName);
			res.setHeader("Content-Disposition", fileHeader);

			workbook.write(res.getOutputStream());
		
		}
		
	}

	public LogEditViewRO findEditLogView(final long seq) {
		
		return logMapper.findEditLogView(seq);
	}


	public boolean deleteLog(final long seq) {
		logMapper.deleteLogEdit(seq);
		return true;
	}


	public int deleteLogs(final LogEditRemovePO param) {
		if(StringUtils.isNotEmpty(param.getEndDate())){
			Date endDate = DateUtil.getDate(param.getEndDate());
			param.setEndDate(DateUtil.getFormatString(DateUtil.addHour(endDate, 24)));
		}
		
		int deleteCount = logMapper.deleteCount(param);
		logMapper.deleteLogEdits(param);
		return deleteCount;
	}


	
	
}
