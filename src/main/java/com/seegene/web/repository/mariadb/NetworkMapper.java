package com.seegene.web.repository.mariadb;

import java.util.List;

import com.seegene.web.admin.status.certification.vo.CertificationVO;
import com.seegene.web.admin.status.network.vo.NetworkListRO;
import com.seegene.web.admin.status.network.vo.NetworkLocCountRO;
import com.seegene.web.admin.status.network.vo.NetworkMappingRO;
import com.seegene.web.admin.status.network.vo.NetworkMappingVO;
import com.seegene.web.admin.status.network.vo.NetworkStaffsInfoRO;
import com.seegene.web.admin.status.network.vo.NetworkStaffsInfoVO;
import com.seegene.web.admin.status.network.vo.NetworkStaffsVO;
import com.seegene.web.admin.status.network.vo.NetworkViewRO;
import com.seegene.web.common.SearchPaggingCommonPO;
import com.seegene.web.user.business.clinical.vo.BusinessClinicalNetworkListRO;
import com.seegene.web.user.business.clinical.vo.NetworkSearchPO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * 전국 네트워크 맵퍼
 */
@Mapper()
public interface NetworkMapper {
	/** 전국 네트워크 담당자 로그용 조회 */
	NetworkStaffsVO findNetworkStaffsBySeq(int seq);
	/** 전국 네트워크 담당자 상세 정보 로그 용 조회 */
	List<NetworkStaffsInfoVO> findNetworkStaffsInfoByStaffsSeq(int staffsSeq);
	/** 전국 네트워크 담당자 맵핑 정보정보 로그 용 조회 */
	List<NetworkMappingVO> findMappingByStaffsSeq(int staffsSeq);
	
	/** 전국 네트워크 검색 리스트 */
	List<NetworkListRO> findNetworkList(SearchPaggingCommonPO param);
	/** 전국 네트워크 검색 리스트 카운트 */
	int countNetworkList(SearchPaggingCommonPO param);
	
	/** 전국 네트워크 상세 조회 */
	NetworkViewRO findNetworkViewByMappingSeq(int seq);
	/** 전국 네트워크 직원 지역 정보 */
	List<NetworkMappingRO> findNetworkLocViewByStaffsSeq(int seq);
	/** 전국 네트워크 직원 상세 조회 */
	List<NetworkStaffsInfoRO> findNetworkStaffInfoViewByStaffsSeq(int seq);
	
	/** 지역별 출력 갯수 */
	List<NetworkLocCountRO> getLocPrintOrder();
//	
	/** 전국 네트워크 순서 변경 로그용 */
	List<NetworkMappingVO> checkNetworkOrder(NetworkMappingVO param);
	/** 전국 네트워크 순서 변경 로그 증가 업데이트 */
	void updateNetworkOrderInc(NetworkMappingVO param);
	/** 전국 네트워크 순서 변경 로그 감소 업데이트 */
	void updateNetworkOrderDec(NetworkMappingVO param);
	
	/** 전국 네트워크 담당자 마스터 등록 */
	void addNetworkStaffs(NetworkStaffsVO param);
	/** 전국 네트워크 사용자 언어별 정보 등록 */
	void addNetworkStaffsInfos(List<NetworkStaffsInfoVO> param);
	/** 전국 네트워크 사용자 지역정보 맵핑 등록 */
	void addNetworkMapping(List<NetworkMappingVO> param);
	
	/** 전국 네트워크 담당자 수정 */
	void editNetworkStaffs(NetworkStaffsVO param);
	/** 전국 네트워크 담당자 언어별 정보 수정 */
	void editNetworkStaffsInfo(NetworkStaffsInfoVO param);
	
	/** 전국 네트워크 사용자 삭제 */
	void deleteNetworkStaffs(NetworkStaffsVO param);
	/** 전국 네트워크 맵핑 삭제*/
	void deleteNetworkMapping(NetworkMappingVO param);
	/** 삭제시 출력 순서 조절할 맵핑 정보 조회 */
	List<NetworkMappingVO> findDeleteNetworkStaffsMappingInfo(int seq);
	
	//사용자용
	/** 사용자용 전국 네트워크 리스트 */
	List<BusinessClinicalNetworkListRO> findUserNetworkList( NetworkSearchPO param);
}
