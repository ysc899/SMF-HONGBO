package com.seegene.web.admin.board.db2.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seegene.web.admin.board.db2.vo.Db2BoardMappingVO;
import com.seegene.web.admin.board.db2.vo.Db2BoardPO;
import com.seegene.web.admin.board.db2.vo.Db2FilePO;
import com.seegene.web.admin.board.integrated.vo.BoardDefaultSlaveVO;
import com.seegene.web.admin.board.notice.vo.BoardNoticeFileVO;
import com.seegene.web.admin.board.notice.vo.BoardNoticeVO;
import com.seegene.web.common.IpUtil;
import com.seegene.web.common.SessionUtil;
import com.seegene.web.repository.db2.DB2BoardMapper;
import com.seegene.web.repository.mariadb.BoardDb2MappingMapper;

@Service
public class BoardDb2Service {

	
	@Autowired
	private DB2BoardMapper mapper;
	
	@Autowired
	private BoardDb2MappingMapper db2MappingMapper;
	
	/** 공문 기본 시작 seq */
	private final int NOTICE_DEFAULT_SEQ = 200000;
	private final int NEWS_DEFAULT_SEQ = 500000;
	
	
	public void addData(final BoardNoticeVO param, final HttpServletRequest req){
		
		Db2BoardPO item = new Db2BoardPO();
		item.setIUid(SessionUtil.getAuthUserId());
		item.setIIp(IpUtil.getRequestIp(req));
		item.setISeq(NOTICE_DEFAULT_SEQ+param.getSeq());
		item.setICnm("씨젠의료재단");
		item.setIDno(param.getNoticeNumber());
		item.setIDcl("OFF_DOCU");
		item.setITit(param.getTitle());
		item.setICon(param.getContent());
		
		mapper.addBoardData(item);
		
		Db2BoardMappingVO mapping = new Db2BoardMappingVO();
		mapping.setBoardSeq(param.getSeq());
		mapping.setBoardType("OFF_DOCU");
		mapping.setS014seq(item.getISeq());
		
		db2MappingMapper.addDb2Mapping(mapping);
		//TODO 맵핑 데이터 관련은 월요일날 이야기 해보고 하던가 하자
	}
	
	public void addFileData(final BoardNoticeVO noticeData, final List<BoardNoticeFileVO> noticeFileData, final HttpServletRequest req) {
		
		Db2BoardMappingVO sparam = new Db2BoardMappingVO();
		sparam.setBoardType("OFF_DOCU");
		sparam.setBoardSeq(noticeData.getSeq());
		
		Db2BoardMappingVO mapping = db2MappingMapper.findDb2Mapping(sparam);
		if(mapping == null){
			return;
		}
		
		int fileIdx = 1;
		
		for(BoardNoticeFileVO t : noticeFileData){
			if(t.getDeleteFlag().equals("N")){
				Db2FilePO item = new Db2FilePO();
				item.setIUid(SessionUtil.getAuthUserId());
				item.setIIp(IpUtil.getRequestIp(req));
//				item.setISeq(NOTICE_DEFAULT_SEQ+noticeData.getSeq());
				item.setISeq(mapping.getS014seq());
				item.setIFsq(fileIdx++);
				item.setIFpt("/customer/notice/download/"+noticeData.getSeq() +"/"+ t.getSeq()+".do");
				item.setIFnm(t.getFileName());
				item.setIFsnm(t.getFileName());
				
				mapper.addBoardFileData(item);
			}
		}
	}
	

	
	
	public void addData(final BoardDefaultSlaveVO param, final HttpServletRequest req){
		
		Db2BoardPO item = new Db2BoardPO();
		item.setIUid(SessionUtil.getAuthUserId());
		item.setIIp(IpUtil.getRequestIp(req));
		item.setISeq(NEWS_DEFAULT_SEQ+param.getSeq());
		item.setICnm("씨젠의료재단");
		item.setIDno(String.valueOf(NEWS_DEFAULT_SEQ+param.getSeq()));
		item.setIDcl("NOTICE");
		item.setITit(param.getTitle());
		item.setICon(param.getContent());
		
		mapper.addBoardData(item);
		
		Db2BoardMappingVO mapping = new Db2BoardMappingVO();
		mapping.setBoardSeq(param.getSeq());
		mapping.setBoardType("NOTICE");
		mapping.setS014seq(item.getISeq());
		
		db2MappingMapper.addDb2Mapping(mapping);
	}
	
	public void updateBoardData(final BoardNoticeVO param, final HttpServletRequest req){
		
		Db2BoardMappingVO sparam = new Db2BoardMappingVO();
		sparam.setBoardType("OFF_DOCU");
		sparam.setBoardSeq(param.getSeq());
		
		Db2BoardMappingVO mapping = db2MappingMapper.findDb2Mapping(sparam);
		if(mapping == null){
			return;
		}
		
		Db2BoardPO item = new Db2BoardPO();
		item.setIUid(SessionUtil.getAuthUserId());
		item.setIIp(IpUtil.getRequestIp(req));
		item.setISeq(mapping.getS014seq());
		item.setICnm("씨젠의료재단");
		item.setIDno(param.getNoticeNumber());
		item.setIDcl("OFF_DOCU");
		item.setITit(param.getTitle());
		item.setICon(param.getContent());
		
		mapper.updateBoardData(item);
		//TODO 맵핑 데이터 관련은 월요일날 이야기 해보고 하던가 하자
		
	}
	public void updateBoardData(final BoardDefaultSlaveVO param, final HttpServletRequest req){
		
		Db2BoardMappingVO sparam = new Db2BoardMappingVO();
		sparam.setBoardType("NOTICE");
		sparam.setBoardSeq(param.getSeq());
		
		Db2BoardMappingVO mapping = db2MappingMapper.findDb2Mapping(sparam);
		if(mapping == null){
			return;
		}
		
		Db2BoardPO item = new Db2BoardPO();
		item.setIUid(SessionUtil.getAuthUserId());
		item.setIIp(IpUtil.getRequestIp(req));
//		item.setISeq(NEWS_DEFAULT_SEQ+param.getSeq());
		item.setISeq(mapping.getS014seq());
		item.setICnm("씨젠의료재단");
		item.setIDno(String.valueOf(NEWS_DEFAULT_SEQ+param.getSeq()));
		item.setIDcl("NOTICE");
		item.setITit(param.getTitle());
		item.setICon(param.getContent());
		
		mapper.updateBoardData(item);
		//TODO 맵핑 데이터 관련은 월요일날 이야기 해보고 하던가 하자
		
	}
	
	public void deleteBoardData(final BoardNoticeVO param, final HttpServletRequest req){
		
		Db2BoardMappingVO sparam = new Db2BoardMappingVO();
		sparam.setBoardType("OFF_DOCU");
		sparam.setBoardSeq(param.getSeq());
		
		Db2BoardMappingVO mapping = db2MappingMapper.findDb2Mapping(sparam);
		
		if(mapping == null){
			return;
		}
		
		Db2BoardPO item = new Db2BoardPO();
		item.setIUid(SessionUtil.getAuthUserId());
		item.setIIp(IpUtil.getRequestIp(req));
		item.setISeq(mapping.getS014seq());
		
		mapper.deleteBoardData(item);
	}
	
	public void deleteBoardFile(final BoardNoticeVO param, final HttpServletRequest req){
		
		Db2BoardMappingVO sparam = new Db2BoardMappingVO();
		sparam.setBoardType("OFF_DOCU");
		sparam.setBoardSeq(param.getSeq());
		
		Db2BoardMappingVO mapping = db2MappingMapper.findDb2Mapping(sparam);
		if(mapping == null){
			return;
		}
		
		Db2FilePO item = new Db2FilePO();
		item.setIUid(SessionUtil.getAuthUserId());
		item.setIIp(IpUtil.getRequestIp(req));
//		item.setISeq(NOTICE_DEFAULT_SEQ+param.getSeq());
		item.setISeq(mapping.getS014seq());
		
		mapper.deleteBoardFileData(item);
	}

	public void deleteBoardData(final BoardDefaultSlaveVO param, final HttpServletRequest req) {
		
		Db2BoardMappingVO sparam = new Db2BoardMappingVO();
		sparam.setBoardType("NOTICE");
		sparam.setBoardSeq(param.getSeq());
		
		Db2BoardMappingVO mapping = db2MappingMapper.findDb2Mapping(sparam);
		if(mapping == null){
			return;
		}
		
		Db2BoardPO item = new Db2BoardPO();
		item.setIUid(SessionUtil.getAuthUserId());
		item.setIIp(IpUtil.getRequestIp(req));
		item.setISeq(mapping.getS014seq());
		
		mapper.deleteBoardData(item);
	}

	
}
