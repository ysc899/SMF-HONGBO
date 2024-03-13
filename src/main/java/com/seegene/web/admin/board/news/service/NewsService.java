package com.seegene.web.admin.board.news.service;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

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
import com.seegene.web.admin.board.integrated.vo.BoardDefaultFileVO;
import com.seegene.web.admin.board.integrated.vo.BoardDefaultSlaveVO;
import com.seegene.web.admin.board.integrated.vo.BoardIntegratedAddPO;
import com.seegene.web.admin.board.integrated.vo.BoardIntegratedEditPO;
import com.seegene.web.admin.board.integrated.vo.BoardIntegratedFileDeletePO;
import com.seegene.web.admin.board.integrated.vo.BoardIntegratedFileViewRO;
import com.seegene.web.admin.board.integrated.vo.BoardIntegratedListRO;
import com.seegene.web.admin.board.integrated.vo.BoardIntegratedViewRO;
import com.seegene.web.admin.board.integrated.vo.BoardOptInfoRO;
import com.seegene.web.admin.code.service.CodeService;
import com.seegene.web.admin.log.edit.service.LogEditService;
import com.seegene.web.admin.util.service.AdminUtilService;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.FileComponent;
import com.seegene.web.common.SearchIntegrateSearchPaggingPO;
import com.seegene.web.common.SessionUtil;
import com.seegene.web.repository.mariadb.BoardIntegratedMapper;
import com.seegene.web.repository.mariadb.NewsMapper;

@Service
@Transactional
public class NewsService {
	
	@Autowired
	private NewsMapper mapper;
	
	@Autowired
	private FileComponent fileComponent;
	
	@Autowired
	private CodeService codeService;
	
	@Autowired
	private LogEditService logEditService;
	
	@Autowired
	private AdminUtilService adminUtilService;
	
	//@Autowired
	//private BoardDb2Service boardDb2Service;
	
	/** 기본 파일 경로 */
	private final String FILE_PATH = "boardIntegrated";
	
	
	/**
	 * @param masterSeq 마스터 seq
	 * @param seq 내용 seq
	 * @return 결과
	 */
	private BoardDefaultSlaveVO findSlaveBySeqs(final int masterSeq, final int seq){
		
		BoardDefaultSlaveVO param = new BoardDefaultSlaveVO();
		param.setBoardDefaultMasterSeq(masterSeq);
		param.setSeq(seq);
		
		return mapper.findBoardSlaveBySeq(param);
	}
	
	/**
	 * @param slaveSeq 내용 seq
	 * @return 파일 리스트
	 */
	private List<BoardDefaultFileVO> findBoardSlaveFilesBySeq(final int slaveSeq){
		
		return mapper.findBoardSlaveFilesBySeq(slaveSeq);
	}
	
	/**
	 * @param masterSeq 부모 식별자
	 * @return 게시판 옵션
	 */
	public BoardOptInfoRO findMasterOptBySeq(final int masterSeq){
		
		return mapper.findMasterOptBySeq(masterSeq);
	}

	/**
	 * @param masterSeq 마스터 faq seq
	 * @param param 검색조건
	 * @return 통합 게시판 내용 리스트
	 * @throws Exception 
	 */
	public CommonListReuslt<BoardIntegratedListRO> findBoardIntegratedList(final int masterSeq, final SearchIntegrateSearchPaggingPO param) throws Exception {
		param.setMasterSeq(masterSeq);
		param.setMybatisPagging();
		List<BoardIntegratedListRO> list = mapper.findBoardIntegratedList(param);
		
		int count = mapper.countBoardIntegratedList(param);
		
		CommonListReuslt<BoardIntegratedListRO> result = new CommonListReuslt<>(list, count, param);
		
		return result;
	}

	/**
	 * @param masterSeq 게시판 식별자
	 * @param seq 내용 식별자
	 * @return 상세 정보
	 * @throws IOException ioe
	 */
	public BoardIntegratedViewRO findBoardIntegratedView(final int masterSeq, final int seq) throws IOException {
		BoardOptInfoRO option = this.findMasterOptBySeq(masterSeq);
		
		BoardDefaultSlaveVO param = new BoardDefaultSlaveVO();
		param.setBoardDefaultMasterSeq(masterSeq);
		param.setSeq(seq);
		
		BoardIntegratedViewRO result = mapper.findBoardIntegratedViewBySeq(param);
		
		boolean isFile = option.getOptFileFlag().equals("Y");
		boolean isThum = option.getOptThumFlag().equals("Y");
		
		if(isFile || isThum){
			List<BoardIntegratedFileViewRO> files = mapper.findBoardIntegratedFilesViewBySeq(param);
			
			if(isFile){
				// 첨부파일들 처리
				result.setFiles(files.stream().filter(f -> {return !f.getThumFlag().equals("Y");}).collect(Collectors.toList()));
			}
			
			if(isThum){
				//섬네일 파일 처리
				BoardIntegratedFileViewRO thumFile = files.stream().filter(f -> {return f.getThumFlag().equals("Y");}).findFirst().orElse(null);
				if(thumFile != null){
					result.setThumImageBase64(fileComponent.getImageToBase64(FILE_PATH + File.separator + thumFile.getFilePath()));
				}
			}
			
			
		}
		
		return result;
	}

	/**
	 * @param masterSeq 게시판 seq
	 * @param seq 내용 seq
	 * @param req req
	 * @return 삭제 성공 여부
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 */
	public boolean deleteBoardIntegrated(final int masterSeq,final  int seq, final HttpServletRequest req) throws ClientProtocolException, IOException {
		 BoardDefaultSlaveVO beforeData = this.findSlaveBySeqs(masterSeq, seq);
		
		 BoardDefaultSlaveVO item = new BoardDefaultSlaveVO();
		item.setBoardDefaultMasterSeq(masterSeq);
		item.setSeq(seq);
		item.setEditUserId(SessionUtil.getAuthUserId());
		
		mapper.deleteBoardIntegrated(item);
		
		BoardDefaultSlaveVO afterData = this.findSlaveBySeqs(masterSeq, seq);
		
		logEditService.insertEditLog(req, beforeData, afterData);
		
		if(masterSeq == 1){
			//boardDb2Service.deleteBoardData(afterData, req);
		}
		
		adminUtilService.reloadServer();
		
		return true;
	}

	/**
	 * @param masterSeq 부모 seq
	 * @param param 등록정보
	 * @param thumFile 섬네일 파일
	 * @param files 첨부파일
	 * @param req req
	 * @return 내용 seq
	 * @throws IOException ioe
	 * @throws InterruptedException 
	 */
	public int addBoardIntegrated(final int masterSeq, final BoardIntegratedAddPO param, final MultipartFile[] thumFile,
			final MultipartFile[] files, final HttpServletRequest req) throws IOException, InterruptedException {
		
		BoardOptInfoRO option = findMasterOptBySeq(masterSeq);
		
		String regUserId = SessionUtil.getAuthUserId();
		
		BoardDefaultSlaveVO item = new BoardDefaultSlaveVO();
		item.setBoardDefaultMasterSeq(masterSeq);
		item.setLangType(param.getLangType());
		item.setTitle(param.getTitle());
		item.setContent(param.getContent());
		item.setSystemType(param.getSystemType());
		item.setPopupUseYn(param.getPopupUseYn());
		
		if(param.getPopupStartDate().equals("")){
			param.setPopupStartDate(null);
		}
		if(param.getPopupEndDate().equals("")){
			param.setPopupEndDate(null);
		}
		if(param.getPopupTopPosition().equals("")){
			param.setPopupTopPosition(null);
		}
		if(param.getPopupLeftPosition().equals("")){
			param.setPopupLeftPosition(null);
		}
		
		item.setPopupStartDate(param.getPopupStartDate());
		item.setPopupEndDate(param.getPopupEndDate());
		item.setPopupTopPosition(param.getPopupTopPosition());
		item.setPopupLeftPosition(param.getPopupLeftPosition());
		// 신규 검사코드 / 검사명
		if(2 == masterSeq){
			item.setOneClickGcd(param.getOneClickGcd());
			item.setOneClickGnm(param.getOneClickGnm());
		}
		if(option.getOptNotiFlag().equals("Y")){
			item.setNoticeFlag(param.getNoticeFlag());
		}else{
			item.setNoticeFlag("N");
		}
		item.setRegUserId(regUserId);
		
		mapper.addBoardIntegrated(item);
		
		BoardDefaultSlaveVO afterData = this.findSlaveBySeqs(masterSeq, item.getSeq());
		
		logEditService.insertAddLog(req, afterData);
		
		List<BoardDefaultFileVO> addFiles = new ArrayList<BoardDefaultFileVO>();
		
		if(option.getOptThumFlag().equals("Y")){
			for(MultipartFile file : thumFile){
				if(StringUtils.isEmpty(file.getOriginalFilename()) || file.getBytes().length == 0){
					continue;
				}
				
				BoardDefaultFileVO fItem = new BoardDefaultFileVO();
				
				String filePath = fileComponent.writeImageThumFile(FILE_PATH, file, 265, 195);
				
				fItem.setBoardDefaultSlaveSeq(item.getSeq());
				fItem.setThumFlag("Y");
				fItem.setFilePath(filePath);
				fItem.setFileName(file.getOriginalFilename());
				fItem.setFileSize(file.getSize());
				fItem.setRegUserId(regUserId);
				
				addFiles.add(fItem);
			}
		}
		
		if(option.getOptFileFlag().equals("Y")){
			for(MultipartFile file : files){
				if(StringUtils.isEmpty(file.getOriginalFilename()) || file.getBytes().length == 0){
					continue;
				}
				
				BoardDefaultFileVO fItem = new BoardDefaultFileVO();
				
				String filePath = fileComponent.writeFile(FILE_PATH, file);
				
				fItem.setBoardDefaultSlaveSeq(item.getSeq());
				fItem.setThumFlag("N");
				fItem.setFilePath(filePath);
				fItem.setFileName(file.getOriginalFilename());
				fItem.setFileSize(file.getSize());
				fItem.setRegUserId(regUserId);
				
				addFiles.add(fItem);
			}
		}
		
		if(addFiles.size() > 0){
			mapper.addBoardFileIntegrated(addFiles);
			List<BoardDefaultFileVO> afterFileData = this.findBoardSlaveFilesBySeq(item.getSeq());
			logEditService.insertAddLog(req, afterFileData);
		}
		
		if(masterSeq == 1){
			//boardDb2Service.addData(afterData, req);
		}
		
		adminUtilService.reloadServer();
		
		return item.getSeq();
	}

	/**
	 * @param masterSeq 상위 게시판 seq
	 * @param param 수정 파라미터
	 * @param thumFile 섬네일 정보
	 * @param files 첨부파일 정보
	 * @param req req
	 * @return 수정 성공 여부
	 * @throws IOException ioe
	 */
	public boolean editBoardIntegrated(final int masterSeq, final BoardIntegratedEditPO param, final MultipartFile[] thumFile,
			final MultipartFile[] files, final HttpServletRequest req) throws IOException {
		
		BoardDefaultSlaveVO beforeData = this.findSlaveBySeqs(masterSeq, param.getSeq());
		List<BoardDefaultFileVO> beforeFileData = this.findBoardSlaveFilesBySeq(param.getSeq());
		
		BoardOptInfoRO option = findMasterOptBySeq(masterSeq);
		
		String editUserId = SessionUtil.getAuthUserId();
		
		BoardDefaultSlaveVO item = new BoardDefaultSlaveVO();
		item.setSeq(param.getSeq());
		item.setBoardDefaultMasterSeq(masterSeq);
		item.setLangType(param.getLangType());
		item.setTitle(param.getTitle());
		item.setContent(param.getContent());
		item.setOneClickGcd(param.getOneClickGcd());
		item.setOneClickGnm(param.getOneClickGnm());
		item.setSystemType(param.getSystemType());
	
		if(param.getPopupStartDate().equals("")){
			param.setPopupStartDate(null);
		}
		if(param.getPopupEndDate().equals("")){
			param.setPopupEndDate(null);
		}
		if(param.getPopupTopPosition().equals("")){
			param.setPopupTopPosition(null);
		}
		if(param.getPopupLeftPosition().equals("")){
			param.setPopupLeftPosition(null);
		}
		
		item.setPopupUseYn(param.getPopupUseYn());
		item.setPopupStartDate(param.getPopupStartDate());
		item.setPopupEndDate(param.getPopupEndDate());
		item.setPopupTopPosition(param.getPopupTopPosition());
		item.setPopupLeftPosition(param.getPopupLeftPosition());
		
		if(option.getOptNotiFlag().equals("Y")){
			item.setNoticeFlag(param.getNoticeFlag());
		}else{
			item.setNoticeFlag("N");
		}
		item.setEditUserId(editUserId);
		
		mapper.editBoardIntegrated(item);
		
		BoardDefaultSlaveVO afterData = this.findSlaveBySeqs(masterSeq, item.getSeq());
		
		logEditService.insertEditLog(req,beforeData, afterData);
		
		List<BoardDefaultFileVO> addFiles = new ArrayList<BoardDefaultFileVO>();
		
		if(option.getOptThumFlag().equals("Y")){
			for(MultipartFile file : thumFile){
				if(StringUtils.isEmpty(file.getOriginalFilename()) || file.getBytes().length == 0){
					continue;
				}
				//기존 섬네일 삭제
				mapper.deleteBoardIntegratedThumFile(item);
				
				BoardDefaultFileVO fItem = new BoardDefaultFileVO();
				
				String filePath = fileComponent.writeFile(FILE_PATH, file);
				
				fItem.setBoardDefaultSlaveSeq(item.getSeq());
				fItem.setThumFlag("Y");
				fItem.setFilePath(filePath);
				fItem.setFileName(file.getOriginalFilename());
				fItem.setFileSize(file.getSize());
				fItem.setRegUserId(editUserId);
				
				addFiles.add(fItem);
			}
		}
		
		if(option.getOptFileFlag().equals("Y")){
			//삭제 파일들 처리
			Gson gson = new Gson();
			Type deleteFileType = new TypeToken<List<Integer>>() {
			}.getType();
			
			List<Integer> deleteFileSeqList = gson.fromJson(param.getDeleteFileJSON(), deleteFileType);
			
			if(deleteFileSeqList.size() > 0){
				BoardIntegratedFileDeletePO deletePO = new BoardIntegratedFileDeletePO();
				deletePO.setSlaveSeq(param.getSeq());
				deletePO.setDeleteSeqs(deleteFileSeqList);
				deletePO.setEditUserId(editUserId);
				
				mapper.deleteBoardIntegratedFiles(deletePO);
			}
			
			//추가된 파일들 처리
			for(MultipartFile file : files){
				if(StringUtils.isEmpty(file.getOriginalFilename()) || file.getBytes().length == 0){
					continue;
				}
				
				BoardDefaultFileVO fItem = new BoardDefaultFileVO();
				
				String filePath = fileComponent.writeFile(FILE_PATH, file);
				
				fItem.setBoardDefaultSlaveSeq(item.getSeq());
				fItem.setThumFlag("N");
				fItem.setFilePath(filePath);
				fItem.setFileName(file.getOriginalFilename());
				fItem.setFileSize(file.getSize());
				fItem.setRegUserId(editUserId);
				
				addFiles.add(fItem);
			}
		}
		
		if(addFiles.size() > 0){
			mapper.addBoardFileIntegrated(addFiles);
			List<BoardDefaultFileVO> afterFileData = this.findBoardSlaveFilesBySeq(item.getSeq());
			logEditService.insertEditLog(req,beforeFileData, afterFileData);
		}
		
		if(masterSeq == 1){
			//boardDb2Service.updateBoardData(afterData, req);
		}
		
		adminUtilService.reloadServer();
		
		return true;
	}

	/**
	 * @param masterSeq 상위 게시판 seq
	 * @param seq 내용 seq
	 * @param fileSeq 첨부파일 seq
	 * @param response 
	 * @param request 
	 */
	public void downloadBoardFile(final int masterSeq, final int seq, final int fileSeq, final HttpServletRequest request, final HttpServletResponse response) {

		BoardDefaultFileVO param = new BoardDefaultFileVO();
		param.setSeq(fileSeq);
		param.setBoardDefaultSlaveSeq(seq);
		
		BoardDefaultFileVO fileVO = mapper.findBoarddIntegratedFileInfo(param);
		
		if(fileVO == null){
			return;
		}
		fileComponent.downloadFile(FILE_PATH, fileVO.getFilePath(), fileVO.getFileName(), request, response);
	}


}

