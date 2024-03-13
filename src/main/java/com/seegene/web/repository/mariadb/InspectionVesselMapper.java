package com.seegene.web.repository.mariadb;

import java.util.List;

import com.seegene.web.admin.inspection.vessel.vo.InspectionVesselListRO;
import com.seegene.web.admin.inspection.vessel.vo.InspectionVesselViewRO;
import com.seegene.web.admin.inspection.vessel.vo.VesselVO;
import com.seegene.web.common.SearchPaggingCommonPO;
import com.seegene.web.common.UserSearchPaggingCommonPO;
import com.seegene.web.user.task.vessel.vo.VesselUserAllListRO;
import com.seegene.web.user.task.vessel.vo.VesselUserListRO;
import com.seegene.web.user.task.vessel.vo.VesselUserNextPreRO;
import com.seegene.web.user.task.vessel.vo.VesselUserViewRO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * 검체용기 맵퍼
 */
@Mapper()
public interface InspectionVesselMapper {
	/** 검체용기 로그용 조회 */
	VesselVO findVesselBySeq(int seq);
	
	/** 검체용기 검색 리스트 */
	List<InspectionVesselListRO> findVesselList(SearchPaggingCommonPO param);
	/** 검체용기 검색 리스트 카운트 */
	int countVesselList(SearchPaggingCommonPO param);
	/** 검체용기 상세 조회 */
	InspectionVesselViewRO findVesselViewBySeq(int seq);
	
	/** 언어코드에 따른 갯수 */
	int getPrintOrder(VesselVO param);
	
	
	/** 검사의뢰서 순서 변경 로그용 */
	List<VesselVO> checkVesselOrder(VesselVO param);
	/** 검사의뢰서 순서 변경 로그 증가 업데이트 */
	void updateVesselOrderInc(VesselVO param);
	/** 검사의뢰서 순서 변경 로그 감소 업데이트 */
	void updateVesselOrderDec(VesselVO param);
	
	/** 검체용기 등록 */
	void addVessel(VesselVO param);
	/** 검체용기 수정 */
	void editVessel(VesselVO param);
	/** 검체용기 삭제 */
	void deleteVessel(VesselVO deletePO);
	
	//사용자용
	/** 검체용기 모든 리스트용 */
	List<VesselUserAllListRO> findUserAllVesselList(String codeLangType);
	/** 검체용기 사용자 리스트 */
	List<VesselUserListRO> findUserVesselList(UserSearchPaggingCommonPO param);
	/** 검체용기 사용자 리스트  카운트*/
	int findUserVesselListCount(UserSearchPaggingCommonPO param);
	/** 검체용기 사용자용 상세 조회 */
	VesselUserViewRO findUserVesselViewBySeq(VesselVO param);
	/** 이전 다음 확인용*/
	List<VesselUserNextPreRO> findUserVesselNextPreBySeq(VesselVO param);
}
