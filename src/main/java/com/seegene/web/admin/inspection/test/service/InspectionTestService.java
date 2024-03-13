package com.seegene.web.admin.inspection.test.service;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.seegene.web.admin.code.service.CodeService;
import com.seegene.web.admin.code.vo.CodeSlaveRO;
import com.seegene.web.admin.inspection.test.vo.*;
import com.seegene.web.admin.log.edit.service.LogEditService;
import com.seegene.web.common.DateUtil;
import com.seegene.web.common.*;
import com.seegene.web.repository.db2.DB2InspectionTestMapper;
import com.seegene.web.repository.mariadb.InspectionTestEnMapper;
import com.seegene.web.repository.mariadb.InspectionTestMapper;
import com.seegene.web.repository.oracle.OracleInspectionTestMapper;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Transactional
@Service
public class InspectionTestService {

	@Autowired
	private DB2InspectionTestMapper db2Mapper;

	@Autowired
	private InspectionTestMapper mariadbMapper;

	@Autowired
	private InspectionTestEnMapper enTestMapper;

	@Autowired
	private OracleInspectionTestMapper oracleMapper;

	@Autowired
	private CodeService codeService;

	@Autowired
	private LogEditService logEditService;

	@Autowired
	private FileComponent fileComponent;

	private final List<String> SEARCH_CODES = Arrays.asList("TEST_INFO", "MEDI_CLS", "DISS_CLS");
	private final List<String> SEARCH_CODES_EN = Arrays.asList("TEST_INFO_ENG", "MEDI_CLS_ENG", "DISS_CLS_ENG");

	/**
	 * @return 검색 옵션에 사용할 기본 코드들
	 */
	public InspectionTestListDefaultRO listSearchOption() {
		InspectionTestListDefaultRO item = new InspectionTestListDefaultRO();

		//List<DB2CodeRO> results = db2Mapper.findInspectionTestCodes(SEARCH_CODES);
		List<DB2CodeRO> results = oracleMapper.getCommCodeOra(SEARCH_CODES);
		List<DB2CodeRO> testInfoCodes = results.stream().filter(t -> {
			return t.getS002pscd().equals("TEST_INFO");
		}).sorted().collect(Collectors.toList());
		List<DB2CodeRO> mediClsCodes = results.stream().filter(t -> {
			return t.getS002pscd().equals("MEDI_CLS");
		}).sorted().collect(Collectors.toList());
		List<DB2CodeRO> dissClsCodes = results.stream().filter(t -> {
			return t.getS002pscd().equals("DISS_CLS");
		}).sorted().collect(Collectors.toList());

		item.setTestInfos(testInfoCodes);
		item.setMediClss(mediClsCodes);
		item.setDissClss(dissClsCodes);

		return item;
	}

	/**
	 * @return 검색 옵션에 사용할 기본 코드들
	 */
	public InspectionTestListDefaultRO listSearchOptionEn() {
		InspectionTestListDefaultRO item = new InspectionTestListDefaultRO();

		//List<DB2CodeRO> results = db2Mapper.findInspectionTestCodesEn(SEARCH_CODES);
		List<DB2CodeRO> results = oracleMapper.getCommCodeOra(SEARCH_CODES_EN);

		List<DB2CodeRO> testInfoCodes = results.stream().filter(t -> {
			return t.getS002pscd().equals("TEST_INFO_ENG");
		}).sorted().collect(Collectors.toList());
		List<DB2CodeRO> mediClsCodes = results.stream().filter(t -> {
			return t.getS002pscd().equals("MEDI_CLS_ENG");
		}).sorted().collect(Collectors.toList());
		List<DB2CodeRO> dissClsCodes = results.stream().filter(t -> {
			return t.getS002pscd().equals("DISS_CLS_ENG");
		}).sorted().collect(Collectors.toList());

		item.setTestInfos(testInfoCodes);
		item.setMediClss(mediClsCodes);
		item.setDissClss(dissClsCodes);

		return item;
	}

	/**
	 * @param param
	 *            검색 옵션
	 * @return 검색 결과
	 */
	public List<MWT001R1ListRO> findInspectionTestList(final InspectionTestSearchOption param,
													   final HttpServletRequest req) {

		MWT001R1SearchPO searchParam = new MWT001R1SearchPO();

		if (SessionUtil.isLogin()) {
			searchParam.setIUid(SessionUtil.getAuthUserId());
		}

		searchParam.setIIp(IpUtil.getRequestIp(req));
		if (StringUtils.isNotEmpty(param.getTestInfoOption())) {
			searchParam.setISerfnm(param.getTestInfoOption());
		}
		if (StringUtils.isNotEmpty(param.getSearchKeyword())) {
			searchParam.setISernm(param.getSearchKeyword());
		}
		if (StringUtils.isNotEmpty(param.getMediClsOption())) {
			searchParam.setIHak(param.getMediClsOption());
		}
		if (StringUtils.isNotEmpty(param.getDissClsOption())) {
			searchParam.setIIsc("|" + param.getDissClsOption() + "|");
		}

		if (StringUtils.isNotEmpty(param.getSearchAlp())) {
			searchParam.setIAlhnm(param.getSearchAlp());
		}
		if (StringUtils.isNotEmpty(param.getLocale())) {
			searchParam.setLocale(param.getLocale());
		}

		//List<MWT001R1ListRO> inspectionTestList = db2Mapper.inspectionTestList(searchParam);
		List<MWT001R1ListRO> inspectionTestList = oracleMapper.inspectionTestListOra(searchParam);

		return inspectionTestList;

	}

	/**
	 * @param param
	 *            검색 옵션
	 * @return 검색 결과
	 * 영문En
	 */
	public List<MWT001R1ListRO> findInspectionTestListEn(final InspectionTestSearchOption param,
													   final HttpServletRequest req) {

		MWT001R1SearchPO searchParam = new MWT001R1SearchPO();

		if (SessionUtil.isLogin()) {
			searchParam.setIUid(SessionUtil.getAuthUserId());
		}

		searchParam.setIIp(IpUtil.getRequestIp(req));
		if (StringUtils.isNotEmpty(param.getTestInfoOption())) {
			searchParam.setISerfnm(param.getTestInfoOption());
		}
		if (StringUtils.isNotEmpty(param.getSearchKeyword())) {
			searchParam.setISernm(param.getSearchKeyword());
		}
		if (StringUtils.isNotEmpty(param.getMediClsOption())) {
			searchParam.setIHak(param.getMediClsOption());
		}
		if (StringUtils.isNotEmpty(param.getDissClsOption())) {
			searchParam.setIIsc("|" + param.getDissClsOption() + "|");
		}

		if (StringUtils.isNotEmpty(param.getSearchAlp())) {
			searchParam.setIAlhnm(param.getSearchAlp());
		}

		List<MWT001R1ListRO> inspectionTestList = db2Mapper.inspectionTestListEn(searchParam);

		return inspectionTestList;

	}

	/**
	 * @param param
	 *            검색옵션
	 * @param req
	 *            req
	 * @return 한국어 검색결과 리스트
	 */
	public String findInspectionTestKrList(final InspectionTestSearchOption param, final HttpServletRequest req) {
		List<MWT001R1ListRO> findInspectionTestList = this.findInspectionTestList(param, req);

		Gson gson = new Gson();
		String content = gson.toJson(findInspectionTestList);
		return content;
	}

	/**
	 * @param param
	 *            검색옵션
	 * @param req
	 *            req
	 * @return 한국어 검색결과 리스트
	 */
	public String findInspectionTestEnList(final InspectionTestSearchOption param, final HttpServletRequest req) {
		List<MWT001R1ListRO> findInspectionTestList = this.findInspectionTestListEn(param, req);

		// 한글 -> 영문으로 전환 추가 필요한것들 만들어야함

		List<InspectionTestEngListRO> enDataList = enTestMapper.findInspTestEnList();

		findInspectionTestList.forEach(item -> {

			InspectionTestEngListRO enData = enDataList.stream().filter(t -> {
				return t.getF010gcd().equals(item.getF010gcd());
			}).findFirst().orElse(null);

			// if(enData == null){
			// item.setT001day("");
			// }else{
			// item.setT001day(enData.getT001day());
			// }

		});

		Gson gson = new Gson();
		String content = gson.toJson(findInspectionTestList);
		return content;
	}

	public CommonListReuslt<MWT001R1ListRO> findInspectionTestMainSearchList(final InspectionTestSearchOption param,
			final String langCode, final HttpServletRequest req) {
		List<MWT001R1ListRO> findInspectionTestList = this.findInspectionTestList(param, req);
		if (findInspectionTestList == null) {
			findInspectionTestList = new ArrayList<>();
		}

		List<MWT001R1ListRO> resultList = new ArrayList<>();
		int end = 3;
		if (findInspectionTestList.size() < end) {
			end = findInspectionTestList.size();
		}

		for (int i = 0; i < end; i++) {
			resultList.add(findInspectionTestList.get(i));
		}

		if (langCode.equals("en")) {

			// 한글 -> 영문으로 전환 추가 필요한것들 만들어야함

			List<InspectionTestEngListRO> enDataList = enTestMapper.findInspTestEnList();

			resultList.forEach(item -> {

				InspectionTestEngListRO enData = enDataList.stream().filter(t -> {
					return t.getF010gcd().equals(item.getF010gcd());
				}).findFirst().orElse(null);

				// if(enData == null){
				// item.setT001day("");
				// }else{
				// item.setT001day(enData.getT001day());
				// }

			});
		}

		CommonListReuslt<MWT001R1ListRO> result = new CommonListReuslt<>(resultList, findInspectionTestList.size(),
				param);

		return result;

	}

	/**
	 * @param seq
	 *            검사코드
	 * @param req
	 *            req
	 * @return 검사 정보
	 */
	public MWT001R2ViewRO findInspectionTestView(final String seq, final HttpServletRequest req) {

		MWT001R2SearchPO searchParam = new MWT001R2SearchPO();

		if (SessionUtil.isLogin()) {
			searchParam.setIUid(SessionUtil.getAuthUserId());
		} else {
			searchParam.setIUid("");
		}
		searchParam.setIIp(IpUtil.getRequestIp(req));
		searchParam.setIGcd(seq);
		searchParam.setLocale("ko");

		//MWT001R2ViewRO result = db2Mapper.inspectionTestView(searchParam);
		MWT001R2ViewRO result = oracleMapper.inspectionTestViewOra(searchParam);

		return result;
	}

	/**
	 * @param seq
	 *            검사코드
	 * @param req
	 *            req
	 * @return 검사 정보
	 * 영문En
	 */
	public MWT001R2ViewRO findInspectionTestViewEn(final String seq, final HttpServletRequest req) {

		MWT001R2SearchPO searchParam = new MWT001R2SearchPO();

		if (SessionUtil.isLogin()) {
			searchParam.setIUid(SessionUtil.getAuthUserId());
		} else {
			searchParam.setIUid("");
		}
		searchParam.setIIp(IpUtil.getRequestIp(req));
		searchParam.setIGcd(seq);
		searchParam.setLocale("en");

		//MWT001R2ViewRO result = db2Mapper.inspectionTestViewEn(searchParam);
		MWT001R2ViewRO result = oracleMapper.inspectionTestViewOra(searchParam);
		//용기코드명을 영문으로 바꾼다.
		//result.f010gbnmToEng();

		// 한글 데이터 영문으로 변환
		InspectionTestEngVO enData = enTestMapper.findInspTestEnView(seq);
		if (enData == null) {
			if (result != null) {
				//result.setT001sav("");
				// result.setT001day("");
				result.setT001cont("");
				result.setT001etc("");
				result.setT001ref("");
			}
		} else {
			//result.setT001sav(enData.getT001sav());
			// result.setT001day(enData.getT001day());
			result.setT001cont(enData.getT001cont());
			result.setT001etc(enData.getT001etc());
			result.setT001ref(enData.getT001ref());
			result.setT001room(enData.getT001room());
			result.setT001cold(enData.getT001cold());
			result.setT001frozen(enData.getT001frozen());
		}
		return result;
	}

	/**
	 * @param seq
	 *            검사코드
	 * @param langCode
	 *            언어코드
	 * @param req
	 *            req
	 * @return 검사 정보
	 */
	public MWT001R2ViewRO findInspectionTestView(final String seq, final String langCode,
			final HttpServletRequest req) {
		if (langCode.equals("ko")) {
			return this.findInspectionTestView(seq, req);
		} else {
			return this.findInspectionTestViewEn(seq, req);
		}
	}

	/**
	 * @param seq
	 *            검사코드
	 * @param req
	 *            req
	 * @return 한글 검사 정보
	 */
	public MWT001R2ViewRO findInspectionTestKrView(final String seq, final HttpServletRequest req) {
		MWT001R2ViewRO result = this.findInspectionTestView(seq, req);
		if (result == null) {
			return null;
		}
		// 엔터 값들 처리
		if (StringUtils.isNotEmpty(result.getT001ref())) {
			result.setT001ref(result.getT001ref().replaceAll("(\r\n|\r|\n|\n\r)", ""));
		}
		if (StringUtils.isNotEmpty(result.getT001cont())) {
			result.setT001cont(result.getT001cont().replaceAll("(\r\n|\r|\n|\n\r)", ""));
		}
		if (StringUtils.isNotEmpty(result.getT001etc())) {
			result.setT001etc(result.getT001etc().replaceAll("(\r\n|\r|\n|\n\r)", ""));
		}

		return result;
	}

	/**
	 * @param seq
	 *            검사코드
	 * @param req
	 *            req
	 * @return 영문 검사 정보
	 */
	public MWT001R2ViewRO findInspectionTestEnView(final String seq, final HttpServletRequest req) {
		//MWT001R2ViewRO result = this.findInspectionTestView(seq, req);
		MWT001R2ViewRO result = this.findInspectionTestViewEn(seq, req);

		// 한글 데이터 영문으로 변환
		InspectionTestEngVO enData = enTestMapper.findInspTestEnView(seq);
		if (enData == null) {
			if (result != null) {
				//result.setT001sav("");
				// result.setT001day("");
				result.setT001cont("");
				result.setT001etc("");
				result.setT001ref("");
			}
		} else {
			// result.setT001sav(enData.getT001sav());
			// result.setT001day(enData.getT001day());
			result.setT001cont(enData.getT001cont());
			result.setT001etc(enData.getT001etc());
			result.setT001ref(enData.getT001ref());
		}

		return result;
	}

	/**
	 * 
	 * @param param
	 *            한글 수정 요청 등록 파라미터
	 * @param req
	 *            req
	 * @return 등록 성공 여부
	 */
	public boolean editInspKr(final InspectionTestEditVO param, final HttpServletRequest req) {

		InspectionTestEditVO item = new InspectionTestEditVO();
		item.setCodeLangType("ko");
		item.setCodeEditStType("wait");
		item.setTestName(param.getTestName());
		item.setF010gcd(param.getF010gcd());
		item.setT001sav(param.getT001sav());
		// item.setT001day(param.getT001day());
		item.setT001cont(param.getT001cont());
		item.setT001etc(param.getT001etc());
		item.setT001ref(param.getT001ref());
		item.setT001url(param.getT001url());
		item.setRegUserId(SessionUtil.getAuthUserId());

		int editCount = mariadbMapper.countByF010gcd(item);
		if (editCount == 0) {
			MWT001R2ViewRO asis = this.findInspectionTestKrView(item.getF010gcd(), req);

			InspectionTestEditVO logItem = new InspectionTestEditVO();
			logItem.setCodeLangType("ko");
			logItem.setCodeEditStType("apply");
			logItem.setTestName(asis.getF010fkn());
			logItem.setF010gcd(asis.getF010gcd());
			logItem.setT001sav(asis.getT001sav());
			// logItem.setT001day(asis.getT001day());
			logItem.setT001cont(asis.getT001cont());
			logItem.setT001etc(asis.getT001etc());
			logItem.setT001ref(asis.getT001ref());
			logItem.setT001url(asis.getT001url());
			logItem.setRegUserId("system");

			mariadbMapper.addInspTestEdit(logItem);
		}

		mariadbMapper.addInspTestEdit(item);

		InspectionTestEditVO afterData = mariadbMapper.findInspTestEditBySeq(item.getSeq());

		logEditService.insertAddLog(req, afterData);

		return true;

	}

	/**
	 * 
	 * @param param
	 *            한글 신규 등록 요청 등록 파라미터
	 * @param req
	 *            req
	 * @return 등록 성공 여부
	 */
	public boolean editNewInspKr(final InspectionTestEditVO param, final HttpServletRequest req) {

		List<MWT001R3ListRO> reviewAddList = this.reviewAddDefaultInfo(req);

		MWT001R3ListRO info = reviewAddList.stream().filter(t -> {
			return t.getF010gcd().equals(param.getF010gcd());
		}).findFirst().orElse(null);

		InspectionTestEditVO item = new InspectionTestEditVO();
		item.setCodeLangType("ko");
		item.setCodeEditStType("wait");
		item.setTestName("");
		item.setF010gcd(param.getF010gcd());
		item.setT001sav("");
		item.setT001cont(param.getT001cont());
		item.setT001etc(param.getT001etc());
		item.setT001url(param.getT001url());
		item.setT001ref(param.getT001ref());
		item.setRegUserId(SessionUtil.getAuthUserId());

		if (info != null) {
			item.setTestName(info.getF010fkn());
		} else {
			item.setCodeEditStType("reject");
		}

		mariadbMapper.addInspTestEdit(item);

		InspectionTestEditVO afterData = mariadbMapper.findInspTestEditBySeq(item.getSeq());

		logEditService.insertAddLog(req, afterData);

		return true;

	}

	/**
	 * 
	 * @param param
	 *            영문 수정 요청 등록 파라미터
	 * @param req
	 *            req
	 * @return 등록 성공 여부
	 */
	public boolean editInspEn(final InspectionTestEditVO param, final HttpServletRequest req) {

		InspectionTestEditVO item = new InspectionTestEditVO();
		item.setCodeLangType("en");
		item.setCodeEditStType("wait");
		item.setTestName(param.getTestName());
		item.setF010gcd(param.getF010gcd());
		item.setT001sav(param.getT001sav());
		// item.setT001day(param.getT001day());
		item.setT001cont(param.getT001cont());
		item.setT001etc(param.getT001etc());
		item.setT001ref(param.getT001ref());
		item.setRegUserId(SessionUtil.getAuthUserId());

		int editCount = mariadbMapper.countByF010gcd(item);
		if (editCount == 0) {
			MWT001R2ViewRO asis = this.findInspectionTestEnView(item.getF010gcd(), req);

			InspectionTestEditVO logItem = new InspectionTestEditVO();
			logItem.setCodeLangType("en");
			logItem.setCodeEditStType("apply");
			logItem.setTestName(asis.getF010fkn());
			logItem.setF010gcd(asis.getF010gcd());
			logItem.setT001sav(asis.getT001sav());
			// logItem.setT001day(asis.getT001day());
			logItem.setT001cont(asis.getT001cont());
			logItem.setT001etc(asis.getT001etc());
			logItem.setT001ref(asis.getT001ref());
			logItem.setRegUserId("system");

			mariadbMapper.addInspTestEdit(logItem);
		
		}

		mariadbMapper.addInspTestEdit(item);
		

		InspectionTestEditVO afterData = mariadbMapper.findInspTestEditBySeq(item.getSeq());

		//logEditService.insertAddLog(req, afterData);

		return true;

	}

	/**
	 * 
	 * @param param
	 *            한글 신규 등록 요청 등록 파라미터
	 * @param req
	 *            req
	 * @return 등록 성공 여부
	 */
	public boolean editNewInspEn(final InspectionTestEditVO param, final HttpServletRequest req) {

		List<MWT001R3ListRO> reviewAddList = this.reviewAddDefaultInfoEn(req);

		MWT001R3ListRO info = reviewAddList.stream().filter(t -> {
			return t.getF010gcd().equals(param.getF010gcd());
		}).findFirst().orElse(null);

		InspectionTestEditVO item = new InspectionTestEditVO();
		item.setCodeLangType("en");
		item.setCodeEditStType("wait");
		item.setTestName(param.getTestName());
		item.setF010gcd(param.getF010gcd());
		item.setT001sav("");
		item.setT001cont(param.getT001cont());
		item.setT001etc(param.getT001etc());
		item.setT001ref(param.getT001ref());
		item.setT001url(param.getT001url());
		item.setRegUserId(SessionUtil.getAuthUserId());

		if (info != null) {
			item.setTestName(info.getF010fkn());
		} else {
			item.setCodeEditStType("reject");
		}

		mariadbMapper.addInspTestEdit(item);

		InspectionTestEditVO afterData = mariadbMapper.findInspTestEditBySeq(item.getSeq());

		logEditService.insertAddLog(req, afterData);

		return true;

	}

	/**
	 * @param seq
	 *            검사코드
	 * @return 한글 검사코드 수정 요청 이력
	 */
	public List<InspectionTestEditLogRO> findInspectionKrEditLog(final String seq) {

		InspectionTestEditVO param = new InspectionTestEditVO();
		param.setCodeLangType("ko");
		param.setF010gcd(seq);

		List<InspectionTestEditLogRO> result = mariadbMapper.findInspectionEditLog(param);

		return result;
	}

	/**
	 * @param seq
	 *            검사코드
	 * @return 영문 검사코드 수정 요청 이력
	 */
	public List<InspectionTestEditLogRO> findInspectionEnEditLog(final String seq) {

		InspectionTestEditVO param = new InspectionTestEditVO();
		param.setCodeLangType("en");
		param.setF010gcd(seq);

		List<InspectionTestEditLogRO> result = mariadbMapper.findInspectionEditLog(param);

		return result;
	}

	public List<CodeSlaveRO> getRedactionDefaultInfo() {

		List<CodeSlaveRO> stCodes = codeService.findSlaveByMaster("inspEditSt");

		return stCodes;
	}

	/**
	 * @param param
	 *            검색 조건
	 * @return 조건에 맞는 리스트
	 */
	public CommonListReuslt<InspectionListRO> findInspKrList(final InspSearchPO param) {

		param.setCodeLangType("ko");
		param.setMybatisPagging();

		List<InspectionListRO> content = mariadbMapper.findInspectionEditList(param);
		int count = mariadbMapper.countInspectionEditList(param);

		CommonListReuslt<InspectionListRO> result = new CommonListReuslt<>(content, count, param);

		return result;
	}

	/**
	 * @param param
	 *            검색 조건
	 * @return 조건에 맞는 리스트
	 */
	public CommonListReuslt<InspectionListRO> findInspEnList(final InspSearchPO param) {

		param.setCodeLangType("en");
		param.setMybatisPagging();

		List<InspectionListRO> content = mariadbMapper.findInspectionEditList(param);
		int count = mariadbMapper.countInspectionEditList(param);

		CommonListReuslt<InspectionListRO> result = new CommonListReuslt<>(content, count, param);

		return result;
	}

	/**
	 * @param seq
	 *            검사항목 수정 요청 seq
	 * @param req
	 *            req
	 * @return 검사항목 수정 정보
	 */
	public InspectionViewRO findInspKrInfo(final int seq, final HttpServletRequest req) {

		InspectionTestEditVO param = new InspectionTestEditVO();
		param.setCodeLangType("ko");
		param.setSeq(seq);

		InspectionTestEditViewRO tobe = mariadbMapper.findInspectionEditInfo(param);

		MWT001R2ViewRO asis = this.findInspectionTestKrView(tobe.getF010gcd(), req);

		InspectionViewRO result = new InspectionViewRO();

		result.setToBe(tobe);
		result.setAsIs(asis);

		return result;
	}

	/**
	 * @param seq
	 *            검사항목 수정 요청 seq
	 * @param req
	 *            req
	 * @return 검사항목 수정 정보
	 */
	public InspectionViewRO findInspEnInfo(final int seq, final HttpServletRequest req) {

		InspectionTestEditVO param = new InspectionTestEditVO();
		param.setCodeLangType("en");
		param.setSeq(seq);

		InspectionTestEditViewRO tobe = mariadbMapper.findInspectionEditInfo(param);

		MWT001R2ViewRO asis = this.findInspectionTestEnView(tobe.getF010gcd(), req);

		InspectionViewRO result = new InspectionViewRO();

		result.setToBe(tobe);
		result.setAsIs(asis);

		return result;
	}

	/**
	 * @param param
	 *            db2적용 파라미터
	 * @param req
	 *            req
	 * @return 적용 성공 여부
	 */
	public boolean applyInspKr(final InspectionTestEditVO param, final HttpServletRequest req) {

		InspectionTestEditVO beforeData = mariadbMapper.findInspTestEditBySeq(param.getSeq());

		if (!beforeData.getCodeEditStType().equals("wait")) {
			return false;
		}

		InspectionTestUpdatePO item = new InspectionTestUpdatePO();
		item.setICor("NML");
		item.setIUid(SessionUtil.getAuthUserId());
		item.setIIp(IpUtil.getRequestIp(req));
		item.setIGcd(param.getF010gcd());
		item.setISav(param.getT001sav());
		item.setIRef(param.getT001ref());
		item.setICont(param.getT001cont());
		item.setIEtc(param.getT001etc());
		item.setIUrl(param.getT001url());
		db2Mapper.inspectionTestUpdate(item);

		param.setCodeLangType("ko");
		param.setCodeEditStType("apply");
		param.setEditUserId(SessionUtil.getAuthUserId());
		param.setDeleteFlag("N");

		mariadbMapper.applyInspectionEdit(param);

		InspectionTestEditVO afterData = mariadbMapper.findInspTestEditBySeq(param.getSeq());
		logEditService.insertEditLog(req, beforeData, afterData);

		return true;
	}

	/**
	 * @param param
	 *            db2적용 파라미터
	 * @param req
	 *            req
	 * @return 적용 성공 여부
	 */
	public boolean applyInspEn(final InspectionTestEditVO param, final HttpServletRequest req) {

		InspectionTestEditVO beforeData = mariadbMapper.findInspTestEditBySeq(param.getSeq());

		if (!beforeData.getCodeEditStType().equals("wait")) {
			return false;
		}

		String eidtUserId = SessionUtil.getAuthUserId();

		// 영문 데이터 서버 반영
		InspectionTestEngVO beforeEnData = enTestMapper.findInspTestEnView(beforeData.getF010gcd());

		if (beforeEnData == null) {
			// 입력
			InspectionTestEngVO item = new InspectionTestEngVO();
			item.setF010gcd(beforeData.getF010gcd());
			item.setT001sav(param.getT001sav());
			// item.setT001day(param.getT001day());
			item.setT001cont(param.getT001cont());
			item.setT001etc(param.getT001etc());
			item.setT001ref(param.getT001ref());
			item.setRegUserId(eidtUserId);

			enTestMapper.addInspTestEng(item);

			InspectionTestEngVO afterEnData = enTestMapper.findInspTestEngBySeq(item.getSeq());

			logEditService.insertAddLog(req, afterEnData);

		} else {
			// 수정
			InspectionTestEngVO item = new InspectionTestEngVO();
			item.setSeq(beforeEnData.getSeq());
			item.setF010gcd(beforeData.getF010gcd());
			if (StringUtils.isEmpty(param.getT001sav())) {
				item.setT001sav(beforeEnData.getT001sav());
			} else {
				item.setT001sav(param.getT001sav());
			}
			// if(StringUtils.isEmpty(param.getT001day())){
			// item.setT001day(beforeEnData.getT001day());
			// }else{
			// item.setT001day(param.getT001day());
			// }
			if (StringUtils.isEmpty(param.getT001cont())) {
				item.setT001cont(beforeEnData.getT001cont());
			} else {
				item.setT001cont(param.getT001cont());
			}
			if (StringUtils.isEmpty(param.getT001etc())) {
				item.setT001etc(beforeEnData.getT001etc());
			} else {
				item.setT001etc(param.getT001etc());
			}
			if (StringUtils.isEmpty(param.getT001ref())) {
				item.setT001ref(beforeEnData.getT001ref());
			} else {
				item.setT001ref(param.getT001ref());
			}

			item.setEditUserId(eidtUserId);

			enTestMapper.editInspTestEng(item);

			InspectionTestEngVO afterEnData = enTestMapper.findInspTestEngBySeq(item.getSeq());

			logEditService.insertEditLog(req, beforeEnData, afterEnData);
		}

		// 영문 데이터 반영 끝

		// 요정 데이터 승인 처리
		param.setCodeLangType("en");
		param.setCodeEditStType("apply");
		param.setEditUserId(eidtUserId);
		param.setDeleteFlag("N");

		mariadbMapper.applyInspectionEdit(param);
		// 승인 처리 완료
		InspectionTestEditVO afterData = mariadbMapper.findInspTestEditBySeq(param.getSeq());
		logEditService.insertEditLog(req, beforeData, afterData);

		return true;
	}

	/**
	 * @param param
	 *            db2적용 파라미터
	 * @param req
	 *            req
	 * @return 적용 성공 여부
	 */
	public boolean rejectInspKr(final InspectionTestEditVO param, final HttpServletRequest req) {

		InspectionTestEditVO beforeData = mariadbMapper.findInspTestEditBySeq(param.getSeq());

		if (!beforeData.getCodeEditStType().equals("wait")) {
			return false;
		}

		String eidtUserId = SessionUtil.getAuthUserId();

		// 요정 데이터 승인 처리
		param.setCodeLangType("ko");
		param.setCodeEditStType("reject");
		param.setEditUserId(eidtUserId);
		param.setDeleteFlag("N");

		mariadbMapper.rejectInspectionEdit(param);
		// 승인 처리 완료
		InspectionTestEditVO afterData = mariadbMapper.findInspTestEditBySeq(param.getSeq());
		logEditService.insertEditLog(req, beforeData, afterData);

		return true;
	}

	/**
	 * @param param
	 *            db2적용 파라미터
	 * @param req
	 *            req
	 * @return 적용 성공 여부
	 */
	public boolean rejectInspEn(final InspectionTestEditVO param, final HttpServletRequest req) {

		InspectionTestEditVO beforeData = mariadbMapper.findInspTestEditBySeq(param.getSeq());

		if (!beforeData.getCodeEditStType().equals("wait")) {
			return false;
		}

		String eidtUserId = SessionUtil.getAuthUserId();

		// 요정 데이터 승인 처리
		param.setCodeLangType("en");
		param.setCodeEditStType("reject");
		param.setEditUserId(eidtUserId);
		param.setDeleteFlag("N");

		mariadbMapper.rejectInspectionEdit(param);
		// 승인 처리 완료
		InspectionTestEditVO afterData = mariadbMapper.findInspTestEditBySeq(param.getSeq());
		logEditService.insertEditLog(req, beforeData, afterData);

		return true;
	}

	/**
	 * @param testCode
	 *            검사코드
	 * @return 검사명
	 */
	public String getTestName(final String testCode, final HttpServletRequest req) {

		MWT001R2ViewRO testInfo = this.findInspectionTestView(testCode, req);

		return testInfo.getF010fkn();
	}

	public void downInspectionTestKrList(final InspectionTestSearchOption param, final HttpServletRequest req,
			final HttpServletResponse res) throws IOException {
		List<MWT001R1ListRO> findInspectionTestList = this.findInspectionTestList(param, req);
		List<MWT001R2ViewRO> contentList = new ArrayList<>();

		findInspectionTestList.forEach(t -> {
			contentList.add(this.findInspectionTestKrView(t.getF010gcd(), req));
		});

		this.makeExcel(contentList, req, res);
	}

	public void downInspectionTestEnList(final InspectionTestSearchOption param, final HttpServletRequest req,
			final HttpServletResponse res) throws IOException {
		List<MWT001R1ListRO> findInspectionTestListEn = this.findInspectionTestListEn(param, req);
		List<MWT001R2ViewRO> contentList = new ArrayList<>();

		findInspectionTestListEn.forEach(t -> {
			contentList.add(this.findInspectionTestEnView(t.getF010gcd(), req));
		});

		this.makeExcel(contentList, req, res);
	}

	private void makeExcel(final List<MWT001R2ViewRO> contentList, final HttpServletRequest req,
			final HttpServletResponse res) throws IOException {
		// 워크북 생성
		try (XSSFWorkbook workbook = new XSSFWorkbook();) {
			// 워크시트 생성
			XSSFSheet sheet = workbook.createSheet();

			// 셀 카운트
			int cellCount = 0;
			int rowCount = 0;

			// 행 생성
			XSSFRow row = sheet.createRow(rowCount++);
			// 쎌 생성
			XSSFCell cell;

			// 헤더 폰트
			Font headerFont = workbook.createFont();
			headerFont.setBold(true);

			// 해더 스타일
			CellStyle headerStyle = workbook.createCellStyle();
			headerStyle.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
			headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
			headerStyle.setFont(headerFont);
			headerStyle.setAlignment(HorizontalAlignment.CENTER);
			headerStyle.setVerticalAlignment(VerticalAlignment.CENTER);
			headerStyle.setBorderTop(BorderStyle.THIN);
			headerStyle.setBorderLeft(BorderStyle.THIN);
			headerStyle.setBorderRight(BorderStyle.THIN);
			headerStyle.setBorderBottom(BorderStyle.THIN);

			CellStyle normalStyle = workbook.createCellStyle();
			normalStyle.setBorderTop(BorderStyle.THIN);
			normalStyle.setBorderLeft(BorderStyle.THIN);
			normalStyle.setBorderRight(BorderStyle.THIN);
			normalStyle.setBorderBottom(BorderStyle.THIN);

			CellStyle editStyle = workbook.createCellStyle();
			editStyle.setFillForegroundColor(HSSFColor.LIGHT_YELLOW.index);
			editStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
			editStyle.setBorderTop(BorderStyle.THIN);
			editStyle.setBorderLeft(BorderStyle.THIN);
			editStyle.setBorderRight(BorderStyle.THIN);
			editStyle.setBorderBottom(BorderStyle.THIN);

			// 헤더 생성
			cell = row.createCell(cellCount++);
			cell.setCellValue("검사명");
			cell.setCellStyle(headerStyle);

			cell = row.createCell(cellCount++);
			cell.setCellValue("검사코드");
			cell.setCellStyle(headerStyle);

			cell = row.createCell(cellCount++);
			cell.setCellValue("검사일");
			cell.setCellStyle(headerStyle);

			cell = row.createCell(cellCount++);
			cell.setCellValue("검체(ml)");
			cell.setCellStyle(headerStyle);

			cell = row.createCell(cellCount++);
			cell.setCellValue("소요일");
			cell.setCellStyle(headerStyle);

			cell = row.createCell(cellCount++);
			cell.setCellValue("보존방법");
			cell.setCellStyle(headerStyle);

			cell = row.createCell(cellCount++);
			cell.setCellValue("검사방법");
			cell.setCellStyle(headerStyle);

			cell = row.createCell(cellCount++);
			cell.setCellValue("용기명");
			cell.setCellStyle(headerStyle);

			cell = row.createCell(cellCount++);
			cell.setCellValue("보험코드");
			cell.setCellStyle(headerStyle);

			cell = row.createCell(cellCount++);
			cell.setCellValue("검사수가");
			cell.setCellStyle(headerStyle);

			cell = row.createCell(cellCount++);
			cell.setCellValue("분류번호");
			cell.setCellStyle(headerStyle);

			cell = row.createCell(cellCount++);
			cell.setCellValue("참고치");
			cell.setCellStyle(headerStyle);

			cell = row.createCell(cellCount++);
			cell.setCellValue("임상정보");
			cell.setCellStyle(headerStyle);

			cell = row.createCell(cellCount++);
			cell.setCellValue("주의사항");
			cell.setCellStyle(headerStyle);

			for (MWT001R2ViewRO item : contentList) {
				// 행 생성
				row = sheet.createRow(rowCount++);

				// 셀 카운트
				cellCount = 0;

				cell = row.createCell(cellCount++);
				cell.setCellValue(item.getF010fkn());
				cell.setCellStyle(normalStyle);

				cell = row.createCell(cellCount++);
				cell.setCellValue(item.getF010gcd());
				cell.setCellStyle(normalStyle);

				cell = row.createCell(cellCount++);
				cell.setCellValue(item.getT001day());
				cell.setCellStyle(normalStyle);

				cell = row.createCell(cellCount++);
				cell.setCellValue(item.getF010tnm());
				cell.setCellStyle(normalStyle);

				cell = row.createCell(cellCount++);
				cell.setCellValue(item.getF010eed());
				cell.setCellStyle(normalStyle);

				cell = row.createCell(cellCount++);
				cell.setCellValue(item.getT001sav());
				// cell.setCellStyle(editStyle);
				cell.setCellStyle(normalStyle);

				cell = row.createCell(cellCount++);
				cell.setCellValue(item.getF010msnm());
				cell.setCellStyle(normalStyle);

				cell = row.createCell(cellCount++);
				cell.setCellValue(item.getF010gbnm());
				cell.setCellStyle(normalStyle);

				cell = row.createCell(cellCount++);
				cell.setCellValue(item.getDocdTmp());
				cell.setCellStyle(normalStyle);

				cell = row.createCell(cellCount++);
				cell.setCellValue(item.getTssu());
				cell.setCellStyle(normalStyle);

				cell = row.createCell(cellCount++);
				cell.setCellValue(item.getSomk());
				cell.setCellStyle(normalStyle);

				cell = row.createCell(cellCount++);
				cell.setCellValue(StringUtil.brToEnter(item.getT001ref()));
				cell.setCellStyle(editStyle);

				cell = row.createCell(cellCount++);
				cell.setCellValue(StringUtil.brToEnter(item.getT001cont()));
				cell.setCellStyle(editStyle);

				cell = row.createCell(cellCount++);
				cell.setCellValue(StringUtil.brToEnter(item.getT001etc()));
				cell.setCellStyle(editStyle);

			}

			for (int i = 0; i < 14; i++) {
				sheet.autoSizeColumn(i);
				// 시트 자리수 에러로 인한 처리
				sheet.setColumnWidth(i, ((sheet.getColumnWidth(i) + (short) 512) > 25000) ? 25000
						: (sheet.getColumnWidth(i) + (short) 512));
			}

			res.setContentType("application/octet-stream");

			String fileName = "검사항목_리스트_" + DateUtil.getTimeStampString() + ".xlsx";
			// 파일명 한글 관련 처리
			String fileHeader = fileComponent.getFileDownHeader(req, fileName);
			res.setHeader("Content-Disposition", fileHeader);

			workbook.write(res.getOutputStream());

		}

	}

	public int editExcelInspKr(final InspExcelPO excelPO, final HttpServletRequest req) {

		Gson gson = new Gson();

		Type inspectionTestEditType = new TypeToken<List<InspectionTestEditVO>>() {
		}.getType();

		List<InspectionTestEditVO> uploadEditList = gson.fromJson(excelPO.getDataJSON(), inspectionTestEditType);

		int editCount = 0;

		for (InspectionTestEditVO t : uploadEditList) {

			InspectionTestSearchOption sParam = new InspectionTestSearchOption();
			sParam.setTestInfoOption("03");
			sParam.setSearchKeyword(t.getF010gcd());

			List<MWT001R1ListRO> inspectionTestList = findInspectionTestList(sParam, req);

			MWT001R1ListRO asisList = inspectionTestList.stream().filter(t2 -> {
				return t2.getF010gcd().equals(t.getF010gcd());
			}).findFirst().orElse(null);

			if (asisList != null) {

				MWT001R2ViewRO asis = this.findInspectionTestKrView(t.getF010gcd(), req);

				if (!asis.getT001sav().equals(t.getT001sav())
						|| !StringUtil.removeSpaceEnter(asis.getT001cont())
								.equals(StringUtil.removeSpaceEnter(t.getT001cont()))
						|| !StringUtil.removeSpaceEnter(asis.getT001etc())
								.equals(StringUtil.removeSpaceEnter(t.getT001etc()))
						|| !StringUtil.removeSpaceEnter(asis.getT001ref())
								.equals(StringUtil.removeSpaceEnter(t.getT001ref()))) {
					// 하나라도 다른게 있을때만 등록
					editInspKr(t, req);
					editCount++;
				}
			} else {

				editNewInspKr(t, req);
				editCount++;
			}
		}

		return editCount;
	}

	public int editExcelInspEn(final InspExcelPO excelPO, final HttpServletRequest req) {

		Gson gson = new Gson();

		Type inspectionTestEditType = new TypeToken<List<InspectionTestEditVO>>() {
		}.getType();

		List<InspectionTestEditVO> uploadEditList = gson.fromJson(excelPO.getDataJSON(), inspectionTestEditType);

		int editCount = 0;

		for (InspectionTestEditVO t : uploadEditList) {

			InspectionTestSearchOption sParam = new InspectionTestSearchOption();
			sParam.setTestInfoOption("03");
			sParam.setSearchKeyword(t.getF010gcd());

			List<MWT001R1ListRO> inspectionTestList = findInspectionTestListEn(sParam, req);

			MWT001R1ListRO asisList = inspectionTestList.stream().filter(t2 -> {
				return t2.getF010gcd().equals(t.getF010gcd());
			}).findFirst().orElse(null);

			if (asisList != null) {

				MWT001R2ViewRO asis = this.findInspectionTestEnView(t.getF010gcd(), req);

				if (!asis.getT001sav().equals(t.getT001sav())
						|| !StringUtil.removeSpaceEnter(asis.getT001cont())
								.equals(StringUtil.removeSpaceEnter(t.getT001cont()))
						|| !StringUtil.removeSpaceEnter(asis.getT001etc())
								.equals(StringUtil.removeSpaceEnter(t.getT001etc()))
						|| !StringUtil.removeSpaceEnter(asis.getT001ref())
								.equals(StringUtil.removeSpaceEnter(t.getT001ref()))) {
					// 하나라도 다른게 있을때만 등록
					editInspEn(t, req);
					editCount++;
				}
			} else {
				editNewInspEn(t, req);
				editCount++;
			}
		}

		return editCount;
	}

	public boolean addInspKr(final InspectionTestEditVO param, final HttpServletRequest req) {

		InspectionTestSearchOption sParam = new InspectionTestSearchOption();
		sParam.setTestInfoOption("03");
		sParam.setSearchKeyword(param.getF010gcd());

		List<MWT001R1ListRO> inspectionTestList = findInspectionTestList(sParam, req);

		MWT001R1ListRO asis = inspectionTestList.stream().filter(t -> {
			return t.getF010gcd().equals(param.getF010gcd());
		}).findFirst().orElse(null);

		if (asis != null) {
			// 하나라도 다른게 있을때만 등록
			param.setTestName(asis.getF010fkn());
			editInspKr(param, req);
		} else {
			editNewInspKr(param, req);
		}

		return true;
	}

	public boolean addInspEn(final InspectionTestEditVO param, final HttpServletRequest req) {

		InspectionTestSearchOption sParam = new InspectionTestSearchOption();
		sParam.setTestInfoOption("03");
		sParam.setSearchKeyword(param.getF010gcd());

		List<MWT001R1ListRO> inspectionTestList = findInspectionTestList(sParam, req);

		MWT001R1ListRO asis = inspectionTestList.stream().filter(t -> {
			return t.getF010gcd().equals(param.getF010gcd());
		}).findFirst().orElse(null);

		if (asis != null) {
			// 하나라도 다른게 있을때만 등록
			param.setTestName(asis.getF010fkn());
			editInspEn(param, req);
		} else {
			editNewInspEn(param, req);
		}

		return true;
	}

	/**
	 * @param req
	 *            req
	 * @return 검사항목 신규 등록 가능 리스트 조회
	 */
	public List<MWT001R3ListRO> reviewAddDefaultInfo(final HttpServletRequest req) {
		MWT001R3SearchPO searchParam = new MWT001R3SearchPO();

		if (SessionUtil.isLogin()) {
			searchParam.setIUid(SessionUtil.getAuthUserId());
		} else {
			searchParam.setIUid("");
		}
		searchParam.setIIp(IpUtil.getRequestIp(req));

		List<MWT001R3ListRO> result = db2Mapper.inspectionAddTestList(searchParam);

		return result;

	}
	
	/**
	 * @param req
	 *            req
	 * @return 검사항목 신규 등록 가능 리스트 조회
	 */
	public List<MWT001R3ListRO> reviewAddDefaultInfoEn(final HttpServletRequest req) {
		MWT001R3SearchPO searchParam = new MWT001R3SearchPO();

		if (SessionUtil.isLogin()) {
			searchParam.setIUid(SessionUtil.getAuthUserId());
		} else {
			searchParam.setIUid("");
		}
		searchParam.setIIp(IpUtil.getRequestIp(req));

		List<MWT001R3ListRO> result = db2Mapper.inspectionAddTestList(searchParam);

		return result;

	}

	public void downInspectionRedactionList(final InspSearchPO param, final String codeLang,
			final HttpServletRequest req, final HttpServletResponse res) throws IOException {

		param.setCodeLangType(codeLang);

		List<InspectionTestEditViewRO> results = mariadbMapper.findInspectionEditInfoExcelList(param);

		// 워크북 생성
		try (XSSFWorkbook workbook = new XSSFWorkbook();) {
			// 워크시트 생성
			XSSFSheet sheet = workbook.createSheet();

			// 셀 카운트
			int cellCount = 0;
			int rowCount = 0;

			// 행 생성
			XSSFRow row = sheet.createRow(rowCount++);
			// 쎌 생성
			XSSFCell cell;

			// 헤더 폰트
			Font headerFont = workbook.createFont();
			headerFont.setBold(true);

			// 해더 스타일
			CellStyle headerStyle = workbook.createCellStyle();
			headerStyle.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
			headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
			headerStyle.setFont(headerFont);
			headerStyle.setAlignment(HorizontalAlignment.CENTER);
			headerStyle.setVerticalAlignment(VerticalAlignment.CENTER);
			headerStyle.setBorderTop(BorderStyle.THIN);
			headerStyle.setBorderLeft(BorderStyle.THIN);
			headerStyle.setBorderRight(BorderStyle.THIN);
			headerStyle.setBorderBottom(BorderStyle.THIN);

			CellStyle normalStyle = workbook.createCellStyle();
			normalStyle.setBorderTop(BorderStyle.THIN);
			normalStyle.setBorderLeft(BorderStyle.THIN);
			normalStyle.setBorderRight(BorderStyle.THIN);
			normalStyle.setBorderBottom(BorderStyle.THIN);

			CellStyle editStyle = workbook.createCellStyle();
			editStyle.setFillForegroundColor(HSSFColor.LIGHT_YELLOW.index);
			editStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
			editStyle.setBorderTop(BorderStyle.THIN);
			editStyle.setBorderLeft(BorderStyle.THIN);
			editStyle.setBorderRight(BorderStyle.THIN);
			editStyle.setBorderBottom(BorderStyle.THIN);

			// 헤더 생성
			cell = row.createCell(cellCount++);
			cell.setCellValue("검사코드");
			cell.setCellStyle(headerStyle);

			cell = row.createCell(cellCount++);
			cell.setCellValue("검사명");
			cell.setCellStyle(headerStyle);

			cell = row.createCell(cellCount++);
			cell.setCellValue("상태");
			cell.setCellStyle(headerStyle);

			cell = row.createCell(cellCount++);
			cell.setCellValue("등록자");
			cell.setCellStyle(headerStyle);

			cell = row.createCell(cellCount++);
			cell.setCellValue("등록일시");
			cell.setCellStyle(headerStyle);

			cell = row.createCell(cellCount++);
			cell.setCellValue("최종 수정자");
			cell.setCellStyle(headerStyle);

			cell = row.createCell(cellCount++);
			cell.setCellValue("최종 수정일시");
			cell.setCellStyle(headerStyle);

			cell = row.createCell(cellCount++);
			cell.setCellValue("참고치");
			cell.setCellStyle(headerStyle);

			cell = row.createCell(cellCount++);
			cell.setCellValue("임상정보");
			cell.setCellStyle(headerStyle);

			cell = row.createCell(cellCount++);
			cell.setCellValue("주의사항");
			cell.setCellStyle(headerStyle);

			for (InspectionTestEditViewRO item : results) {
				// 행 생성
				row = sheet.createRow(rowCount++);

				// 셀 카운트
				cellCount = 0;

				cell = row.createCell(cellCount++);
				cell.setCellValue(item.getF010gcd());
				cell.setCellStyle(normalStyle);

				cell = row.createCell(cellCount++);
				cell.setCellValue(item.getTestName());
				cell.setCellStyle(normalStyle);

				cell = row.createCell(cellCount++);
				cell.setCellValue(item.getCodeEditStName());
				cell.setCellStyle(normalStyle);

				cell = row.createCell(cellCount++);
				cell.setCellValue(item.getRegUserName() + " ( "+item.getRegUserId() + " ) ");
				cell.setCellStyle(normalStyle);

				cell = row.createCell(cellCount++);
				cell.setCellValue(DateUtil.getFormatString(item.getRegDate(), "yyyy-MM-dd HH:mm:ss"));
				cell.setCellStyle(normalStyle);

				cell = row.createCell(cellCount++);
				cell.setCellValue(item.getEditUserName() + " ( " + item.getEditUserId() + " ) ");
				cell.setCellStyle(normalStyle);

				cell = row.createCell(cellCount++);
				cell.setCellValue(DateUtil.getFormatString(item.getEditDate(), "yyyy-MM-dd HH:mm:ss"));
				cell.setCellStyle(normalStyle);

				cell = row.createCell(cellCount++);
				cell.setCellValue(item.getT001ref());
				cell.setCellStyle(normalStyle);

				cell = row.createCell(cellCount++);
				cell.setCellValue(item.getT001cont());
				cell.setCellStyle(normalStyle);

				cell = row.createCell(cellCount++);
				cell.setCellValue(item.getT001etc());
				cell.setCellStyle(normalStyle);

			}

			for (int i = 0; i < 10; i++) {
				sheet.autoSizeColumn(i);
				// 시트 자리수 에러로 인한 처리
				sheet.setColumnWidth(i, ((sheet.getColumnWidth(i) + (short) 512) > 25000) ? 25000
						: (sheet.getColumnWidth(i) + (short) 512));
			}

			res.setContentType("application/octet-stream");

			String fileName = "검사항목_검토_리스트_" + DateUtil.getTimeStampString() + ".xlsx";
			// 파일명 한글 관련 처리
			String fileHeader = fileComponent.getFileDownHeader(req, fileName);
			res.setHeader("Content-Disposition", fileHeader);

			workbook.write(res.getOutputStream());

		}

	}

}
