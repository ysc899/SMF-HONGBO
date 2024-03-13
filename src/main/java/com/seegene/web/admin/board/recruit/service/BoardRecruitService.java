package com.seegene.web.admin.board.recruit.service;

import java.lang.reflect.Type;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.seegene.web.admin.board.recruit.vo.BoardRecruitAddDefaultRO;
import com.seegene.web.admin.board.recruit.vo.BoardRecruitAddPO;
import com.seegene.web.admin.board.recruit.vo.BoardRecruitEditPO;
import com.seegene.web.admin.board.recruit.vo.BoardRecruitListRO;
import com.seegene.web.admin.board.recruit.vo.BoardRecruitTaskEditPO;
import com.seegene.web.admin.board.recruit.vo.BoardRecruitTaskVO;
import com.seegene.web.admin.board.recruit.vo.BoardRecruitVO;
import com.seegene.web.admin.board.recruit.vo.BoardRecruitViewRO;
import com.seegene.web.admin.board.recruit.vo.BoardRrecruitTaskDeletePO;
import com.seegene.web.admin.code.service.CodeService;
import com.seegene.web.admin.log.edit.service.LogEditService;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.DateUtil;
import com.seegene.web.common.IpUtil;
import com.seegene.web.common.SearchPaggingCommonPO;
import com.seegene.web.common.SessionUtil;
import com.seegene.web.repository.mariadb.BoardRecruitMapper;

import lombok.extern.log4j.Log4j;

/**
 * 공문 게시판 서비스
 */
@Log4j
@Service
@Transactional
public class BoardRecruitService {
	
	@Autowired
	private BoardRecruitMapper mapper;
	
	@Autowired
	private CodeService codeService;
	
	@Autowired
	private LogEditService logEditService;
	
	/** 스케줄러 작동 확인용 */
	@Value("${scheduler.hostname}")
	private String SCHEDULER_HOSTNAME;

	
	/**
	 * @param seq 채용 seq
	 * @return 채용 vo 정보
	 */
	private BoardRecruitVO findRecruitBySeq(final int seq){
		return mapper.findRecruitBySeq(seq);
	}
	
	/**
	 * @param noticeSeq 공문 seq
	 * @return 공문 파일 vo 리스트
	 */
	private List<BoardRecruitTaskVO> findRecruitTaskByRecruitSeq(final int recruitSeq){
		return mapper.findRecruitTaskByRecruitSeq(recruitSeq);
	}
	
	
	

	/**
	 * @param param 검색 조건
	 * @return 공문 리스트
	 */
	public CommonListReuslt<BoardRecruitListRO> findRecruitList(final SearchPaggingCommonPO param) {
		
		param.setMybatisPagging();
		List<BoardRecruitListRO> list = mapper.findRecruitList(param);
		int count = mapper.countRecruitList(param);
		
		CommonListReuslt<BoardRecruitListRO> result = new CommonListReuslt<>(list, count, param);
		
		return result;
	}

	/**
	 * @param seq 채용 식별자
	 */
	public BoardRecruitViewRO findRecruitInfo(final int seq) {
		
		BoardRecruitViewRO recruit = mapper.findRecruitViewBySeq(seq);
		if(recruit.getInputTypeFlag().equals("Y")){
			
			recruit.setTasks(mapper.findRecruitTaskViewByRecruitSeq(seq));
		}
		
		return recruit;
		
	}
	
	/**
	 * @return 채용 등록 기본 정보
	 */
	public BoardRecruitAddDefaultRO getAddRecruitDefaultInfo() {
		
		BoardRecruitAddDefaultRO info = new BoardRecruitAddDefaultRO();
		
		info.setLangCodes(codeService.findLangCode());
		info.setRecruitTPCodes(codeService.findSlaveByMaster("recruitTP"));
		info.setRecruitSTCodes(codeService.findSlaveByMaster("recruitST"));
		
		return info;
	}

	/**
	 * @param param 채용 등록 정보
	 * @param req req
	 * @return 채용 seq
	 */
	public int addRecruit(final BoardRecruitAddPO param, final HttpServletRequest req) {
		
		String regUserId = SessionUtil.getAuthUserId();
		
		BoardRecruitVO item = new BoardRecruitVO();
		item.setCodeLangType(param.getCodeLang());
		item.setCodeRecruitType(param.getCodeRecruitTP());
		item.setCodeRecruitStateType(param.getCodeRecruitST());
		item.setTitle(param.getTitle());
		item.setViewFlag(param.getViewFlag());
		item.setInputTypeFlag(param.getInputTypeFlag());
		item.setStartDate(DateUtil.getDate(param.getStartDate(), "yyyy-MM-dd"));
		
		if(StringUtils.isNotEmpty(param.getEndDate())){
			item.setEndDate(DateUtil.getDate(param.getEndDate()+" 23:59:59", "yyyy-MM-dd HH:mm:ss"));
		}
		
		item.setRegUserId(regUserId);
		
		if(item.getInputTypeFlag().equals("Y")){
			item.setContentTitle(param.getContentTitle());
			item.setContentComment(param.getContentComment());
		}else{
			item.setContent(param.getContent());
		}
		
		mapper.addRecruit(item);
		
		BoardRecruitVO afterData = findRecruitBySeq(item.getSeq());
		logEditService.insertAddLog(req, afterData);
		
		if(item.getInputTypeFlag().equals("Y")){
			Gson gson = new Gson();
			Type taskType = new TypeToken<List<BoardRecruitTaskVO>>() {
			}.getType();
			
			List<BoardRecruitTaskVO> tasks = gson.fromJson(param.getTaskInfoJSON(), taskType);
			tasks.forEach(t ->{
				t.setRegUserId(regUserId);
				t.setBoardRecruitSeq(item.getSeq());
			});
			
			mapper.addRecruitTask(tasks);
			
			List<BoardRecruitTaskVO> afterTaskData = findRecruitTaskByRecruitSeq(item.getSeq());
			logEditService.insertAddLog(req, afterTaskData);
		}

		
		return item.getSeq();
	}

	/**
	 * @param param 채용 수정 정보
	 * @param req req
	 * @retur 수정 성공 여부n
	 */
	public boolean editRecruit(final BoardRecruitEditPO param, final HttpServletRequest req) {
		
		BoardRecruitVO beforeData = findRecruitBySeq(param.getSeq());
		
		String editUserId = SessionUtil.getAuthUserId();
		
		BoardRecruitVO item = new BoardRecruitVO();
		item.setSeq(param.getSeq());
		item.setCodeLangType(param.getCodeLang());
		item.setCodeRecruitType(param.getCodeRecruitTP());
		item.setCodeRecruitStateType(param.getCodeRecruitST());
		item.setTitle(param.getTitle());
		if(param.getInputTypeFlag().equals("Y")){
			item.setContentTitle(param.getContentTitle());
			item.setContentComment(param.getContentComment());
			
			//채용 정보 관련 내용 수정
			
			List<BoardRecruitTaskVO> beforeTaskDatas = findRecruitTaskByRecruitSeq(item.getSeq());
			
			Gson gson = new Gson();
			
			//삭제 처리
			Type deleteTaskType = new TypeToken<List<Integer>>() {
			}.getType();
			
			List<Integer> deleteTeskSeqList = gson.fromJson(param.getDeleteTaskJSON(), deleteTaskType);
			
			if(deleteTeskSeqList.size()>0){
				BoardRrecruitTaskDeletePO delItem = new BoardRrecruitTaskDeletePO();
				delItem.setRecruitSeq(item.getSeq());
				delItem.setDeleteSeqs(deleteTeskSeqList);
				delItem.setEditUserId(editUserId);
				
				mapper.deleteRecruitTasks(delItem);
			}
			
			//수정 처리
			Type taskType = new TypeToken<List<BoardRecruitTaskEditPO>>() {
			}.getType();
			
			List<BoardRecruitTaskEditPO> tasks = gson.fromJson(param.getTaskInfoJSON(), taskType);
			
			List<BoardRecruitTaskEditPO> editList = tasks.stream()
				.filter(t -> {return t.getSeq() > 0 && StringUtils.isNotEmpty(t.getEditFlag()) && t.getEditFlag().equals("Y");})
				.collect(Collectors.toList());
			editList.forEach(tItem ->{
				tItem.setEditUserId(editUserId);
				tItem.setBoardRecruitSeq(item.getSeq());
				mapper.editRecruitTask(tItem);
			});
			
			List<BoardRecruitTaskEditPO> addTaskList = tasks.stream()
					.filter(t -> {return t.getSeq() == 0;})
					.collect(Collectors.toList());
			addTaskList.forEach(t ->{
				t.setBoardRecruitSeq(item.getSeq());
				t.setRegUserId(editUserId);
			});
			
			
			if(addTaskList.size() > 0){
				mapper.addRecruitTask2(addTaskList);
			}
			
			List<BoardRecruitTaskVO> afterTaskDatas = findRecruitTaskByRecruitSeq(item.getSeq());
			
			logEditService.insertEditLog(req, beforeTaskDatas, afterTaskDatas);
			
			
		}else{
			item.setContent(param.getContent());
		}
		
		item.setViewFlag(param.getViewFlag());
		item.setStartDate(DateUtil.getDate(param.getStartDate(), "yyyy-MM-dd"));
		
		if(StringUtils.isNotEmpty(param.getEndDate())){
			item.setEndDate(DateUtil.getDate(param.getEndDate()+" 23:59:59", "yyyy-MM-dd HH:mm:ss"));
		}
		
		item.setEditUserId(editUserId);
		
		mapper.editRecruit(item);
		
		BoardRecruitVO afterData = findRecruitBySeq(param.getSeq());
		
		logEditService.insertEditLog(req, beforeData, afterData);
		
		return true;
	}

	/**
	 * @param seq 채용 식별자
	 * @param req req
	 * @return 삭제 성공 여부
	 */
	public boolean deleteRecruit(final int seq, final HttpServletRequest req) {
		BoardRecruitVO beforeData = findRecruitBySeq(seq);
		
		String editUserId = SessionUtil.getAuthUserId();
		
		BoardRecruitVO item = new BoardRecruitVO();
		item.setSeq(seq);
		item.setEditUserId(editUserId);
		
		mapper.deleteRecruit(item);
		
		BoardRecruitVO afterData = findRecruitBySeq(seq);
		
		logEditService.insertEditLog(req, beforeData, afterData);
		
		return true;
	}
	
	
	/**
	 * 채용 상태를 변경하는 스케줄러
	 * 매일 0시 0분 1초에 실행
	 */
	@Scheduled(cron = "1 0 0 * * *")
	public void checkStatusRecruit(){
		
		if(!IpUtil.getServerHostName().equals(SCHEDULER_HOSTNAME)){
			return;
		}
		
		//접속로그 집계 테이블에 입력
		log.debug("*****************************************");
		log.debug("채용 상태 변경 시작");
		
		//진행 중인 채용을 마감으로 변경
		mapper.updateRecruitEnd2Ing();
		//대기 중인 채용을 진행으로 변경
		mapper.updateRecruitIng2Wait();
		log.debug("*****************************************");
	}



}
