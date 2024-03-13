package com.seegene.web.admin.menu.admin.service;

import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.seegene.web.admin.log.edit.service.LogEditService;
import com.seegene.web.admin.menu.admin.vo.AddMenuAdminDefaultInfoRO;
import com.seegene.web.admin.menu.admin.vo.MenuAdminAddPO;
import com.seegene.web.admin.menu.admin.vo.MenuAdminEditPO;
import com.seegene.web.admin.menu.admin.vo.MenuAdminListRO;
import com.seegene.web.admin.menu.admin.vo.MenuAdminVO;
import com.seegene.web.admin.menu.admin.vo.MenuAdminViewRO;
import com.seegene.web.admin.user.vo.MainAdminMenuRO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.SearchPaggingCommonPO;
import com.seegene.web.common.SessionUtil;
import com.seegene.web.repository.mariadb.MenuAdminMapper;

/**
 * 관리자 메뉴 서비스
 */
@Service
@Transactional
public class MenuAdminService {

	
	@Autowired
	private MenuAdminMapper mapper;
	
	@Autowired
	private LogEditService logEditService;

	/**
	 * 
	 * @return 트리 구조가 아닌 관리자 메뉴 리스트
	 */
	public List<MenuAdminVO> findAll() {
		List<MenuAdminVO> adminMenus = mapper.findAllAdminMenu();
		return adminMenus;
	}
	/**
	 * @return 관리자 메뉴 리스트
	 */
	public List<MenuAdminVO> findAllAdminMenu(){
		List<MenuAdminVO> adminMenus = findAll();
		
		List<MenuAdminVO> parentList = adminMenus.stream().filter(item ->{
			return item.getParentSeq() == 0;
		}).sorted().collect(Collectors.toList());
		
		parentList.forEach(parent ->{
			parent.setChilds(adminMenus.stream().filter(item ->{
				return item.getParentSeq() == parent.getSeq();
			}).sorted().collect(Collectors.toList()));
			
		});
		return parentList;
	}
	
	/**
	 * 관리자 메뉴 관리 리스트용
	 * @param param 관리자 메뉴 리스트 조회 조건
	 * @return 검색된 관리자 메뉴 리스트 결과
	 */
	public CommonListReuslt<MenuAdminListRO> findAdminMenuList(final SearchPaggingCommonPO param) {
		param.setMybatisPagging();
		List<MenuAdminListRO> list = mapper.findAdminMenuList(param);
		int count = mapper.countAdminMenuList(param);
		
		CommonListReuslt<MenuAdminListRO> result = new CommonListReuslt<>(list, count, param);
		return result;
	}
	
	/**
	 * @param seq 메뉴 seq
	 * @return 메뉴 정보
	 */
	public MenuAdminViewRO findAdminMenuInfo(final int seq) {
		
		return mapper.findAdminMenuInfo(seq);
	}
	
	/**
	 * @return 관리자 메뉴 등록시 사용할 기본 정보
	 */
	public AddMenuAdminDefaultInfoRO getAddAdminMenuDefaultInfo() {
		
		AddMenuAdminDefaultInfoRO info = new AddMenuAdminDefaultInfoRO();
		
		info.setParentList(mapper.findAdminMenuParent());
		
		return info;
	}
	
	/**
	 * @param seq 관리자 메뉴 식별자
	 * @return 관리자 메뉴 정보
	 */
	private MenuAdminVO findBySeq(final int seq){
		return mapper.findBySeq(seq);
	}
	
	
	/**
	 * 
	 * @param param 관리자 메뉴 등록 파라미터
	 * @param req req
	 */
	public int addAdminMenu(final MenuAdminAddPO param, final HttpServletRequest req) {
		
		this.updateAdminMenuOrder(param.getParent(), param.getMenuOrder(), true, req);
		
		MenuAdminVO item = new MenuAdminVO();
		
		item.setMenuName(param.getMenuName());
		item.setMenuOrder(param.getMenuOrder());
		if(param.getParent() != 0){
			item.setParentSeq(param.getParent());
			String url = param.getUrl().replace("index.do", "");
			item.setMenuUrl(url);
		}
		
		item.setRegUserId(SessionUtil.getAuthUserId());
		
		mapper.addMenuAdmin(item);
		
		MenuAdminVO addData = findBySeq(item.getSeq());
		
		logEditService.insertAddLog(req, addData);
		
		return item.getSeq();
	}
	
	/**
	 * @param menuName 메뉴명
	 * @param seq 게시판 혹은 faq seq
	 * @param req req
	 * @return 등록된 메뉴 seq
	 */
	public int addBoardNFaqMenu(final String menuName, final int seq, final HttpServletRequest req){
		
		String url = req.getRequestURI();
		
		MainAdminMenuRO parentMenu = SessionUtil.getNowMenuParent(url);
		MainAdminMenuRO nowMenu = SessionUtil.getNowMenu(url);
		
		MenuAdminAddPO item = new MenuAdminAddPO();
		item.setMenuName(menuName);
		item.setMenuOrder(parentMenu.getChilds().size()+1);
		item.setParent(parentMenu.getSeq());
		
		String menuUrl = nowMenu.getMenuUrl();
		menuUrl = menuUrl.replace("manage", "integrated") + String.valueOf(seq) + "/";
		item.setUrl(menuUrl);
		
		return this.addAdminMenu(item, req);
	}
	
	/**
	 * @param parentSeq 부모 seq 최상위 부모일시 0으로 전달
	 * @param menuOrder 변경될 메뉴 순번들
	 * @param incFlag 증가 감소 여부 증가 true, 감소 false
	 * @PAram req req
	 */
	private void updateAdminMenuOrder(final int parentSeq, final int menuOrder, final boolean incFlag, final HttpServletRequest req){
		
		MenuAdminVO item = new MenuAdminVO();
		item.setParentSeq(parentSeq);
		item.setMenuOrder(menuOrder);
		item.setEditUserId(SessionUtil.getAuthUserId());
		
		List<MenuAdminVO> beforeData = mapper.checkMenuOrder(item);
		if(beforeData.size() > 0){
			if(incFlag){
				mapper.updateMenuOrderInc(item);
			}else{
				mapper.updateMenuOrderDec(item);
			}
			
			List<MenuAdminVO> afterData = mapper.checkMenuOrder(item);
			
			//로그 기록
			logEditService.insertEditLog(req, beforeData, afterData);
		}
		
	}
	
	
	
	/**
	 * @param seq 메뉴 seq
	 * @param req req
	 * @return 성공 여부
	 */
	public boolean deleteAdminMenu(final int seq, final HttpServletRequest req) {
		
		MenuAdminVO beforeData = findBySeq(seq);
		
		MenuAdminVO item = new MenuAdminVO();
		item.setSeq(seq);
		item.setEditUserId(SessionUtil.getAuthUserId());
		
		mapper.deleteMenu(item);
		
		MenuAdminVO afterData = findBySeq(seq);
		
		logEditService.insertEditLog(req, beforeData, afterData);
		
		updateAdminMenuOrder(beforeData.getParentSeq(), beforeData.getMenuOrder() , false, req);
		
		return true;
	}
	
	/**
	 * @param param 수정 정보
	 * @param req req
	 * @return 수정 결과
	 */
	public boolean editAdminMenu(final MenuAdminEditPO param, final HttpServletRequest req) {
		
		MenuAdminVO beforeData = findBySeq(param.getSeq());
		
		if(param.getParent() == beforeData.getParentSeq()){
			//상위 메뉴가 기존과 동일 할 경우
			if(param.getMenuOrder() != beforeData.getMenuOrder()){
				//순서가 변경된 경우
				updateAdminMenuOrder(param.getParent(), beforeData.getMenuOrder(), false, req);
				updateAdminMenuOrder(param.getParent(), param.getMenuOrder(), true, req);
			}
			
		}else if(param.getParent() != beforeData.getParentSeq()){
			//최 상위가 아니며 상위 메뉴가 기존과 동일 하지 않을 경우
			//기존거 앞으로 당기기
			updateAdminMenuOrder(beforeData.getParentSeq(), beforeData.getMenuOrder(), false, req);
			//신규 위치 조정
			updateAdminMenuOrder(param.getParent(), param.getMenuOrder(), true, req);
		}
		MenuAdminVO item = new MenuAdminVO();
		item.setSeq(param.getSeq());
		item.setMenuName(param.getMenuName());
		item.setMenuOrder(param.getMenuOrder());
		item.setParentSeq(param.getParent());
		if(param.getParent() > 0){
			item.setMenuUrl(param.getUrl().replace("index.do", ""));
		}
		item.setEditUserId(SessionUtil.getAuthUserId());
		
		mapper.editMenu(item);
		
		MenuAdminVO afterData = findBySeq(param.getSeq());
		
		logEditService.insertEditLog(req, beforeData, afterData);
		
		return true;
	}

	
	
}
