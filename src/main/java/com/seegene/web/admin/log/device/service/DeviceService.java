package com.seegene.web.admin.log.device.service;

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
import org.springframework.transaction.annotation.Transactional;

import com.seegene.web.admin.log.access.vo.LogStatisPO;
import com.seegene.web.admin.log.device.vo.LogDeviceInfoListRO;
import com.seegene.web.admin.log.device.vo.LogDeviceInfoVO;
import com.seegene.web.admin.log.device.vo.LogDeviceRemovePO;
import com.seegene.web.admin.log.device.vo.LogDeviceSearchPO;
import com.seegene.web.admin.log.device.vo.LogDeviceStaticsRO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.DateUtil;
import com.seegene.web.common.FileComponent;
import com.seegene.web.common.IpUtil;
import com.seegene.web.common.RequestUtil;
import com.seegene.web.common.SessionUtil;
import com.seegene.web.repository.mariadb.DeviceLogMapper;
import com.seegene.web.user.main.vo.DevicePO;

import lombok.extern.log4j.Log4j;


@Log4j
@Service
@Transactional
public class DeviceService {

	@Autowired
	private DeviceLogMapper mapper;

	@Autowired
	private FileComponent fileComponent;

	/** 스케줄러 작동 확인용 */
	@Value("${scheduler.hostname}")
	private String SCHEDULER_HOSTNAME;

	public void addDeviceLog(final DevicePO param, final HttpServletRequest req) {

		LogDeviceInfoVO item = new LogDeviceInfoVO();
		item.setScreenWidth(param.getWidth());
		item.setScreenHeight(param.getHeight());
		item.setOs(RequestUtil.getClientOS(req));
		item.setBrowser(RequestUtil.getClientBrowser(req));
		item.setIp(IpUtil.getRequestIp(req));
		if (SessionUtil.isLogin()) {
			item.setRegUserId(SessionUtil.getAuthUserId());
		} else {
			item.setRegUserId("");
		}

		mapper.insertDeviceLog(item);

	}

	public CommonListReuslt<LogDeviceInfoListRO> findDeviceLogList(final LogDeviceSearchPO param) {

		param.setMybatisPagging();

		if (StringUtils.isNotEmpty(param.getEndDate())) {
			Date endDate = DateUtil.getDate(param.getEndDate());
			param.setEndDate(DateUtil.getFormatString(DateUtil.addHour(endDate, 24)));
		}

		List<LogDeviceInfoListRO> list = mapper.findDeviceLogList(param);
		int count = mapper.countDeviceLogList(param);

		CommonListReuslt<LogDeviceInfoListRO> result = new CommonListReuslt<>(list, count, param);

		return result;

	}

	public void excelDeviceLogList(final LogDeviceSearchPO param, final HttpServletRequest req,
			final HttpServletResponse res) throws IOException {
		if (StringUtils.isNotEmpty(param.getEndDate())) {
			Date endDate = DateUtil.getDate(param.getEndDate());
			param.setEndDate(DateUtil.getFormatString(DateUtil.addHour(endDate, 24)));
		}

		List<LogDeviceInfoVO> list = mapper.findDownloadDeviceLogList(param);

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

			// 헤더 생성
			cell = row.createCell(cellCount++);
			cell.setCellValue("로그 식별자");
			cell.setCellStyle(headerStyle);

			cell = row.createCell(cellCount++);
			cell.setCellValue("OS");
			cell.setCellStyle(headerStyle);

			cell = row.createCell(cellCount++);
			cell.setCellValue("브라우져");
			cell.setCellStyle(headerStyle);

			cell = row.createCell(cellCount++);
			cell.setCellValue("해상도 X");
			cell.setCellStyle(headerStyle);

			cell = row.createCell(cellCount++);
			cell.setCellValue("해상도 Y");
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

			for (LogDeviceInfoVO item : list) {
				// 행 생성
				row = sheet.createRow(rowCount++);

				// 셀 카운트
				cellCount = 0;

				cell = row.createCell(cellCount++);
				cell.setCellValue(item.getSeq());
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
				cell.setCellValue(item.getIp());
				cell.setCellStyle(normalStyle);

				cell = row.createCell(cellCount++);
				if (StringUtils.isNotEmpty(item.getRegUserId())) {
					cell.setCellValue(item.getRegUserId());
				} else {
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

			String fileName = "접속_디바이스_로그_" + param.getStartDate() + "-" + param.getEndDate() + ".xlsx";
			// 파일명 한글 관련 처리
			String fileHeader = fileComponent.getFileDownHeader(req, fileName);
			res.setHeader("Content-Disposition", fileHeader);

			workbook.write(res.getOutputStream());

		}

	}

	public int deleteLogs(final LogDeviceRemovePO param) {
		if (StringUtils.isNotEmpty(param.getEndDate())) {
			Date endDate = DateUtil.getDate(param.getEndDate());
			param.setEndDate(DateUtil.getFormatString(DateUtil.addHour(endDate, 24)));
		}

		int deleteCount = mapper.deleteCount(param);
		mapper.deleteLogDevice(param);
		return deleteCount;
	}

	/**
	 * 디바이스로그 집계 테이블에 입력 매일 0시 1분 0초에 실행
	 */
	@Scheduled(cron = "0 1 0 * * *")
	public void insertTotalDeviceLog() {

		if (!IpUtil.getServerHostName().equals(SCHEDULER_HOSTNAME)) {
			return;
		}
		// 접속로그 집계 테이블에 입력
		log.debug("---------------------------------------");
		log.debug("로그 집계 시작");
		mapper.insertTotalDeviceLog();
		log.debug("---------------------------------------");
	}

	public List<LogDeviceStaticsRO> deviceStaticData(final LogStatisPO param) {
		return mapper.deviceStaticData(param);
	}

	public List<LogDeviceStaticsRO> deviceStaticDataExcel(final LogStatisPO param) {
		return mapper.deviceStaticDataExcel(param);
	}

}
