package com.seegene.web.admin.role.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.seegene.web.admin.log.edit.service.LogEditService;
import com.seegene.web.admin.menu.admin.service.MenuAdminService;
import com.seegene.web.admin.menu.admin.vo.MenuAdminVO;
import com.seegene.web.admin.role.vo.AdminRoleMenuMappingVO;
import com.seegene.web.admin.role.vo.AdminRoleMenuRO;
import com.seegene.web.admin.role.vo.AdminRoleVO;
import com.seegene.web.admin.role.vo.RoleInfoRO;
import com.seegene.web.admin.role.vo.RolePO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.SearchPaggingCommonPO;
import com.seegene.web.common.SessionUtil;
import com.seegene.web.repository.mariadb.AdminRoleMapper;

@Transactional
@Service
public class AdminRoleService {

	@Autowired
	private AdminRoleMapper adminRoleMapper;
	
	@Autowired
	private MenuAdminService menuAdminService;

	@Autowired
	private LogEditService logEditService;
	
	/**
	 * @param roleName 롤 이름
	 * @return 롤 정보
	 */
	private AdminRoleVO findRoleByRoleName(final String roleName){
		
		return adminRoleMapper.findRoleByRoleName(roleName);
	}
	
	/**
	 * @param roleName 롤 이름
	 * @return 삭제되지 않은 롤 메뉴 리스트
	 */
	private List<AdminRoleMenuMappingVO> findRoleMenuAllInfoByRoleName(final String roleName){
		return adminRoleMapper.findMenuAllInfoByRoleName(roleName);
	}
	
	/**
	 * @return 모든 관리자 권한 리스트
	 */
	public List<AdminRoleVO> findAllAdminRoles(){
		
		return adminRoleMapper.findAllAdminRole();
	}
	/**
	 * 
	 * @param roleName 롤명
	 * @return 롤에 해당하는 메뉴 리스트
	 */
	public List<AdminRoleMenuMappingVO> findRoleMenuByRoleName(final String roleName){
		return adminRoleMapper.findRoleMenuByRoleName(roleName);
	}

	/**
	 * @param param 검색 조건
	 * @return 검색 및 페이징 조건에 해당 하는 리스트
	 */
	public CommonListReuslt<AdminRoleVO> findRoleList(final SearchPaggingCommonPO param) {
		param.setMybatisPagging();
		
		List<AdminRoleVO> list = adminRoleMapper.findRoleList(param);
		int count = adminRoleMapper.countRoleList(param);
		CommonListReuslt<AdminRoleVO> result = new CommonListReuslt<>(list, count, param);
		
		return result;
	}

	/**
	 * @param roleName 롤명
	 * @return 롤 상세 정보
	 */
	public RoleInfoRO findRoleInfo(final String roleName) {
		
		RoleInfoRO result = new RoleInfoRO();
		AdminRoleVO roleInfo = adminRoleMapper.findRoleInfo(roleName);
		result.setRole(roleInfo);
		if(roleInfo != null){
			List<AdminRoleMenuRO> menus = adminRoleMapper.findRoleMenuInfoByRoleName(roleName);
			
			List<AdminRoleMenuRO> parentList = menus.stream().filter(item ->{
				return item.getMenuParentSeq() == 0;
			}).sorted().collect(Collectors.toList());
			
			parentList.forEach(parent ->{
				parent.setChilds(menus.stream().filter(item ->{
					return item.getMenuParentSeq() == parent.getMenuAdminSeq();
				}).sorted().collect(Collectors.toList()));
				
			});
			
			result.setRoleMenus(parentList);
		}
		
		return result;
	}
	
	/**
	 * @return 모든 관리자 메뉴 리스트
	 */
	public List<MenuAdminVO> getDefaultMenuList(){
		return menuAdminService.findAllAdminMenu();
	}

	/**
	 * @param roleName 권한 id
	 * @return 중복 여부
	 */
	public boolean checkRoleName(final String roleName) {
		return adminRoleMapper.countRoleName(roleName) == 0;
	}

	/**
	 * @param param 등록정보
	 * @param req req
	 * @return 등록 성공 여부
	 */
	public int addRole(final RolePO param, final HttpServletRequest req) {
		if(!this.checkRoleName(param.getRoleName())){
			return -9;
		}
		
		AdminRoleVO item = new AdminRoleVO();
		item.setRoleName(param.getRoleName());
		item.setRoleDesc(param.getRoleDesc());
		item.setRegUserId(SessionUtil.getAuthUserId());
		
		adminRoleMapper.addRoleInfo(item);
		
		AdminRoleVO resultInfo = this.findRoleByRoleName(param.getRoleName());
		
		logEditService.insertAddLog(req, resultInfo);
		
		addRoleMenu(param, item, req, true);
		
		return 1;
	}
	
	/**
	 * @param param 입력된 파라미터
	 * @param role 롤 정보
	 * @param req 리퀘스트
	 * @param logFlag 로그 등록 플래그
	 * @return 롤에 메뉴 권한 입력 성공 여부
	 */
	private boolean addRoleMenu(final RolePO param, final AdminRoleVO role, final HttpServletRequest req, final boolean logFlag){
		
		List<MenuAdminVO> allMenus = menuAdminService.findAll();
		final List<AdminRoleMenuMappingVO> addRoleMenus = new ArrayList<>();
		
		final List<Integer> writeSeqs = Arrays.stream(param.getWriteSeqs()).boxed().collect(Collectors.toList());
		final List<Integer> readSeqs = Arrays.stream(param.getReadSeqs()).boxed().collect(Collectors.toList());
		final List<Integer> parentSeqs = Arrays.stream(param.getParentSeqs()).boxed().distinct().collect(Collectors.toList());
		
		allMenus.forEach(target ->{
			AdminRoleMenuMappingVO item = new AdminRoleMenuMappingVO(); 
			
			item.setMenuAdminSeq(target.getSeq());
			if(writeSeqs.contains(item.getMenuAdminSeq())){
				item.setReadFlag("Y");
				item.setWriteFlag("Y");
			}else if(parentSeqs.contains(item.getMenuAdminSeq()) || readSeqs.contains(item.getMenuAdminSeq())){
				item.setReadFlag("Y");
				item.setWriteFlag("N");
			}else{
				item.setReadFlag("N");
				item.setWriteFlag("N");
			}
			
			item.setRoleName(role.getRoleName());
			item.setRegUserId(SessionUtil.getAuthUserId());
			
			addRoleMenus.add(item);
		});
		
		adminRoleMapper.addRoleMenu(addRoleMenus);
		
		if(logFlag){
			List<AdminRoleMenuMappingVO> addResult = this.findRoleMenuAllInfoByRoleName(role.getRoleName());
			
			logEditService.insertAddLog(req, addResult);
		}
		
		return true;
	}

	/**
	 * @param roleName 롤 id
	 * @param req req
	 * @return 삭제 성공 결과
	 */
	public boolean deleteRole(final String roleName, final HttpServletRequest req) {
		AdminRoleVO beforeData = this.findRoleByRoleName(roleName);
		
		AdminRoleVO deleteParam = new AdminRoleVO();
		deleteParam.setRoleName(roleName);
		deleteParam.setEditUserId(SessionUtil.getAuthUserId());
		
		adminRoleMapper.deleteRole(deleteParam);
		
		AdminRoleVO afterData = this.findRoleByRoleName(roleName);
		
		logEditService.insertEditLog(req, beforeData, afterData);
		
		return true;
	}
	
	/**
	 * @param param 수정할 파라미터
	 * @param req req
	 * @return 성공 여부
	 */
	public int editRole(final RolePO param, final HttpServletRequest req) {
		
		AdminRoleVO beforeData = this.findRoleByRoleName(param.getRoleName());
		
		if(beforeData == null){
			return -9;
		}
		
		AdminRoleVO item = new AdminRoleVO();
		item.setRoleName(param.getRoleName());
		item.setRoleDesc(param.getRoleDesc());
		item.setEditUserId(SessionUtil.getAuthUserId());
		
		adminRoleMapper.editRole(item);
		
		AdminRoleVO resultInfo = this.findRoleByRoleName(param.getRoleName());
		
		logEditService.insertEditLog(req, beforeData, resultInfo);
		
		
		editRoleMenu(param, item, req);
		return 1;
	}
	
	/**
	 * @param param 롤 수정 정보
	 * @param item 롤 vo
	 * @param req req
	 */
	private void editRoleMenu(final RolePO param, final AdminRoleVO item, final HttpServletRequest req) {
		
		List<AdminRoleMenuMappingVO> beforeData = this.findRoleMenuAllInfoByRoleName(item.getRoleName());
		
		//데이터 변경 확인
		List<Integer> readList = beforeData.stream()
			.filter(t -> t.getReadFlag().equals("Y"))
			.map(t -> t.getMenuAdminSeq())
			.sorted()
			.collect(Collectors.toList());
		
		List<Integer> writeList = beforeData.stream()
			.filter(t -> t.getWriteFlag().equals("Y"))
			.map(t -> t.getMenuAdminSeq())
			.sorted()
			.collect(Collectors.toList());
		
		final List<Integer> writeSeqs = Arrays.stream(param.getWriteSeqs()).boxed().collect(Collectors.toList());
		final List<Integer> readSeqs = Arrays.stream(param.getReadSeqs()).boxed().collect(Collectors.toList());
		final List<Integer> parentSeqs = Arrays.stream(param.getParentSeqs()).boxed().distinct().collect(Collectors.toList());
		
		List<Integer> rSeqs = Stream.of(readSeqs, parentSeqs).flatMap(Collection::stream).sorted().collect(Collectors.toList());
		
		boolean checkWrite = writeList.equals(writeSeqs);
		boolean checkRead = readList.equals(rSeqs);
		
		
		if(!checkWrite || !checkRead){
			//데이터 변경시에만 작업
			adminRoleMapper.deleteAllRoleMenu(item);
			
			addRoleMenu(param, item, req, false);
			
			List<AdminRoleMenuMappingVO> afterData = this.findRoleMenuAllInfoByRoleName(item.getRoleName());
			
			logEditService.insertEditLog(req, beforeData, afterData);
		}
	}
}
