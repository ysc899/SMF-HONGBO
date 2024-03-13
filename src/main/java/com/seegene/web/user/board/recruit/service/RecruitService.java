package com.seegene.web.user.board.recruit.service;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seegene.web.admin.board.recruit.vo.BoardRecruitVO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.repository.mariadb.BoardRecruitMapper;
import com.seegene.web.user.board.recruit.vo.RecruitDefaultRO;
import com.seegene.web.user.board.recruit.vo.RecruitListRO;
import com.seegene.web.user.board.recruit.vo.RecruitSearchPO;
import com.seegene.web.user.board.recruit.vo.RecruitViewRO;
import com.seegene.web.user.code.service.UserCodeService;

@Service
public class RecruitService {

	@Autowired
	private BoardRecruitMapper mapper;
	
	
	@Autowired
	private UserCodeService userCodeService;
	
	/**
	 * @param langCode 언어코드
	 * @return 화면에 필요한 기본 데이터
	 */
	public RecruitDefaultRO getDefaultData(final String langCode){
		
		RecruitDefaultRO item = new RecruitDefaultRO();
		item.setRecruitTPCodes(userCodeService.findCodeList("recruitTP", langCode));
		
		return item;
	}

	public CommonListReuslt<RecruitListRO> findRecruitList(final RecruitSearchPO param, final Locale locale) {

		param.setCodeLangType(locale.getLanguage());
		param.setMybatisPagging();
		
		
		List<RecruitListRO> content = mapper.findUserRecruitList(param);
		
		int count = mapper.countUserRecruitList(param);
		
		CommonListReuslt<RecruitListRO> result = new CommonListReuslt<>(content, count, param);
		
		return result;
	}

	public RecruitViewRO findRecruiInfo(final int seq, final String language) {
		
		BoardRecruitVO param = new BoardRecruitVO();
		param.setSeq(seq);
		param.setCodeLangType(language);
		
		RecruitViewRO result = mapper.findUserRecruitViewBySeq(param);
		
		if(result != null){
			
			mapper.updateRecruitHit(param);
			
			if(result.getInputTypeFlag().equals("Y")){
				
				result.setTasks(mapper.findRecruitTaskByRecruitSeq(seq));
			}
		}
		
		
		return result;
	}

//	/**
//	 * @param param 검색조건
//	 * @param locale 언어코드
//	 * @return
//	 */
//	public CommonListReuslt<NoticeListRO> findNoticeList(final NoticeSearchPO param, final Locale locale) {
//		
//	}
//	
//	/**
//	 * @param param 검색조건
//	 * @param locale 언어코드
//	 * @return
//	 */
//	public List<NoticeListRO> getNoticeList(final Locale locale) {
//		
//		List<NoticeListRO> content = mapper.getUserNoticeList(locale.getLanguage());
//		
//		return content;
//	}
//
//	public NoticeViewRO findNoticeInfo(final int seq, final String language) {
//		
//		BoardNoticeVO viewParam = new BoardNoticeVO();
//		viewParam.setSeq(seq);
//		viewParam.setCodeLangType(language);
//		
//		NoticeViewRO result = mapper.findUserNoticeViewBySeq(viewParam);
//		
//		if(result != null){
//			
//			mapper.updateNoticeHit(seq);
//			List<BoardNoticeFileViewRO> files = mapper.findNoticeFileViewByNoticeSeq(seq);
//			result.setFiles(files);
//			
//			List<NoticeViewNextPreRO> nextPre = mapper.findNoticeNextPreBySeq(viewParam);
//			
//			NoticeViewNextPreRO pre = nextPre.stream().filter(t ->{return t.getType().equals("pre");}).findFirst().orElse(null);
//			if(pre == null){
//				pre = new NoticeViewNextPreRO();
//				pre.setSeq(0);
//			}
//			result.setPreNotice(pre);
//			
//			NoticeViewNextPreRO next = nextPre.stream().filter(t ->{return t.getType().equals("next");}).findFirst().orElse(null);
//			if(next == null){
//				next = new NoticeViewNextPreRO();
//				next.setSeq(0);
//			}
//			result.setNextNotice(next);
//		}
//		
//		return result;
//	}
//
//	public void downloadNoticeFile(final int seq, final int fileSeq, final HttpServletRequest request, final HttpServletResponse response) {
//		BoardFileDownPO item = new BoardFileDownPO();
//		item.setBoardNoticeSeq(seq);
//		item.setBoardNoticeFileSeq(fileSeq);
//		
//		BoardNoticeFileVO fileVO = mapper.findNoticeFile(item);
//		
//		if(fileVO == null){
//			return;
//		}
//		
//		mapper.updateNoticeFileHit(item);
//		
//		fileComponent.downloadFile(FILE_PATH, fileVO.getFilePath(), fileVO.getFileName(), request, response);
//		
//	}
	
}
