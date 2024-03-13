package com.seegene.web.user.menu.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seegene.web.admin.code.service.CodeService;
import com.seegene.web.admin.code.vo.CodeSlaveRO;
import com.seegene.web.admin.menu.user.vo.MenuVO;
import com.seegene.web.common.SessionUtil;
import com.seegene.web.repository.mariadb.MenuUserMapper;
import com.seegene.web.user.menu.vo.MenuRO;

@Service
public class UserMenuService {

	@Autowired
	private MenuUserMapper mapper;
	
	@Autowired
	private CodeService codeService;
	
	
	private final Map<String, MenuRO> langLoginUserMenus = new HashMap<>();
	private final Map<String, MenuRO> langNoneLoginUserMenus = new HashMap<>();
	private final List<MenuVO> totalAllMenus = new ArrayList<>();
	
	
	public void initMenus(){
		
		langLoginUserMenus.clear();
		langNoneLoginUserMenus.clear();
		totalAllMenus.clear();
		
		List<CodeSlaveRO> langCodes = codeService.findLangCode();
		
		
		langCodes.forEach(lang ->{
			
			MenuRO result = new MenuRO();
			
			List<MenuVO> allMenus = mapper.findUserLangMenuList(lang.getSlaveCode());
			totalAllMenus.addAll(allMenus);
			
			
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
			
			// 퀵 메뉴 처리
			List<MenuVO> quickMenus = allMenus.stream().filter(item -> {return item.getMenuLevel() == 1 && item.getCodeMenuType().equals("quick");}).sorted().collect(Collectors.toList());
			
			result.setTopMenus(step1Menus);
			result.setQuickMenus(quickMenus);
			
			langLoginUserMenus.put(lang.getSlaveCode(), result);
			
			
			//비로그인 메뉴 레벨별 정렬
			result = new MenuRO();
			
			List<MenuVO> noneLoginMenus = mapper.findUserNonLoginLangMenuList(lang.getSlaveCode());
			
			List<MenuVO> stepNonLogin1Menus = noneLoginMenus.stream().filter(item -> {return item.getMenuLevel() == 1 && item.getCodeMenuType().equals("head") && item.getCodeLoginType().equals("anonymous");}).sorted().collect(Collectors.toList());
			List<MenuVO> stepNonLogin2Menus = noneLoginMenus.stream().filter(item -> {return item.getMenuLevel() == 2 && item.getCodeLoginType().equals("anonymous");}).sorted().collect(Collectors.toList());
			List<MenuVO> stepNonLogin3Menus = noneLoginMenus.stream().filter(item -> {return item.getMenuLevel() == 3 && item.getCodeLoginType().equals("anonymous");}).sorted().collect(Collectors.toList());
			List<MenuVO> stepNonLogin4Menus = noneLoginMenus.stream().filter(item -> {return item.getMenuLevel() == 4 && item.getCodeLoginType().equals("anonymous");}).sorted().collect(Collectors.toList());
			
			//트리 데이터 입력
			stepNonLogin4Menus.forEach(item ->{
				MenuVO menu = stepNonLogin3Menus.stream().filter(t ->{return t.getSeq() == item.getParentSeq();}).findAny().orElse(null);
				if(menu != null){
					if(menu.getChilds() == null){
						menu.setChilds(new ArrayList<>());
					}
					item.setParentName(menu.getMenuName());
					menu.getChilds().add(item);
				}
			});
			
			stepNonLogin3Menus.forEach(item ->{
				if(item.getChilds() != null){
					item.setChilds(item.getChilds().stream().sorted().collect(Collectors.toList()));
				}
				
				MenuVO menu = stepNonLogin2Menus.stream().filter(t ->{return t.getSeq() == item.getParentSeq();}).findAny().orElse(null);
				if(menu != null){
					if(menu.getChilds() == null){
						menu.setChilds(new ArrayList<>());
					}
					item.setParentName(menu.getMenuName());
					menu.getChilds().add(item);
				}
			});
			
			stepNonLogin2Menus.forEach(item ->{
				if(item.getChilds() != null){
					item.setChilds(item.getChilds().stream().sorted().collect(Collectors.toList()));
				}
				
				MenuVO menu = stepNonLogin1Menus.stream().filter(t ->{return t.getSeq() == item.getParentSeq();}).findAny().orElse(null);
				if(menu != null){
					if(menu.getChilds() == null){
						menu.setChilds(new ArrayList<>());
					}
					item.setParentName(menu.getMenuName());
					menu.getChilds().add(item);
				}
			});
			
			// 퀵 메뉴 처리
			List<MenuVO> nonLoginQuickMenus = noneLoginMenus.stream().filter(item -> {return item.getMenuLevel() == 1 && item.getCodeMenuType().equals("quick");}).sorted().collect(Collectors.toList());
			
			result.setTopMenus(stepNonLogin1Menus);
			result.setQuickMenus(nonLoginQuickMenus);
			
			langNoneLoginUserMenus.put(lang.getSlaveCode(), result);
			
		});
		
	}
	
	
	/**
	 * @param langCode 언어코드
	 * @return 메뉴정보
	 */
	public MenuRO getMenus(final String langCode){
		
		if(SessionUtil.isLogin()){
			return langLoginUserMenus.get(langCode);
		}else{
			return langNoneLoginUserMenus.get(langCode);
		}
		
	}
	
	public List<MenuVO> getChildMenus(final String langCode, final String url){
		MenuRO menus = this.getMenus(langCode);
		List<MenuVO> topMenu = menus.getTopMenus();
		
		return findChildMenu(topMenu, url);
	}
	
	private List<MenuVO> findChildMenu(final List<MenuVO> menus, final String url){
		for(MenuVO t : menus){
			if(StringUtils.isNotEmpty(t.getMenuUrl()) && t.getMenuUrl().equals(url)){
				return t.getChilds();
			}else{
				if(t.getChilds() != null){
					return findChildMenu(t.getChilds(), url);
				}
			}
		}
		return null;
	}
	
	public MenuVO getUrl2Menu(final String langCode,final String url){
		return totalAllMenus.stream().filter(t -> {return StringUtils.isNotEmpty(t.getMenuUrl()) && t.getMenuUrl().equals(url) && t.getCodeLangType().equals(langCode);}).findFirst().orElse(null); 
	}
	
	public String getUrl2Name(final String langCode,final String url){
		MenuVO menu = getUrl2Menu(langCode, url);
		if(menu != null){
			return menu.getMenuName();
		}else{
			return "";
		}
		
	}
}
