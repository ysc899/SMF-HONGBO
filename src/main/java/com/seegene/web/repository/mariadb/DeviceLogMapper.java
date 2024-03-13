package com.seegene.web.repository.mariadb;

import java.util.List;

import com.seegene.web.admin.log.access.vo.LogStatisPO;
import com.seegene.web.admin.log.device.vo.LogDeviceInfoListRO;
import com.seegene.web.admin.log.device.vo.LogDeviceInfoVO;
import com.seegene.web.admin.log.device.vo.LogDeviceRemovePO;
import com.seegene.web.admin.log.device.vo.LogDeviceSearchPO;
import com.seegene.web.admin.log.device.vo.LogDeviceStaticsRO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * 디바이스 로그 맵퍼
 */
@Mapper()
public interface DeviceLogMapper {
	
	/**
	 * @param param 디바이스 로그 추가
	 */
	void insertDeviceLog(LogDeviceInfoVO param);

	/**
	 * 디바이스 로그 집계
	 */
	void insertTotalDeviceLog();
	
	List<LogDeviceInfoListRO> findDeviceLogList(LogDeviceSearchPO param);
	
	int countDeviceLogList(LogDeviceSearchPO param);
	
	List<LogDeviceInfoVO> findDownloadDeviceLogList(LogDeviceSearchPO param);
	
	int deleteCount(LogDeviceRemovePO param);
	void deleteLogDevice(LogDeviceRemovePO param);
	
	List<LogDeviceStaticsRO> deviceStaticData(LogStatisPO param);
	
	List<LogDeviceStaticsRO> deviceStaticDataExcel(LogStatisPO param);
}
