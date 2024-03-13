package com.seegene.web.admin.menu.user.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.http.client.ClientProtocolException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.seegene.web.admin.code.service.CodeService;
import com.seegene.web.admin.log.edit.service.LogEditService;
import com.seegene.web.admin.menu.user.vo.AddMenuUserDefaultRO;
import com.seegene.web.admin.menu.user.vo.MenuSelectParentListRO;
import com.seegene.web.admin.menu.user.vo.MenuUserAddPO;
import com.seegene.web.admin.menu.user.vo.MenuUserEditPO;
import com.seegene.web.admin.menu.user.vo.MenuUserListRO;
import com.seegene.web.admin.menu.user.vo.MenuVO;
import com.seegene.web.admin.util.service.AdminUtilService;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.SearchPaggingCommonPO;
import com.seegene.web.common.SessionUtil;
import com.seegene.web.repository.mariadb.MenuUserMapper;

/**
 * 사용자 메뉴 관리 서비스
 */
@Service
@Transactional
public class MenuUserService {
	
	@Autowired
	private MenuUserMapper mapper;
	
	@Autowired
	private CodeService codeService;
	
	@Autowired
	private LogEditService logEditService;
	
	@Autowired
	private AdminUtilService adminUtilService;
	
	/**
	 * @param seq 식별자
	 * @return menuvo 정보
	 */
	private MenuVO findBySeq(final int seq){
		return mapper.findBySeq(seq);
	}
	

	/**
	 * @param param 검색 조건
	 * @return 검색 결과에 해당하는 리스트
	 */
	public CommonListReuslt<MenuUserListRO> findUserMenuList(final SearchPaggingCommonPO param) {
		
		//TODO 해당 내용은 추후 마리아디비 버전 보고 SQL로 바꿀것을 권장!!
		List<MenuVO> allMenus = mapper.findUserMenuList();
		List<MenuUserListRO> list = new ArrayList<>();
		
		//메뉴 레벨별 정렬
		List<MenuVO> step1Menus = allMenus.stream().filter(item -> {return item.getMenuLevel() == 1 && item.getCodeMenuType().equals("head");}).sorted().collect(Collectors.toList());
		List<MenuVO> step2Menus = allMenus.stream().filter(item -> {return item.getMenuLevel() == 2;}).sorted().collect(Collectors.toList());
		List<MenuVO> step3Menus = allMenus.stream().filter(item -> {return item.getMenuLevel() == 3;}).sorted().collect(Collectors.toList());
		List<MenuVO> step4Menus = allMenus.stream().filter(item -> {return item.getMenuLevel() == 4;}).sorted().collect(Collectors.toList());

		//트리 데이터 입력
		step4Menus.forEach(item ->{
			MenuVO menu = step3Menus.stream().filter(t ->{return t.getSeq() == item.getParentSeq();}).findAny().orElse(null);
			if(menu != null){
				if(menu.getChilds() == null){
					menu.setChilds(new ArrayList<>());
				}
				item.setParentName(menu.getMenuName());
				menu.getChilds().add(item);
			}
		});
		
		step3Menus.forEach(item ->{
			if(item.getChilds() != null){
				item.setChilds(item.getChilds().stream().sorted().collect(Collectors.toList()));
			}
			
			MenuVO menu = step2Menus.stream().filter(t ->{return t.getSeq() == item.getParentSeq();}).findAny().orElse(null);
			if(menu != null){
				if(menu.getChilds() == null){
					menu.setChilds(new ArrayList<>());
				}
				item.setParentName(menu.getMenuName());
				menu.getChilds().add(item);
			}
		});
		
		step2Menus.forEach(item ->{
			if(item.getChilds() != null){
				item.setChilds(item.getChilds().stream().sorted().collect(Collectors.toList()));
			}
			
			MenuVO menu = step1Menus.stream().filter(t ->{return t.getSeq() == item.getParentSeq();}).findAny().orElse(null);
			if(menu != null){
				if(menu.getChilds() == null){
					menu.setChilds(new ArrayList<>());
				}
				item.setParentName(menu.getMenuName());
				menu.getChilds().add(item);
			}
		});
		
		step1Menus.forEach(s1->{
			if(s1.getChilds() != null){
				s1.setChilds(s1.getChilds().stream().sorted().collect(Collectors.toList()));
			}
			s1.setParentName("-");
			
			MenuUserListRO ro = parseMenuVO(s1);
			list.add(ro);
			
			if(s1.getChilds() != null){
				s1.getChilds().forEach(s2 ->{
					MenuUserListRO ro2 = parseMenuVO(s2);
					list.add(ro2);
					
					if(s2.getChilds() != null){
						s2.getChilds().forEach(s3 ->{
							MenuUserListRO ro3 = parseMenuVO(s3);
							list.add(ro3);
							
							if(s3.getChilds() != null){
								s3.getChilds().forEach(s4 ->{
									MenuUserListRO ro4 = parseMenuVO(s4);
									list.add(ro4);
								});
							}
							
						});
					}
					
				});
			}
		});
		
		List<MenuVO> quickMenus = allMenus.stream().filter(item -> {return item.getMenuLevel() == 1 && item.getCodeMenuType().equals("quick");}).sorted().collect(Collectors.toList());
		// 퀵 메뉴 처리
		quickMenus.forEach(quick->{
			quick.setParentName("-");
			MenuUserListRO ro = parseMenuVO(quick);
			list.add(ro);
		});
		
		
		List<MenuUserListRO> searchList = new ArrayList<>();
		//검색 부문 처리
		if(StringUtils.isNotEmpty(param.getSearchKeyword())){
			if(StringUtils.isEmpty(param.getSearchOption())){
				//전체검색
				searchList = list.stream().filter(item -> {return item.getParentName().contains(param.getSearchKeyword()) || item.getMenuName().contains(param.getSearchKeyword());}).collect(Collectors.toList());
			}else if(param.getSearchOption().equals("parent")){
				searchList = list.stream().filter(item -> {return item.getParentName().contains(param.getSearchKeyword());}).collect(Collectors.toList());
			}else if(param.getSearchOption().equals("name")){
				searchList = list.stream().filter(item -> {return item.getMenuName().contains(param.getSearchKeyword());}).collect(Collectors.toList());
			}
			
		}else{
			searchList = list;			
		}
		
		//rownumber 처리
		for (int idx = 0; idx < searchList.size(); idx++){
			searchList.get(idx).setRow(idx + 1);
		}
		
		
		
		param.setMybatisPagging();
		
		int lastIdx = param.getOffset() + param.getLimit();
		
		if(searchList.size() < lastIdx){
			lastIdx = searchList.size();
		}
		List<MenuUserListRO> subList = searchList.subList(param.getOffset(), lastIdx);
		CommonListReuslt<MenuUserListRO> result = new CommonListReuslt<>(subList, searchList.size(), param);
		
		return result;
	}
	
	private MenuUserListRO parseMenuVO(final MenuVO target){
		MenuUserListRO item = new MenuUserListRO();
		item.setSeq(target.getSeq());
		item.setMenuName(target.getMenuName());
		item.setMenuOrder(target.getMenuOrder());
		item.setParentName(target.getParentName());
		item.setCodeMenuName(target.getCodeMenuName());
		item.setCodeLangName(target.getCodeLangName());
		item.setCodeLoginName(target.getCodeLoginName());
		item.setEditDate(target.getEditDate());
		item.setEditUserId(target.getEditUserId());
		item.setEditUserName(target.getEditUserName());
		
		return item;
	}

	/**
	 * @param seq seq
	 * @return 사용자 메뉴 상세 정보
	 */
	public MenuVO findUserMenuInfo(final int seq) {
		
		return mapper.findUserMenuInfo(seq);
	}

	/**
	 * @return 등록 수정시 필요한 기본 정보
	 */
	public AddMenuUserDefaultRO getDefaultInfo() {
		
		AddMenuUserDefaultRO item = new AddMenuUserDefaultRO();
		
		/** 언어 코드 */
		item.setLangCodes(codeService.findSlaveByMaster("lang"));
		/** 로그인 여부 코드 */
		item.setLoginCodes(codeService.findSlaveByMaster("menu-login"));
		/** 메뉴 종류 코드 */
		item.setTypeCodes(codeService.findSlaveByMaster("menu-type"));
		
		return item;
	}

	
	/**
	 * @param langCode 언어코드
	 * @return 등록 수정시에 사용할 상위 메뉴 선택
	 */
	public List<MenuSelectParentListRO> getHeadParentSelectInfo(final String langCode) {
		
		List<MenuSelectParentListRO> parentList = mapper.findUserMenuParent(langCode);
		
		return parentList;
	}
	
	
	/**
	 * @param langCode 언어코드
	 * @return 헤더메뉴 최상위 갯수
	 */
	public int getHeadTopCount(final String langCode) {
		
		int result = mapper.countUserHeadTopMenu(langCode);
		
		return result;
	}
	
	/**
	 * @param langCode 언어코드
	 * @return 퀵메뉴 갯수
	 */
	public int getQuickTopCount(final String langCode) {
		
		int result = mapper.countUserQuickMenu(langCode);
		
		return result;
	}

	/**
	 * @param param 등록 정보
	 * @param req req
	 * @return 등록 seq
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 */
	public int addUserMenu(final MenuUserAddPO param, final HttpServletRequest req) throws ClientProtocolException, IOException {
		
		this.updateUserMenuOrder(param.getParentSeq(), param.getMenuOrder(), param.getCodeLang(), param.getCodeMenu(), true, req);
		
		MenuVO item = new MenuVO();
		item.setCodeLangType(param.getCodeLang());
		item.setCodeMenuType(param.getCodeMenu());
		item.setCodeLoginType(param.getCodeLogin());
		item.setMenuName(param.getMenuName());
		item.setMenuUrl(param.getUrl());
		item.setMenuOrder(param.getMenuOrder());
		item.setParentSeq(param.getParentSeq());
		item.setRegUserId(SessionUtil.getAuthUserId());
		
		mapper.addMenuUser(item);
		
		MenuVO addData = findBySeq(item.getSeq());
		
		logEditService.insertAddLog(req, addData);
		
		adminUtilService.reloadServer();
		
		return item.getSeq();
	}
	
	/**
	 * @param parentSeq 부모 seq 최상위 부모일시 0으로 전달
	 * @param menuOrder 변경될 메뉴 순번들
	 * @param codeLang 언어 타입
	 * @param codeMenu 메뉴 타입
	 * @param incFlag 증가 감소 여부 증가 true, 감소 false
	 * @PAram req req
	 */
	private void updateUserMenuOrder(final int parentSeq, final int menuOrder, final String codeLang, final String codeMenu, final boolean incFlag, final HttpServletRequest req){
		
		MenuVO item = new MenuVO();
		item.setParentSeq(parentSeq);
		item.setMenuOrder(menuOrder);
		item.setCodeLangType(codeLang);
		item.setCodeMenuType(codeMenu);
		item.setEditUserId(SessionUtil.getAuthUserId());
		
		List<MenuVO> beforeData = mapper.checkMenuOrder(item);
		if(beforeData.size() > 0){
			if(incFlag){
				mapper.updateMenuOrderInc(item);
			}else{
				mapper.updateMenuOrderDec(item);
			}
			
			List<MenuVO> afterData = mapper.checkMenuOrder(item);
			
			//로그 기록
			logEditService.insertEditLog(req, beforeData, afterData);
		}
		
	}

	/**
	 * @param seq 메뉴 seq
	 * @param req req
	 * @return 성공 여부
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 */
	public boolean deleteUserMenu(final int seq, final HttpServletRequest req) throws ClientProtocolException, IOException {
		MenuVO beforeData = findBySeq(seq);
		
		MenuVO item = new MenuVO();
		item.setSeq(seq);
		item.setEditUserId(SessionUtil.getAuthUserId());
		
		mapper.deleteMenu(item);
		
		MenuVO afterData = findBySeq(seq);
		
		logEditService.insertEditLog(req, beforeData, afterData);
		
		updateUserMenuOrder(beforeData.getParentSeq(), beforeData.getMenuOrder() , beforeData.getCodeLangType(), beforeData.getCodeMenuType(), false, req);
		
		adminUtilService.reloadServer();
		
		return true;
	}


	/**
	 * @param menuInfo 메뉴 정보
	 * @return 부모 의 자식 카운트
	 */
	public int getParentSize(final MenuVO menuInfo) {
		int count = 0;
		if(menuInfo.getParentSeq() == 0){
			count = this.getHeadTopCount(menuInfo.getCodeLangType());
		}else{
			count = mapper.countUserHeadParentMenu(menuInfo);
		}
		return count;
	}
	
	/**
	 * @param seq 식별자
	 * @return 자식 메뉴 카운트
	 */
	public int getChildSize(final int seq) {
		return mapper.countByChild(seq);
	}


	/**
	 * @param param 수정 정보
	 * @param req req 
	 * @return 수정 성공 여부
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 */
	public boolean editUserMenu(final MenuUserEditPO param, final HttpServletRequest req) throws ClientProtocolException, IOException {
		
		MenuVO beforeData = findBySeq(param.getSeq());
		
		if(param.getParentSeq() == beforeData.getParentSeq()){
			//상위 메뉴가 기존과 동일 할 경우
			if(param.getMenuOrder() != beforeData.getMenuOrder()){
				//순서가 변경된 경우
				updateUserMenuOrder(param.getParentSeq(), beforeData.getMenuOrder(), beforeData.getCodeLangType(), beforeData.getCodeMenuType(), false, req);
				updateUserMenuOrder(param.getParentSeq(), param.getMenuOrder(), param.getCodeLang(), param.getCodeMenu(), true, req);
			}
		}else{
			//상위 메뉴가 변경 된 경우
			updateUserMenuOrder(beforeData.getParentSeq(), beforeData.getMenuOrder(), beforeData.getCodeLangType(), beforeData.getCodeMenuType(), false, req);
			updateUserMenuOrder(param.getParentSeq(), param.getMenuOrder(), param.getCodeLang(), param.getCodeMenu(), true, req);
		}
		
		MenuVO item = new MenuVO();
		item.setSeq(param.getSeq());
		item.setCodeLangType(param.getCodeLang());
		item.setCodeMenuType(param.getCodeMenu());
		item.setCodeLoginType(param.getCodeLogin());
		item.setMenuName(param.getMenuName());
		item.setMenuUrl(param.getUrl());
		item.setMenuOrder(param.getMenuOrder());
		item.setParentSeq(param.getParentSeq());
		item.setEditUserId(SessionUtil.getAuthUserId());
		
		mapper.editMenu(item);
		
		MenuVO afterData = findBySeq(param.getSeq());
		
		logEditService.insertEditLog(req, beforeData, afterData);
		
		adminUtilService.reloadServer();
		
		return true;
	}



}
