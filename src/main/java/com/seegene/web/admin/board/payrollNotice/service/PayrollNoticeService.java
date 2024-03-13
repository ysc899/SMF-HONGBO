package com.seegene.web.admin.board.payrollNotice.service;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.http.client.ClientProtocolException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.seegene.web.admin.board.db2.service.BoardDb2Service;
import com.seegene.web.admin.board.payrollNotice.vo.PayrollFileDownPO;
import com.seegene.web.admin.board.payrollNotice.vo.PayrollNoticeAddDefaultRO;
import com.seegene.web.admin.board.payrollNotice.vo.PayrollNoticeAddPO;
import com.seegene.web.admin.board.payrollNotice.vo.PayrollNoticeDeletePO;
import com.seegene.web.admin.board.payrollNotice.vo.PayrollNoticeEditPO;
import com.seegene.web.admin.board.payrollNotice.vo.PayrollNoticeFileDeletePO;
import com.seegene.web.admin.board.payrollNotice.vo.PayrollNoticeFileVO;
import com.seegene.web.admin.board.payrollNotice.vo.PayrollNoticeFileViewRO;
import com.seegene.web.admin.board.payrollNotice.vo.PayrollNoticeListRO;
import com.seegene.web.admin.board.payrollNotice.vo.PayrollNoticeVO;
import com.seegene.web.admin.board.payrollNotice.vo.PayrollNoticeViewRO;
import com.seegene.web.admin.code.service.CodeService;
import com.seegene.web.admin.log.edit.service.LogEditService;
import com.seegene.web.admin.util.service.AdminUtilService;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.FileComponent;
import com.seegene.web.common.SearchPaggingCommonPO;
import com.seegene.web.common.SessionUtil;
import com.seegene.web.repository.mariadb.BoardNoticeMapper;
import com.seegene.web.repository.mariadb.PayrollNoticeMapper;

/**
 * 급여 고시  게시판 서비스
 */
@Service
@Transactional(rollbackFor={RuntimeException.class, Exception.class, IOException.class})
public class PayrollNoticeService {
	
	@Autowired
	private PayrollNoticeMapper mapper;
	
	@Autowired
	private CodeService codeService;
	
	@Autowired
	private FileComponent fileComponent;
	
	@Autowired
	private LogEditService logEditService;
	
	@Autowired
	private AdminUtilService adminUtilService;
	

	/** 급여 고시  파일 경로 */
	private final String FILE_PATH = "payrollNotice";
	
	
	/**
	 * @param seq 급여 고시  seq
	 * @return 급여 고시  vo 정보
	 */
	private PayrollNoticeVO findPayrollNoticeBySeq(final int seq){
		return mapper.findPayrollNoticeBySeq(seq);
	}
	
	/**
	 * @param noticeSeq 급여 고시  seq
	 * @return 급여 고시  파일 vo 리스트
	 */
	private List<PayrollNoticeFileVO> findPayrollNoticeFileByNoticeSeq(final int payrollNoticeSeq){
		return mapper.findPayrollNoticeFileByNoticeSeq(payrollNoticeSeq);
	}
	
	
	

	/**
	 * @param param 검색 조건
	 * @return 급여 고시  리스트
	 */
	public CommonListReuslt<PayrollNoticeListRO> findPayrollNoticeList(final SearchPaggingCommonPO param) {
		
		param.setMybatisPagging();
		List<PayrollNoticeListRO> list = mapper.findPayrollNoticeList(param);
		
		int count = mapper.countPayrollNoticeList(param);
		
		CommonListReuslt<PayrollNoticeListRO> result = new CommonListReuslt<>(list, count, param);
		
		return result;
	}

	/**
	 * @param seq 급여 고시  식별자
	 */
	public PayrollNoticeViewRO findPayrollNoticeInfo(final int seq) {
		
		PayrollNoticeViewRO payrollNotice = mapper.findPayrollNoticeViewBySeq(seq);
		List<PayrollNoticeFileViewRO> fileList = mapper.findPayrollNoticeFileViewByNoticeSeq(seq);
		payrollNotice.setFileList(fileList);
		
		return payrollNotice;
		
	}

	/**
	 * @return 급여 고시  등록시 필요한 기본 정보
	 */
	public PayrollNoticeAddDefaultRO getAddNoticeDefaultInfo() {
		PayrollNoticeAddDefaultRO info = new PayrollNoticeAddDefaultRO();
		
		info.setLangCodes(codeService.findLangCode());
		info.setCenterCodes(codeService.findSlaveByMaster("center"));
		
		return info;
	}

	
	/**
	 * @param seq 급여 고시  seq
	 * @param req req
	 * @return 급여 고시  삭제 성공 여부
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 */
	public boolean deletePayrollNotice(final int seq,final HttpServletRequest req) throws ClientProtocolException, IOException {
		
		PayrollNoticeVO beforeData = this.findPayrollNoticeBySeq(seq);
		
		PayrollNoticeDeletePO deletePO = new PayrollNoticeDeletePO();
		deletePO.setSeq(seq);
		deletePO.setEditUserId(SessionUtil.getAuthUserId());
		
		mapper.deletePayrollNotice(deletePO);
		
		
		PayrollNoticeVO afterData = this.findPayrollNoticeBySeq(seq);
		
		
		logEditService.insertEditLog(req, beforeData, afterData);

		adminUtilService.reloadServer();
		
		return true;
	}

	/**
	 * @param param 등록 정보
	 * @param files 첨부파일
	 * @param req req
	 * @return seq
	 * @throws IOException ioe
	 */
	public int addPayrollNotice(final PayrollNoticeAddPO param, final MultipartFile[] files, final HttpServletRequest req) throws IOException{
		
		PayrollNoticeVO item = new PayrollNoticeVO();
		item.setTitle(param.getTitle());
		item.setPayrollNoticeNumber(param.getPayrollNoticeNumber());
		item.setContent(param.getContent());
		item.setPayrollNoticeFlag(param.getPayrollNoticeFlag());
		item.setCodeLangType(param.getCodeLang());
		item.setCodeCenterType(param.getCodeCenter());
		
		String regUserId = SessionUtil.getAuthUserId();
		
		item.setRegUserId(regUserId);
		
		mapper.addPayrollNotice(item);
		
		int payrollNoticeSeq = item.getSeq();
		
		List<PayrollNoticeFileVO> fileList = new ArrayList<PayrollNoticeFileVO>(); 
		
		for(MultipartFile file : files){
			if(StringUtils.isEmpty(file.getOriginalFilename()) || file.getBytes().length == 0){
				continue;
			}
			
			PayrollNoticeFileVO fItem = new PayrollNoticeFileVO();
			
			String filePath = fileComponent.writeFile(FILE_PATH, file);
			
			fItem.setFilePath(filePath);
			fItem.setFileName(file.getOriginalFilename());
			fItem.setFileSize(file.getSize());
			fItem.setPayrollNoticeSeq(payrollNoticeSeq);
			fItem.setRegUserId(regUserId);
			
			fileList.add(fItem);
		}
									
		PayrollNoticeVO afterData = findPayrollNoticeBySeq(payrollNoticeSeq);
		logEditService.insertAddLog(req, afterData);

		
		if(fileList.size() > 0){
			mapper.addPayrollNoticeFile(fileList);
			
			List<PayrollNoticeFileVO> afterFileData = findPayrollNoticeFileByNoticeSeq(payrollNoticeSeq);

			logEditService.insertAddLog(req, afterFileData);
		}
		
		
		adminUtilService.reloadServer();
		
		return payrollNoticeSeq;
	}

	/**
	 * @param seq
	 * @param fileSeq
	 * @param response 
	 * @param request 
	 */
	public void downloadPayrollNoticeFile(final int seq,final  int fileSeq, final HttpServletRequest request, final HttpServletResponse response) {
		
		PayrollFileDownPO item = new PayrollFileDownPO();
		item.setPayrollNoticeSeq(seq);
		item.setPayrollNoticeFileSeq(fileSeq);
		
		PayrollNoticeFileVO fileVO = mapper.findPayrollNoticeFile(item);
		
		if(fileVO == null){
			return;
		}
		fileComponent.downloadFile(FILE_PATH, fileVO.getFilePath(), fileVO.getFileName(), request, response);
		
	}

	/**
	 * @param param 수정 정보
	 * @param files 파일들
	 * @param req reqs
	 * @return 성공여부
	 * @throws IOException ioe
	 */
	public boolean editPayrollNotice(final PayrollNoticeEditPO param, final MultipartFile[] files, final HttpServletRequest req) throws IOException {
		PayrollNoticeVO beforeData = findPayrollNoticeBySeq(param.getSeq());
		
		String editUserId = SessionUtil.getAuthUserId();
		
		param.setEditUserId(editUserId);
		
		mapper.editPayrollNotice(param);
		
		PayrollNoticeVO afterData = findPayrollNoticeBySeq(param.getSeq());
		logEditService.insertEditLog(req, beforeData, afterData);
		
		
		
		List<PayrollNoticeFileVO> beforeFileData = findPayrollNoticeFileByNoticeSeq(param.getSeq());
		
		Gson gson = new Gson();
		Type deleteFileType = new TypeToken<List<Integer>>() {
		}.getType();
		
		List<Integer> deleteFileSeqList = gson.fromJson(param.getDeleteFileJSON(), deleteFileType);
		
		if(deleteFileSeqList.size() > 0){
			PayrollNoticeFileDeletePO deletePO = new PayrollNoticeFileDeletePO();
			deletePO.setPayrollNoticeSeq(param.getSeq());
			deletePO.setDeleteSeqs(deleteFileSeqList);
			deletePO.setEditUserId(editUserId);
			
			mapper.deletePayrollNoticeFiles(deletePO);
		}
		
		
		List<PayrollNoticeFileVO> fileList = new ArrayList<PayrollNoticeFileVO>(); 
		
		for(MultipartFile file : files){
			if(StringUtils.isEmpty(file.getOriginalFilename()) || file.getBytes().length == 0){
				continue;
			}
			
			PayrollNoticeFileVO fItem = new PayrollNoticeFileVO();
			
			String filePath = fileComponent.writeFile(FILE_PATH, file);
			
			fItem.setFilePath(filePath);
			fItem.setFileName(file.getOriginalFilename());
			fItem.setFileSize(file.getSize());
			fItem.setPayrollNoticeSeq(param.getSeq());
			fItem.setRegUserId(editUserId);
			
			fileList.add(fItem);
		}
		
		
		
		if(fileList.size() > 0){
			mapper.addPayrollNoticeFile(fileList);
		}
		
		if(deleteFileSeqList.size() > 0 || fileList.size() > 0){
			List<PayrollNoticeFileVO> afterFileData = findPayrollNoticeFileByNoticeSeq(param.getSeq());
			logEditService.insertEditLog(req, beforeFileData, afterFileData);
	
		}
		
		adminUtilService.reloadServer();
		
		return true;
	}

}
