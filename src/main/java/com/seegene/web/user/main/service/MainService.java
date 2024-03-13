package com.seegene.web.user.main.service;

import java.math.BigInteger;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.seegene.web.admin.board.integrated.vo.BoardOptInfoRO;
import com.seegene.web.admin.code.service.CodeService;
import com.seegene.web.admin.code.vo.CodeSlaveRO;
import com.seegene.web.admin.inspection.test.service.InspectionTestService;
import com.seegene.web.admin.inspection.test.vo.InspectionTestSearchOption;
import com.seegene.web.admin.inspection.test.vo.MWT001R1ListRO;
import com.seegene.web.admin.log.device.service.DeviceService;
import com.seegene.web.admin.main.banner.main.service.MainBannerService;
import com.seegene.web.admin.main.banner.main.vo.MainUserBannerListRO;
import com.seegene.web.admin.main.banner.sub.service.MainSubBannerService;
import com.seegene.web.admin.main.banner.sub.vo.MainUserBannerSubListRO;
import com.seegene.web.admin.main.popup.service.MainPopupService;
import com.seegene.web.admin.main.popup.vo.MainPopupUserRO;
import com.seegene.web.admin.menu.user.vo.MenuVO;
import com.seegene.web.auth.vo.DB2TrmsLoginVO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.DateUtil;
import com.seegene.web.common.FileComponent;
import com.seegene.web.common.InitComponent;
import com.seegene.web.common.SearchIntegrateSearchPaggingPO;
import com.seegene.web.common.SessionUtil;
import com.seegene.web.common.UserSearchPaggingCommonPO;
import com.seegene.web.repository.db2.DB2UserLoginMapper;
import com.seegene.web.repository.mariadb.MainRollingMapper;
import com.seegene.web.user.board.integrated.service.BoardService;
import com.seegene.web.user.board.integrated.vo.BoardListRO;
import com.seegene.web.user.board.recruit.service.RecruitService;
import com.seegene.web.user.board.recruit.vo.RecruitListRO;
import com.seegene.web.user.board.recruit.vo.RecruitSearchPO;
import com.seegene.web.user.customer.healthinfo.service.HealthInfoService;
import com.seegene.web.user.customer.healthinfo.vo.HealthInfoUserListRO;
import com.seegene.web.user.customer.notice.service.NoticeService;
import com.seegene.web.user.customer.notice.vo.NoticeListRO;
import com.seegene.web.user.customer.notice.vo.NoticeSearchPO;
import com.seegene.web.user.customer.webzine.service.WebzineService;
import com.seegene.web.user.customer.webzine.vo.WebzineListRO;
import com.seegene.web.user.customer.webzine.vo.WebzineSearchPO;
import com.seegene.web.user.faq.service.FaqService;
import com.seegene.web.user.faq.vo.FaqUserListRO;
import com.seegene.web.user.main.vo.DevicePO;
import com.seegene.web.user.main.vo.MainResultRO;
import com.seegene.web.user.main.vo.MainSearchResultRO;
import com.seegene.web.user.main.vo.RollingRO;
import com.seegene.web.user.menu.service.UserMenuService;
import com.seegene.web.user.promotion.service.PromotionUserService;
import com.seegene.web.user.promotion.vo.PromotionSearchPO;
import com.seegene.web.user.promotion.vo.PromotionUserListRO;
import com.seegene.web.user.task.request.service.RequestUserService;
import com.seegene.web.user.task.request.vo.RequestDataRO;
import com.seegene.web.user.task.vessel.service.VesselUserService;
import com.seegene.web.user.task.vessel.vo.VesselUserListRO;

@Service
public class MainService {

	@Autowired
	private CodeService codeService;

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private FaqService faqService;

	@Autowired
	private NoticeService noticeService;

	@Autowired
	private WebzineService webzineService;

	@Autowired
	private HealthInfoService healthInfoService;
	
	@Autowired
	private RecruitService recruitService;
	
	@Autowired
	private PromotionUserService promotionUserService; 
	
	@Autowired
	private RequestUserService requestUserService;
	
	@Autowired
	private VesselUserService vesselUserService;

	@Autowired
	private InspectionTestService inspectionTestService;
	
	@Autowired
	private UserMenuService userMenuService;

	@Autowired
	private MainRollingMapper rollingMapper;
	
	@Autowired
	private MainBannerService mainBannerService;
	
	@Autowired
	private MainSubBannerService mainSubBannerService;
	
	@Autowired
	private MainPopupService mainPopupService;
	
	@Autowired
	private InitComponent initComponent;
	
	@Autowired
	private FileComponent fileComponent;
	
	@Autowired
	private DeviceService deviceService;
	
	//TRMS 접근용
	@Autowired
	private DB2UserLoginMapper db2UserLoginMapper;
	
	@Value("${trms.login.url}")
	private String TRMS_URL;
	
	

	private final Map<String, List<RollingRO>> rollingMap = new HashMap<>();

	private final Map<String, List<BoardListRO>> board1Map = new HashMap<>();

	private final Map<String, List<NoticeListRO>> board2Map = new HashMap<>();

	private final Map<String, List<WebzineListRO>> board3Map = new HashMap<>();
	
	private final Map<String, List<WebzineListRO>> webzine_en = new HashMap<>();

	private final Map<String, List<HealthInfoUserListRO>> healthInfoMap = new HashMap<>();
	

	private final Map<String, List<MainUserBannerListRO>> mainBannerMap = new HashMap<>();
	private final Map<String, List<MainUserBannerSubListRO>> subBannerMap = new HashMap<>();
	
	private final Map<String, List<MainPopupUserRO>> popupMap = new HashMap<>();

	public void initMain() {

		rollingMap.clear();

		List<CodeSlaveRO> langCodes = codeService.findLangCode();

		List<RollingRO> rollingList = rollingMapper.userRollingList();
		
		List<MainUserBannerListRO> mainBannerList = mainBannerService.findUserBannerList();
		
		List<MainUserBannerSubListRO> subBannerList = mainSubBannerService.findUserSubBannerList();
		
		List<MainPopupUserRO> popupList = mainPopupService.findUserPopupList();

		langCodes.forEach(langCode -> {

			String lang = langCode.getSlaveCode();

			List<RollingRO> langRolling = rollingList.stream().filter(t -> {
				return t.getCodeLangType().equals(lang);
			}).sorted().collect(Collectors.toList());

			rollingMap.put(lang, langRolling);
			
			List<MainUserBannerListRO> langMainBanner = mainBannerList.stream().filter(t -> {
				return t.getCodeLangType().equals(lang);
			}).sorted().collect(Collectors.toList());
			
			mainBannerMap.put(lang, langMainBanner);
			
			List<MainUserBannerSubListRO> langSubBanner = subBannerList.stream().filter(t -> {
				return t.getCodeLangType().equals(lang);
			}).sorted().collect(Collectors.toList());
			
			subBannerMap.put(lang, langSubBanner);
			
			List<MainPopupUserRO> langPopup = popupList.stream().filter(t -> {
				return t.getCodeLangType().equals(lang);
			}).collect(Collectors.toList());
			
			popupMap.put(lang, langPopup);
			

			if (lang.equals("ko")) {
				board1Map.put(lang, boardService.findMainBoardListContent(1, new SearchIntegrateSearchPaggingPO(), lang));
			}else if(lang.equals("en")){
				board1Map.put(lang, boardService.findMainBoardListContent(1, new SearchIntegrateSearchPaggingPO(), lang));				
			}

			board2Map.put(lang, noticeService.findMainNoticeListContent(lang));

			board3Map.put(lang, webzineService.findMainWebzineInfoMoreList(lang));

			
			UserSearchPaggingCommonPO healthInfoParam = new UserSearchPaggingCommonPO();
			healthInfoParam.setLimit(3);
			healthInfoMap.put(lang, healthInfoService.findHealthInfoMoreList(healthInfoParam, lang));

		});

	}

	public MainResultRO getMainInfo(final Locale locale) {

		MainResultRO result = new MainResultRO();

		String lang = locale.getLanguage();

		result.setRolling(rollingMap.get(lang));
		result.setMainBanners(mainBannerMap.get(lang));
		result.setSubBanners(subBannerMap.get(lang));
		result.setPopups(popupMap.get(lang));
		if (lang.equals("ko")) {
			/*새소식 시작*/
			List<BoardListRO> board1 = board1Map.get(lang);
			final Date now = new Date();
			board1.forEach(t -> {
				int diff = DateUtil.dayDiffDate(t.getRegDate(), now); /*수정일에서 등록일로 변경*/
				if (diff > 6) { /*1일에서 7일로 변경*/ 
					t.setNewFlag("N");
				} else {
					t.setNewFlag("Y");
				}
			});
			int newCnt = 0;
			for (int i = 0; i < board1.size(); i++) {
				 if("Y".equals(board1.get(i).getNewFlag())){
					 newCnt += 1;
				 };
			}
			result.setBoard1(board1);
			result.setBoard1_newYn(newCnt);
			/*새소식 종료*/
			
			/*공문 시작*/
			List<NoticeListRO> board2 = board2Map.get(lang);
			board2.forEach(t -> {
				int diff = DateUtil.dayDiffDate(t.getRegDate(), now); /*수정일에서 등록일로 변경*/

				if (diff > 6) { /*1일에서 7일로 변경*/
					t.setNewFlag("N");
				} else {
					t.setNewFlag("Y");
				}
			});
			int newCnt2 = 0;
			for (int i = 0; i < board2.size(); i++) {
				 if("Y".equals(board2.get(i).getNewFlag())){
					 newCnt2 += 1;
				 };
			}
			
			result.setBoard2(board2);
			result.setBoard2_newYn(newCnt2);
			/*공문 종료*/
			
			/*학술제작물 시작*/
			List<WebzineListRO> board3 = board3Map.get(lang);
			board3.forEach(t -> {
				int diff = DateUtil.dayDiffDate(t.getRegDate(), now); /*수정일에서 등록일로 변경*/
				if (diff > 6) { /*1일에서 7일로 변경*/
					t.setNewFlag("N");
				} else {
					t.setNewFlag("Y");
				}
			});
			int newCnt3 = 0;
			for (int i = 0; i < board3.size(); i++) {
				 if("Y".equals(board3.get(i).getNewFlag())){
					 newCnt3 += 1;
				 };
			}
			result.setBoard3(board3);
			result.setBoard3_newYn(newCnt3);
			/*학술제작물 종료*/
			
			/*ONE CLICK 건강정보 시작*/
			List<HealthInfoUserListRO> healthInfo = healthInfoMap.get(lang);
			healthInfo.forEach(t -> {
				int diff = DateUtil.dayDiffDate(t.getRegDate(), now); /*수정일에서 등록일로 변경*/
				if (diff > 6) { /*1일에서 7일로 변경*/
					t.setNewFlag("N");
				} else {
					t.setNewFlag("Y");
				}
			});
			int newCnt4 = 0;
			for (int i = 0; i < healthInfo.size(); i++) {
				 if("Y".equals(healthInfo.get(i).getNewFlag())){
					 newCnt4 += 1;
				 };
			}
			result.setHealthInfos(healthInfoMap.get(lang));
			result.setOneClick_newYn(newCnt4);
			/*ONE CLICK 건강정보 종료*/
			
		} else if (lang.equals("en")){	
			
			System.out.println("########## en #############");
			
			webzine_en.put(lang, webzineService.webzine_en_list(lang));
			
		  /*ONE CLICK Webzine*/	
			final Date now = new Date();
			List<WebzineListRO> webzine = webzine_en.get(lang);
			webzine.forEach(t -> {
				int diff = DateUtil.dayDiffDate(t.getRegDate(), now); /*수정일에서 등록일로 변경*/
				if (diff > 6) { /*1일에서 7일로 변경*/
					t.setNewFlag("N");
				} else {
					t.setNewFlag("Y");
				}
			});
			int webzineCnt = 0;
			for (int i = 0; i < webzine.size(); i++) {
				 if("Y".equals(webzine.get(i).getNewFlag())){
					 webzineCnt += 1;
				 };
			}
			result.setWebzine(webzine);
			result.setWebzine_newYn(webzineCnt);
		}
		return result;
	}

	public MainSearchResultRO allSearch(final String searchKeyword, final Locale locale,final HttpServletRequest req ) {

		MainSearchResultRO result = new MainSearchResultRO();
		int resultCount = 0;
		result.setSearchKeyword(searchKeyword);

		String language = locale.getLanguage();
		UserSearchPaggingCommonPO param = new UserSearchPaggingCommonPO();
		param.setSearchKeyword(searchKeyword);
		param.setLimit(3);

		// 공문
		NoticeSearchPO noticeParam = new NoticeSearchPO();
		noticeParam.setSearchKeyword(searchKeyword);
		noticeParam.setLimit(3);

		CommonListReuslt<NoticeListRO> findNoticeList = noticeService.findNoticeList(noticeParam, locale);
		MenuVO noticeMenu = userMenuService.getUrl2Menu(language, "/customer/notice/index.do");
		result.setNoticeMenu(noticeMenu);
		result.setNoticeList(findNoticeList);
		resultCount += findNoticeList.getTotalElements();

		// 게시판 리스트 가져오기
		List<Integer> boardList = boardService.findLanguageBoards(language);
		result.setBoards(new HashMap<>());
		for (int boardSeq : boardList) {
			MenuVO boardMenu = userMenuService.getUrl2Menu(language, "/board/" + boardSeq + "/index.do");
			if (boardMenu != null) {
				BoardOptInfoRO opt = boardService.findMasterOptBySeq(boardSeq);
				SearchIntegrateSearchPaggingPO boardParam = new SearchIntegrateSearchPaggingPO();
				boardParam.setSearchKeyword(searchKeyword);
				boardParam.setLimit(3);
				opt.setOptThumFlag("N");
				CommonListReuslt<BoardListRO> findBoardList = boardService.findBoardList(boardSeq, boardParam, opt,
						locale);
				result.getBoards().put(boardMenu, findBoardList);
				resultCount += findBoardList.getTotalElements();
			}
		}
		// faq 리스트 가져오기
//		List<Integer> faqList = faqService.findLanguageFaqs(language);
//		result.setFaqs(new HashMap<>());
//		for (int faqSeq : faqList) {
//			MenuVO faqMenu = userMenuService.getUrl2Menu(language, "/faq/special/index.do");
//			if (faqMenu != null) {
//				SearchIntegrateSearchPaggingPO faqParam = new SearchIntegrateSearchPaggingPO();
//				faqParam.setSearchKeyword(searchKeyword);
//				faqParam.setLimit(3);
//				faqParam.setMasterSeq(faqSeq);
//				CommonListReuslt<FaqUserListRO> findFaqList = faqService.findMainSearchFaqList(faqParam);
//				result.getFaqs().put(faqMenu, findFaqList);
//				resultCount += findFaqList.getTotalElements();
//			}
//		}
		//faq
		MenuVO faqMenu = userMenuService.getUrl2Menu(language, "/faq/special/index.do");
		SearchIntegrateSearchPaggingPO faqParam = new SearchIntegrateSearchPaggingPO();
		faqParam.setSearchKeyword(searchKeyword);
		faqParam.setLimit(3);
		CommonListReuslt<FaqUserListRO> findFaqList = faqService.findMainSearchFaqList(faqParam);
		resultCount += findFaqList.getTotalElements();
		result.setFaqMenu(faqMenu);
		result.setFaqList(findFaqList);
		
		//채용 정보
		RecruitSearchPO recruitParam = new RecruitSearchPO();
		recruitParam.setSearchKeyword(searchKeyword);
		recruitParam.setLimit(3);
		
		CommonListReuslt<RecruitListRO> findRecruitList = recruitService.findRecruitList(recruitParam, locale);
		MenuVO recruitMenu = userMenuService.getUrl2Menu(language, "/board/recruit/index.do");
		result.setRecruitMenu(recruitMenu);
		result.setRecruitList(findRecruitList);
		resultCount += findRecruitList.getTotalElements();
		
		
		
		// 원클릭 건강 정보
		CommonListReuslt<HealthInfoUserListRO> findHealthInfoList = healthInfoService.findHealthInfoList(param, locale);
		MenuVO healthInfoMenu = userMenuService.getUrl2Menu(language, "/customer/healthinfo/index.do");
		result.setHealthInfoMenu(healthInfoMenu);
		result.setHealthInfoList(findHealthInfoList);
		resultCount += findHealthInfoList.getTotalElements();
		// 원클릭 웹진
		WebzineSearchPO webzineParam = new WebzineSearchPO();
		webzineParam.setSearchKeyword(searchKeyword);
		webzineParam.setLimit(3);
		CommonListReuslt<WebzineListRO> findWebzineInfoList = webzineService.findWebzineInfoMainSearch(webzineParam,
				locale);
		MenuVO webzineMenu = userMenuService.getUrl2Menu(language, "/customer/webzine/index.do");
		result.setWebzineMenu(webzineMenu);
		result.setWebzineInfoList(findWebzineInfoList);
		resultCount += findWebzineInfoList.getTotalElements();
		
		//브로슈어
		webzineParam.setCodeEbookCatType("brochure");
		CommonListReuslt<WebzineListRO> promotionBookList = webzineService.findWebzineInfoMainSearch(webzineParam,
				locale);
		MenuVO promotionBookMenu = userMenuService.getUrl2Menu(language, "/promotion/index.do#book");
		result.setPromotionBookMenu(promotionBookMenu);
		result.setPromotionBookList(promotionBookList);
		resultCount += promotionBookList.getTotalElements();
		
		//홍보동영상
		PromotionSearchPO promotionSearchPO = new PromotionSearchPO();
		promotionSearchPO.setCodePromotionType("video");
		promotionSearchPO.setSearchKeyword(searchKeyword);
		
		CommonListReuslt<PromotionUserListRO> findVideoList = promotionUserService.findMainSearchPromotionList(promotionSearchPO, locale);
		MenuVO promotionVideoMenu = userMenuService.getUrl2Menu(language, "/promotion/index.do#video");
		result.setPromotionVideoMenu(promotionVideoMenu);
		result.setPromotionVideoList(findVideoList);
		resultCount += findVideoList.getTotalElements();
		
		//홍보사진
		promotionSearchPO.setCodePromotionType("image");
		
		CommonListReuslt<PromotionUserListRO> findImageList = promotionUserService.findMainSearchPromotionList(promotionSearchPO, locale);
		MenuVO promotionImageMenu = userMenuService.getUrl2Menu(language, "/promotion/index.do#image");
		result.setPromotionImageMenu(promotionImageMenu);
		result.setPromotionImageList(findImageList);
		resultCount += findImageList.getTotalElements();
		
		//검사의뢰서
		CommonListReuslt<RequestDataRO> requestList = requestUserService.findRequestMainSearchList(language, param);
		MenuVO requestMenu = userMenuService.getUrl2Menu(language, "/task/request/index.do");
		result.setRequestList(requestList);
		result.setRequestMenu(requestMenu);
		resultCount += requestList.getTotalElements();
		
		//검체용기
		CommonListReuslt<VesselUserListRO> vesselList = vesselUserService.findMainSearchVesselList(param, locale);
		MenuVO vesselMenu = userMenuService.getUrl2Menu(language, "/task/vessel/index.do");
		result.setVesselList(vesselList);
		result.setVesselMenu(vesselMenu);
		resultCount += vesselList.getTotalElements();
		
		//검사항목조회
		InspectionTestSearchOption testParam = new InspectionTestSearchOption();
		testParam.setSearchKeyword(searchKeyword);
		CommonListReuslt<MWT001R1ListRO> testList = inspectionTestService.findInspectionTestMainSearchList(testParam, language, req);
		MenuVO testMenu = userMenuService.getUrl2Menu(language, "/task/test/index.do");
		result.setTestList(testList);
		result.setTestMenu(testMenu);
		resultCount += testList.getTotalElements();
		
		
		

		result.setTotalCount(resultCount);
		return result;
	}
	

	public void reload() {
		initComponent.init();
	}

	public void getMainBannerImage(final int seq, final Locale locale, final HttpServletRequest request, final HttpServletResponse response) {
		
		fileComponent.streamImageFile(MainBannerService.FILE_PATH, mainBannerMap.get(locale.getLanguage()).get(seq).getFilePath(), request, response);
	}
	
	public void deviceLog(final DevicePO param, final HttpServletRequest req){
		deviceService.addDeviceLog(param, req);
	}

	public String getTrms(final HttpServletRequest request) {
		
		if(SessionUtil.isLogin() && SessionUtil.getUserRoleType() == SessionUtil.USER){
			
			int result = 0;
			String trmsUrl = "";
			Random random = ThreadLocalRandom.current(); 
			BigInteger base = BigInteger.valueOf(10000000);  
			int randomBits = 30;

			BigInteger rnd_01 = base.add(new BigInteger(randomBits, random));
			BigInteger rnd_02 = base.add(new BigInteger(randomBits, random));
			
			String key_val = rnd_01.toString().concat(rnd_02.toString());
			
			DB2TrmsLoginVO trmsParam = new DB2TrmsLoginVO("NML", SessionUtil.getAuthUserId(), key_val);
			db2UserLoginMapper.callTrmsLogin(trmsParam);
			if(trmsParam.getO_RSTCOD().equals("O")){
				result = 7;
				trmsUrl = TRMS_URL+key_val;
			}
			
			return trmsUrl;
			
		}
		
		return "";
		
	}

}
