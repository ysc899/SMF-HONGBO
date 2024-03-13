package com.seegene.web.repository.mariadb;

import java.util.List;

import com.seegene.web.admin.board.init.vo.PayrollNoticeFileMigVO;
import com.seegene.web.admin.board.init.vo.PayrollNoticeMigVO;
import com.seegene.web.admin.board.payrollNotice.vo.PayrollFileDownPO;
import com.seegene.web.admin.board.payrollNotice.vo.PayrollNoticeDeletePO;
import com.seegene.web.admin.board.payrollNotice.vo.PayrollNoticeEditPO;
import com.seegene.web.admin.board.payrollNotice.vo.PayrollNoticeFileDeletePO;
import com.seegene.web.admin.board.payrollNotice.vo.PayrollNoticeFileVO;
import com.seegene.web.admin.board.payrollNotice.vo.PayrollNoticeFileViewRO;
import com.seegene.web.admin.board.payrollNotice.vo.PayrollNoticeListRO;
import com.seegene.web.admin.board.payrollNotice.vo.PayrollNoticeVO;
import com.seegene.web.admin.board.payrollNotice.vo.PayrollNoticeViewRO;
import com.seegene.web.common.SearchPaggingCommonPO;
import com.seegene.web.user.customer.payrollNotice.vo.PayrollListRO;
import com.seegene.web.user.customer.payrollNotice.vo.PayrollSearchPO;
import com.seegene.web.user.customer.payrollNotice.vo.PayrollViewNextPreRO;
import com.seegene.web.user.customer.payrollNotice.vo.PayrollViewRO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * 급여 고시 맵퍼
 */
@Mapper()
public interface PayrollNoticeMapper {
	/** 급여 고시 로그용 */
	PayrollNoticeVO findPayrollNoticeBySeq(int seq);
	/** 급여 고시 파일 로그용 */
	List<PayrollNoticeFileVO> findPayrollNoticeFileByNoticeSeq(int noticeSeq);
	/** 급여 고시 검색 리스트 */
	List<PayrollNoticeListRO> findPayrollNoticeList(SearchPaggingCommonPO param);
	/** 급여 고시 검색 리스트 카운트 */
	int countPayrollNoticeList(SearchPaggingCommonPO param);
	/** 급여 고시 상세 조회 */
	PayrollNoticeViewRO findPayrollNoticeViewBySeq(int seq);
	/** 급여 고시 상세 조회용 파일 */
	List<PayrollNoticeFileViewRO> findPayrollNoticeFileViewByNoticeSeq (int noticeSeq);
	/** 급여 고시 등록 */
	void addPayrollNotice(PayrollNoticeVO param);
	/** 급여 고시 파일 등록 */
	void addPayrollNoticeFile(List<PayrollNoticeFileVO> param);
	/** 파일 다운로드용 */
	PayrollNoticeFileVO findPayrollNoticeFile(PayrollFileDownPO param);
	/** 급여 고시 수정 */
	void editPayrollNotice(PayrollNoticeEditPO param);
	/** 급여 고시 삭제 */
	void deletePayrollNotice(PayrollNoticeDeletePO deletePO);
	/** 급여 고시 파일 삭제 */
	void deletePayrollNoticeFiles(PayrollNoticeFileDeletePO param);
	
	//마이그레이션용
	/** 급여 고시 등록 */
	void addMigPayrollNotice(PayrollNoticeMigVO param);
	
	void addMigPayrollNoticeFile(PayrollNoticeFileMigVO param);
	
	
	//사용자 페이지용
	/** 급여 고시 검색 리스트 */
	List<PayrollListRO> findUserPayrollNoticeList(PayrollSearchPO param);
	/** 급여 고시 검색 리스트 카운트 */
	int countUserPayrollNoticeList(PayrollSearchPO param);
	/** 공지 리스트 */
	List<PayrollListRO> getUserPayrollNoticeList(String langCode);
	/** 사용자 급여 고시 상세 조회 */
	PayrollViewRO findUserPayrollNoticeViewBySeq(PayrollNoticeVO param);
	/** 조회수 증가 */
	void updatePayrollNoticeHit(int noticeSeq);
	/** 이전글 다음글 확인용 */
	List<PayrollViewNextPreRO> findPayrollNoticeNextPreBySeq(PayrollNoticeVO param);
	/** 파일 다운로드 수 업 */
	void updatePayrollNoticeFileHit(PayrollFileDownPO param);
}
