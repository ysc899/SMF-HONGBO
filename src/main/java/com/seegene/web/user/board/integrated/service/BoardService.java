package com.seegene.web.user.board.integrated.service;

import java.io.File;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seegene.web.admin.board.integrated.vo.BoardDefaultFileVO;
import com.seegene.web.admin.board.integrated.vo.BoardDefaultSlaveVO;
import com.seegene.web.admin.board.integrated.vo.BoardIntegratedFileViewRO;
import com.seegene.web.admin.board.integrated.vo.BoardOptInfoRO;
import com.seegene.web.admin.faq.integrated.vo.FaqIntegratedResultRO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.FileComponent;
import com.seegene.web.common.SearchIntegrateSearchPaggingPO;
import com.seegene.web.common.StringUtil;
import com.seegene.web.repository.mariadb.BoardIntegratedMapper;
import com.seegene.web.user.board.integrated.vo.BoardListRO;
import com.seegene.web.user.board.integrated.vo.BoardViewNextPreRO;
import com.seegene.web.user.board.integrated.vo.BoardViewRO;

@Service
public class BoardService {
	
	@Autowired
	private BoardIntegratedMapper mapper;
	
	@Autowired
	private FileComponent fileComponent;
	
	/** 기본 파일 경로 */
	private final String FILE_PATH = "boardIntegrated";

	public CommonListReuslt<BoardListRO> findBoardList(final int masterSeq, final SearchIntegrateSearchPaggingPO param, final BoardOptInfoRO option, final Locale locale) {
		
		
		List<BoardListRO> content = this.findBoardListContent(masterSeq, param, option, locale);
		
		int count = mapper.countUserBoardIntegratedList(param);
		
		CommonListReuslt<BoardListRO> result = new CommonListReuslt<>(content, count, param);
		
		return result;
	}
	
	
	public List<BoardListRO> findBoardListContent(final int masterSeq, final SearchIntegrateSearchPaggingPO param, final Locale locale){
		BoardOptInfoRO option = this.findMasterOptBySeq(masterSeq);
		
		return this.findBoardListContent(masterSeq, param, option, locale);
		
	}
	public List<BoardListRO> findBoardListContent(final int masterSeq, final SearchIntegrateSearchPaggingPO param, final BoardOptInfoRO option, final Locale locale){
		
//		if(option.getOptThumFlag().equals("Y")){
//			param.setLimit(12);
//		}
		param.setMasterSeq(masterSeq);
		param.setMybatisPagging();
		param.setLangType(locale.getLanguage());
		
		
		List<BoardListRO> content = mapper.findUserBoardIntegratedList(param);
		
		//신규 검사일경우만
		if(2 == masterSeq){
			
			for(BoardListRO item : content){
			 	try {
//					item.setContent(StringUtil.removeHtmlTag(item.getContent()));
					item.setContent(StringUtil.removeHtmlTagNotI(item.getContent()));
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		
		if(option.getOptThumFlag().equals("Y")){
			content.forEach(t ->{
				
				BoardDefaultSlaveVO fParam = new BoardDefaultSlaveVO();
				fParam.setBoardDefaultMasterSeq(masterSeq);
				fParam.setSeq(t.getSeq());
				
				List<BoardIntegratedFileViewRO> files = mapper.findBoardIntegratedFilesViewBySeq(fParam);
				
				//섬네일 파일 처리
				BoardIntegratedFileViewRO thumFile = files.stream().filter(f -> {return f.getThumFlag().equals("Y");}).findFirst().orElse(null);
				if(thumFile != null){
					try{
						t.setThumContent(fileComponent.getImageToBase64(FILE_PATH + File.separator + thumFile.getFilePath()));
					}catch(Exception e){
						t.setThumContent("");
					}
				}else{
					t.setThumContent("");
				}
			});
		}
		return content;
	}
	
	public List<BoardListRO> findBoardNoticeList(int masterSeq) {
		return mapper.findBoardNoticeList(masterSeq);
	}
	
	/**
	 * @param masterSeq 부모 식별자
	 * @return 게시판 옵션
	 */
	public BoardOptInfoRO findMasterOptBySeq(final int masterSeq){
		
		return mapper.findMasterOptBySeq(masterSeq);
	}


	public BoardViewRO findBoardView(final int masterSeq,final int seq, final BoardOptInfoRO option,
			final Locale locale) {
		
		BoardDefaultSlaveVO param = new BoardDefaultSlaveVO();
		param.setBoardDefaultMasterSeq(masterSeq);
		param.setSeq(seq);
		param.setLangType(locale.getLanguage());
		
		BoardViewRO result = mapper.findUserBoardIntegratedViewBySeq(param );
		
		if(result != null){
			//조회수 증가
			mapper.updateBoardHit(param);
			
			//첨부파일 옵션이 있으면 첨부파일 처리
			if(option.getOptFileFlag().equals("Y")){
				List<BoardIntegratedFileViewRO> files = mapper.findBoardIntegratedFilesViewBySeq(param);
				
				// 첨부파일들 처리
				result.setFiles(files.stream().filter(f -> {return !f.getThumFlag().equals("Y");}).collect(Collectors.toList()));
			}
			
			//이전 다음 처리
			List<BoardViewNextPreRO> nextPre = mapper.findBoardNextPreBySeq(param);
			
			BoardViewNextPreRO pre = nextPre.stream().filter(t ->{return t.getType().equals("pre");}).findFirst().orElse(null);
			if(pre == null){
				pre = new BoardViewNextPreRO();
				pre.setSeq(0);
			}
			result.setPreBoard(pre);
			
			BoardViewNextPreRO next = nextPre.stream().filter(t ->{return t.getType().equals("next");}).findFirst().orElse(null);
			if(next == null){
				next = new BoardViewNextPreRO();
				next.setSeq(0);
			}
			result.setNextBoard(next);
		
		}
		return result;
	}


	public void findBoardThum(final int masterSeq, final int seq,final HttpServletRequest request,
			final HttpServletResponse response) {
		BoardDefaultSlaveVO param = new BoardDefaultSlaveVO();
		param.setBoardDefaultMasterSeq(masterSeq);
		param.setSeq(seq);
		
		
		List<BoardIntegratedFileViewRO> files = mapper.findBoardIntegratedFilesViewBySeq(param);
		
		//섬네일 파일 처리
		BoardIntegratedFileViewRO thumFile = files.stream().filter(f -> {return f.getThumFlag().equals("Y");}).findFirst().orElse(null);
		if(thumFile != null){
			try{
				String thumFilePath = thumFile.getFilePath();
				
				fileComponent.streamImageFile(FILE_PATH, thumFilePath, request, response);
			}catch(Exception e){
				findBoardContentThum(param, request, response);
			}
		}else{
			findBoardContentThum(param, request, response);
		}
		
	}
	private void findBoardContentThum(BoardDefaultSlaveVO param,final HttpServletRequest request,
			final HttpServletResponse response){
		BoardViewRO result = mapper.findUserBoardIntegratedViewBySeq(param );
		if(result != null){
			
			Document doc = Jsoup.parse(result.getContent());
			Elements imgs = doc.getElementsByTag("img");
			
			if (imgs.size() > 0) {
				Element img = imgs.get(0);
				String imgData = img.attr("src");
				fileComponent.streamImageString(imgData, request, response);
			}
		}
	}
	
	

	public void downloadBoardFile(final int masterSeq, final int seq, final int fileSeq,final HttpServletRequest request,final HttpServletResponse response) {
		BoardDefaultFileVO param = new BoardDefaultFileVO();
		param.setSeq(fileSeq);
		param.setBoardDefaultSlaveSeq(seq);
		
		BoardDefaultFileVO fileVO = mapper.findBoarddIntegratedFileInfo(param);
		
		if(fileVO == null){
			return;
		}
		mapper.updateBoardFileHit(param);
		fileComponent.downloadFile(FILE_PATH, fileVO.getFilePath(), fileVO.getFileName(), request, response);
			
	}

	
	
	//메인용
	public List<BoardListRO> findMainBoardListContent(final int masterSeq, final SearchIntegrateSearchPaggingPO param , String lang){
		
		param.setLimit(6);
		param.setMasterSeq(masterSeq);
		param.setMybatisPagging();
		param.setLangType(lang);
		
		
		List<BoardListRO> content = mapper.findUserBoardIntegratedList(param);
		
		return content;
	}
	
	/**
	 * @param language 언어
	 * @return 언어에 해당하는 모든 게시판 마스터 seq
	 */
	public List<Integer> findLanguageBoards(final String language){
		return mapper.findLanguageBoards(language);
	}



}
