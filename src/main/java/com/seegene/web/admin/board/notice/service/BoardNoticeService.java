package com.seegene.web.admin.board.notice.service;

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
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.seegene.web.admin.board.db2.service.BoardDb2Service;
import com.seegene.web.admin.board.notice.vo.BoardFileDownPO;
import com.seegene.web.admin.board.notice.vo.BoardNoticeAddDefaultRO;
import com.seegene.web.admin.board.notice.vo.BoardNoticeAddPO;
import com.seegene.web.admin.board.notice.vo.BoardNoticeDeletePO;
import com.seegene.web.admin.board.notice.vo.BoardNoticeEditPO;
import com.seegene.web.admin.board.notice.vo.BoardNoticeFileDeletePO;
import com.seegene.web.admin.board.notice.vo.BoardNoticeFileVO;
import com.seegene.web.admin.board.notice.vo.BoardNoticeFileViewRO;
import com.seegene.web.admin.board.notice.vo.BoardNoticeListRO;
import com.seegene.web.admin.board.notice.vo.BoardNoticeVO;
import com.seegene.web.admin.board.notice.vo.BoardNoticeViewRO;
import com.seegene.web.admin.code.service.CodeService;
import com.seegene.web.admin.log.edit.service.LogEditService;
import com.seegene.web.admin.util.service.AdminUtilService;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.FileComponent;
import com.seegene.web.common.SearchPaggingCommonPO;
import com.seegene.web.common.SessionUtil;
import com.seegene.web.repository.mariadb.BoardNoticeMapper;

/**
 * 공문 게시판 서비스
 */
@Service
@Transactional(rollbackFor={RuntimeException.class, Exception.class, IOException.class})
public class BoardNoticeService {
	
	@Autowired
	private BoardNoticeMapper mapper;
	
	@Autowired
	private CodeService codeService;
	
	@Autowired
	private FileComponent fileComponent;
	
	@Autowired
	private LogEditService logEditService;
	
	@Autowired
	private AdminUtilService adminUtilService;
	
	//@Autowired
	//private BoardDb2Service boardDb2Service;
	
	
	/** 공문 파일 경로 */
	private final String FILE_PATH = "notice";
	
	/**
	 * @param seq 공문 seq
	 * @return 공문 vo 정보
	 */
	private BoardNoticeVO findNoticeBySeq(final int seq){
		return mapper.findNoticeBySeq(seq);
	}
	
	/**
	 * @param noticeSeq 공문 seq
	 * @return 공문 파일 vo 리스트
	 */
	private List<BoardNoticeFileVO> findNoticeFileByNoticeSeq(final int noticeSeq){
		return mapper.findNoticeFileByNoticeSeq(noticeSeq);
	}
	
	
	

	/**
	 * @param param 검색 조건
	 * @return 공문 리스트
	 */
	public CommonListReuslt<BoardNoticeListRO> findNoticeList(final SearchPaggingCommonPO param) {
		
		param.setMybatisPagging();
		List<BoardNoticeListRO> list = mapper.findNoticeList(param);
		
		int count = mapper.countNoticeList(param);
		
		CommonListReuslt<BoardNoticeListRO> result = new CommonListReuslt<>(list, count, param);
		
		return result;
	}

	/**
	 * @param seq 공문 식별자
	 */
	public BoardNoticeViewRO findNoticeInfo(final int seq) {
		
		BoardNoticeViewRO notice = mapper.findNoticeViewBySeq(seq);
//		notice.setContent(StringUtil.removeEnter(notice.getContent()));
		List<BoardNoticeFileViewRO> fileList = mapper.findNoticeFileViewByNoticeSeq(seq);
		notice.setFileList(fileList);
		
		return notice;
		
	}

	/**
	 * @return 공문 등록시 필요한 기본 정보
	 */
	public BoardNoticeAddDefaultRO getAddNoticeDefaultInfo() {
		BoardNoticeAddDefaultRO info = new BoardNoticeAddDefaultRO();
		
		info.setLangCodes(codeService.findLangCode());
		info.setCenterCodes(codeService.findSlaveByMaster("center"));
		
		return info;
	}

	
	/**
	 * @param seq 공문 seq
	 * @param req req
	 * @return 공문 삭제 성공 여부
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 */
	public boolean deleteNotice(final int seq,final HttpServletRequest req) throws ClientProtocolException, IOException {
		
		BoardNoticeVO beforeData = this.findNoticeBySeq(seq);
		
		BoardNoticeDeletePO deletePO = new BoardNoticeDeletePO();
		deletePO.setSeq(seq);
		deletePO.setEditUserId(SessionUtil.getAuthUserId());
		
		mapper.deleteNotice(deletePO);
		
		
		BoardNoticeVO afterData = this.findNoticeBySeq(seq);
		
		
		logEditService.insertEditLog(req, beforeData, afterData);
		
		//boardDb2Service.deleteBoardData(afterData, req);
		//boardDb2Service.deleteBoardFile(afterData, req);
		
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
	public int addNotice(final BoardNoticeAddPO param, final MultipartFile[] files, final HttpServletRequest req) throws IOException{
		
		BoardNoticeVO item = new BoardNoticeVO();
		item.setTitle(param.getTitle());
		item.setNoticeNumber(param.getNoticeNumber());
		item.setContent(param.getContent());
		item.setNoticeFlag(param.getNoticeFlag());
		item.setCodeLangType(param.getCodeLang());
		item.setCodeCenterType(param.getCodeCenter());
		item.setLoginYn(param.getLoginYn());
		
		String regUserId = SessionUtil.getAuthUserId();
		
		item.setRegUserId(regUserId);
		
		mapper.addNotice(item); //마리아 DB INSERT
		int noticeSeq = item.getSeq();
		
		item.setSeq(noticeSeq);
		
		List<BoardNoticeFileVO> fileList = new ArrayList<BoardNoticeFileVO>(); 
		
		for(MultipartFile file : files){
			if(StringUtils.isEmpty(file.getOriginalFilename()) || file.getBytes().length == 0){
				continue;
			}
			
			BoardNoticeFileVO fItem = new BoardNoticeFileVO();

			String filePath = fileComponent.writeFile(FILE_PATH, file);
			
			fItem.setFilePath(filePath);
			fItem.setFileName(file.getOriginalFilename());
			fItem.setFileSize(file.getSize());
			fItem.setBoardNoticeSeq(noticeSeq);
			fItem.setRegUserId(regUserId);
			
			fileList.add(fItem);
		}
		
		BoardNoticeVO afterData = findNoticeBySeq(noticeSeq);
		logEditService.insertAddLog(req, afterData);
		//boardDb2Service.addData(afterData, req);
		
		if(fileList.size() > 0){
			
			mapper.addNoticeFile(fileList);
			List<BoardNoticeFileVO> afterFileData = findNoticeFileByNoticeSeq(noticeSeq);
			//boardDb2Service.addFileData(afterData, afterFileData, req);
			
			logEditService.insertAddLog(req, afterFileData); 
		}
		
		adminUtilService.reloadServer();
		
		return noticeSeq;
	}

	/**
	 * @param seq
	 * @param fileSeq
	 * @param response 
	 * @param request 
	 */
	public void downloadNoticeFile(final int seq,final  int fileSeq, final HttpServletRequest request, final HttpServletResponse response) {
		
		BoardFileDownPO item = new BoardFileDownPO();
		item.setBoardNoticeSeq(seq);
		item.setBoardNoticeFileSeq(fileSeq);
		
		BoardNoticeFileVO fileVO = mapper.findNoticeFile(item);
		
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
	public boolean editNotice(final BoardNoticeEditPO param, final MultipartFile[] files, final HttpServletRequest req) throws IOException {
		BoardNoticeVO beforeData = findNoticeBySeq(param.getSeq());
		
		String editUserId = SessionUtil.getAuthUserId();
		
		param.setEditUserId(editUserId);
		
		mapper.editNotice(param);
		
		BoardNoticeVO afterData = findNoticeBySeq(param.getSeq());
		logEditService.insertEditLog(req, beforeData, afterData);
		
		//boardDb2Service.updateBoardData(afterData, req);
		
		
		List<BoardNoticeFileVO> beforeFileData = findNoticeFileByNoticeSeq(param.getSeq());
		
		Gson gson = new Gson();
		Type deleteFileType = new TypeToken<List<Integer>>() {
		}.getType();
		
		List<Integer> deleteFileSeqList = gson.fromJson(param.getDeleteFileJSON(), deleteFileType);
		
		if(deleteFileSeqList.size() > 0){
			BoardNoticeFileDeletePO deletePO = new BoardNoticeFileDeletePO();
			deletePO.setNoticeSeq(param.getSeq());
			deletePO.setDeleteSeqs(deleteFileSeqList);
			deletePO.setEditUserId(editUserId);
			
			mapper.deleteNoticeFiles(deletePO);
		}
		
		
		List<BoardNoticeFileVO> fileList = new ArrayList<BoardNoticeFileVO>(); 
		
		for(MultipartFile file : files){
			if(StringUtils.isEmpty(file.getOriginalFilename()) || file.getBytes().length == 0){
				continue;
			}
			
			BoardNoticeFileVO fItem = new BoardNoticeFileVO();
			
			String filePath = fileComponent.writeFile(FILE_PATH, file);
			
			fItem.setFilePath(filePath);
			fItem.setFileName(file.getOriginalFilename());
			fItem.setFileSize(file.getSize());
			fItem.setBoardNoticeSeq(param.getSeq());
			fItem.setRegUserId(editUserId);
			
			fileList.add(fItem);
		}
		
		
		
		if(fileList.size() > 0){
			mapper.addNoticeFile(fileList);
		}
		
		if(deleteFileSeqList.size() > 0 || fileList.size() > 0){
			List<BoardNoticeFileVO> afterFileData = findNoticeFileByNoticeSeq(param.getSeq());
			logEditService.insertEditLog(req, beforeFileData, afterFileData);
			
			//boardDb2Service.deleteBoardFile(afterData, req);
			//boardDb2Service.addFileData(afterData, afterFileData, req);
		}
		
		adminUtilService.reloadServer();
		
		return true;
	}

}
