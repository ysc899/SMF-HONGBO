package com.seegene.web.user.customer.notice.service;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seegene.web.admin.board.notice.vo.BoardFileDownPO;
import com.seegene.web.admin.board.notice.vo.BoardNoticeFileVO;
import com.seegene.web.admin.board.notice.vo.BoardNoticeFileViewRO;
import com.seegene.web.admin.board.notice.vo.BoardNoticeVO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.FileComponent;
import com.seegene.web.repository.mariadb.BoardNoticeMapper;
import com.seegene.web.user.code.service.UserCodeService;
import com.seegene.web.user.customer.notice.vo.NoticeDefaultRO;
import com.seegene.web.user.customer.notice.vo.NoticeListRO;
import com.seegene.web.user.customer.notice.vo.NoticeSearchPO;
import com.seegene.web.user.customer.notice.vo.NoticeViewNextPreRO;
import com.seegene.web.user.customer.notice.vo.NoticeViewRO;

@Service
public class NoticeService {

	@Autowired
	private BoardNoticeMapper mapper;
	
	@Autowired
	private UserCodeService userCodeService;
	
	@Autowired
	private FileComponent fileComponent;
	
	/** 공문 파일 경로 */
	private final String FILE_PATH = "notice";
	
	/**
	 * @param langCode 언어코드
	 * @return 화면에 필요한 기본 데이터
	 */
	public NoticeDefaultRO getDefaultData(final String langCode){
		
		NoticeDefaultRO item = new NoticeDefaultRO();
		item.setCenterCodes(userCodeService.findCodeList("center", langCode));
		
		return item;
	}

	/**
	 * @param param 검색조건
	 * @param locale 언어코드
	 * @return
	 */
	public CommonListReuslt<NoticeListRO> findNoticeList(final NoticeSearchPO param, final Locale locale) {
		
		param.setCodeLangType(locale.getLanguage());
		param.setMybatisPagging();
		
		
		List<NoticeListRO> content = mapper.findUserNoticeList(param);
		
		int count = mapper.countUserNoticeList(param);
		
		content.forEach(t ->{
			t.setRow(count - t.getRow() + 1);
		});
		
		CommonListReuslt<NoticeListRO> result = new CommonListReuslt<>(content, count, param);
		
		return result;
	}
	
	/**
	 * @param param 검색조건
	 * @param locale 언어코드
	 * @return
	 */
	public List<NoticeListRO> getNoticeList(final Locale locale) {
		
		List<NoticeListRO> content = mapper.getUserNoticeList(locale.getLanguage());
		
		return content;
	}

	public NoticeViewRO findNoticeInfo(final int seq, final String language) {
		
		BoardNoticeVO viewParam = new BoardNoticeVO();
		viewParam.setSeq(seq);
		viewParam.setCodeLangType(language);
		
		NoticeViewRO result = mapper.findUserNoticeViewBySeq(viewParam);
		
		if(result != null){
		
			result.setContent(result.getContent().replaceAll("&nbsp;", " "));
			
			mapper.updateNoticeHit(seq);
			List<BoardNoticeFileViewRO> files = mapper.findNoticeFileViewByNoticeSeq(seq);
			result.setFiles(files);
			
			List<NoticeViewNextPreRO> nextPre = mapper.findNoticeNextPreBySeq(viewParam);
			
			NoticeViewNextPreRO pre = nextPre.stream().filter(t ->{return t.getType().equals("pre");}).findFirst().orElse(null);
			if(pre == null){
				pre = new NoticeViewNextPreRO();
				pre.setSeq(0);
			}
			result.setPreNotice(pre);
			
			NoticeViewNextPreRO next = nextPre.stream().filter(t ->{return t.getType().equals("next");}).findFirst().orElse(null);
			if(next == null){
				next = new NoticeViewNextPreRO();
				next.setSeq(0);
			}
			result.setNextNotice(next);
		}
		
		return result;
	}
	
	public void findNoticeThum(final int seq, final String language,  final HttpServletRequest request, final HttpServletResponse response ) {
		
		BoardNoticeVO viewParam = new BoardNoticeVO();
		viewParam.setSeq(seq);
		viewParam.setCodeLangType(language);
		
		NoticeViewRO result = mapper.findUserNoticeViewBySeq(viewParam);
		
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

	public void downloadNoticeFile(final int seq, final int fileSeq, final HttpServletRequest request, final HttpServletResponse response) {
		BoardFileDownPO item = new BoardFileDownPO();
		item.setBoardNoticeSeq(seq);
		item.setBoardNoticeFileSeq(fileSeq);
		
		BoardNoticeFileVO fileVO = mapper.findNoticeFile(item);
		
		if(fileVO == null){
			return;
		}
		
		mapper.updateNoticeFileHit(item);
		
		fileComponent.downloadFile(FILE_PATH, fileVO.getFilePath(), fileVO.getFileName(), request, response);
		
	}
	
	public List<NoticeListRO> findMainNoticeListContent(final String lang){
		NoticeSearchPO param = new NoticeSearchPO();
		param.setCodeLangType(lang);
		param.setLimit(6);
		param.setMybatisPagging();
	
		return mapper.findUserNoticeList(param);
		
	}
}
