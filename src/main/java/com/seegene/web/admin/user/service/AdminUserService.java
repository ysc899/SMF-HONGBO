package com.seegene.web.admin.user.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.seegene.web.admin.log.edit.service.LogEditService;
import com.seegene.web.admin.menu.admin.service.MenuAdminService;
import com.seegene.web.admin.menu.admin.vo.MenuAdminVO;
import com.seegene.web.admin.role.service.AdminRoleService;
import com.seegene.web.admin.role.vo.AdminRoleMenuMappingVO;
import com.seegene.web.admin.user.vo.AddAdminDefaultInfoRO;
import com.seegene.web.admin.user.vo.AdminInfoRO;
import com.seegene.web.admin.user.vo.AdminUserMenuMappingVO;
import com.seegene.web.admin.user.vo.AdminUserPO;
import com.seegene.web.admin.user.vo.AdminUserVO;
import com.seegene.web.admin.user.vo.EditMyInfoPO;
import com.seegene.web.admin.user.vo.MainAdminMenuRO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.common.SearchPaggingCommonPO;
import com.seegene.web.common.SessionUtil;
import com.seegene.web.repository.mariadb.AdminUserMapper;

import lombok.extern.java.Log;

@Log
@Transactional
@Service
public class AdminUserService {

	@Autowired
	private AdminUserMapper userMapper;
	
	@Autowired
	private MenuAdminService menuAdminService;
	
	@Autowired
	private AdminRoleService adminRoleService;
	
	@Autowired
	private LogEditService logEditService;
	
//	@Autowired
//	private PasswordEncoder passwordEncoder;
//	private ShaPasswordEncoder passwordEncoder = new ShaPasswordEncoder(256);
	
	@Autowired
	private ShaPasswordEncoder passwordEncoder;

	/**
	 * @param userId 사용자 id
	 * @return 로그인 가능한 관리자 정보
	 */
	public AdminUserVO findUserId(final String userId){
		
		return userMapper.selectByUserId(userId);
		
	}
	
	/**
	 * @param userId 사용자 id
	 * @return 관리자 페이지 메뉴용 데이터
	 */
	public List<MainAdminMenuRO> findMainAdminMenu(final String userId){
		
		List<MainAdminMenuRO> menus = userMapper.findByMainAdminUserMenus(userId);
		
		List<MainAdminMenuRO> parentList = menus.stream().filter(item ->{
			return item.getParentSeq() == 0;
		}).sorted().collect(Collectors.toList());
		
		parentList.forEach(parent ->{
			parent.setChilds(menus.stream().filter(item ->{
				return item.getParentSeq() == parent.getSeq();
			}).sorted().collect(Collectors.toList()));
			
		});
		
		return parentList;
	}
	
	
	/**
	 * @param userId 최종 로그인 시간 업데이트 할 사용자 id
	 */
	public void updateLastLogin(final String userId){
		userMapper.updateLastLogin(userId);
	}
	
	
	/**
	 * @param param 검색 및 페이징 조건
	 * @return 검색 및 페이징 조건에 해당하는 리스트
	 */
	public CommonListReuslt<AdminUserVO> findAdminList(final SearchPaggingCommonPO param){
		
		param.setMybatisPagging();
		
		List<AdminUserVO> list = userMapper.findAdminList(param);
		int count = userMapper.countAdminList(param);
		
		CommonListReuslt<AdminUserVO> result = new CommonListReuslt<>(list, count, param);
		
		return result;
	}

	/**
	 * @param userId 조회할 관리자 id
	 */
	public AdminInfoRO findAdminInfo(final String userId) {
		
		AdminInfoRO result = new AdminInfoRO();
		AdminUserVO userInfo = userMapper.findAdminInfo(userId);
		result.setUser(userInfo);
		
		if(userInfo != null){
			result.setUserMenus(this.findMainAdminMenu(userId));
		}
		
		return result;
	}

	/**
	 * @param userId 중복 체크할 사용자 아이디
	 * @return 중복 여부
	 */
	public boolean checkUserId(final String userId) {
		return userMapper.countUserId(userId) == 0;
	}
	
	/**
	 * @return 관리자 등록시 기본적으로 필요한 정보들
	 */
	public AddAdminDefaultInfoRO getAddAdminDefaultInfo(){
		
		AddAdminDefaultInfoRO info = new AddAdminDefaultInfoRO();
		
		info.setMenus(menuAdminService.findAllAdminMenu());
		info.setRoles(adminRoleService.findAllAdminRoles());
		
		return info;
	}

	/**
	 * @param roleName 롤명
	 * @return 롤에대한 메류 리스트
	 */
	public List<AdminRoleMenuMappingVO> findRoleInfo(final String roleName) {

		return adminRoleService.findRoleMenuByRoleName(roleName);
	}

	/**
	 * @param param 등록될 관리자 정보
	 * @param req req
	 * @return 등록 결과
	 */
	public int addAdminUser(final AdminUserPO param, final HttpServletRequest req) {
		if(!this.checkUserId(param.getUserId())){
			return -9;
		}
		
		AdminUserVO item = new AdminUserVO();
		item.setUserId(param.getUserId());
		item.setPassword(passwordEncoder.encodePassword(param.getPassword(), null));
		item.setName(param.getName());
		item.setContact(param.getContact());
		item.setEmail(param.getEmail());
		item.setComment(param.getComment());
		item.setRegUserId(SessionUtil.getAuthUserId());
		
		userMapper.addAdminUser(item);
		
		AdminInfoRO resultInfo = this.findAdminInfo(item.getUserId());
		
		logEditService.insertAddLog(req, resultInfo);
		
		
		addAdminUserMenu(param, item, req, true);
		return 1;
	}
	
	/**
	 * 
	 * @param param 데이터 입력 파라미터 정보
	 * @param user 등록된 사용자 정보
	 * @return 등록 성공 여부
	 */
	private boolean addAdminUserMenu(final AdminUserPO param, final AdminUserVO user, final HttpServletRequest req, final boolean logFlag){
		List<MenuAdminVO> allMenus = menuAdminService.findAll();
		final List<AdminUserMenuMappingVO> addAdminUserMenus = new ArrayList<>();
		
		final List<Integer> writeSeqs = Arrays.stream(param.getWriteSeqs()).boxed().collect(Collectors.toList());
		final List<Integer> readSeqs = Arrays.stream(param.getReadSeqs()).boxed().collect(Collectors.toList());
		final List<Integer> parentSeqs = Arrays.stream(param.getParentSeqs()).boxed().distinct().collect(Collectors.toList());
		
		allMenus.forEach(target ->{
			AdminUserMenuMappingVO item = new AdminUserMenuMappingVO(); 
			
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
			
			item.setUserId(user.getUserId());
			item.setRegUserId(SessionUtil.getAuthUserId());
			
			addAdminUserMenus.add(item);
		});
		
		userMapper.addAdminUserMenu(addAdminUserMenus);
		
		if(logFlag){
			List<AdminUserMenuMappingVO> addResult = userMapper.findAllUserMenu(user.getUserId());
			
			logEditService.insertAddLog(req, addResult);
		}
		
		return true;
	}

	/**
	 * @param userId 삭제할 관리자 id
	 * @param req 리퀘스트
	 * @return 삭제 성공 여부
	 */
	public boolean deleteAdminUser(final String userId, final HttpServletRequest req) {
		
		AdminUserVO beforeData = this.findUserId(userId);
		
		AdminUserVO deleteParam = new AdminUserVO();
		deleteParam.setUserId(userId);
		deleteParam.setEditUserId(SessionUtil.getAuthUserId());
		
		userMapper.deleteAdminUser(deleteParam);
		
		AdminUserVO afterData = this.findUserId(userId);
		
		logEditService.insertEditLog(req, beforeData, afterData);
		
		
		return true;
	}

	/**
	 * @param param 수정할 파라미터
	 * @param req req
	 * @return 성공 여부
	 */
	public int editAdminUser(final AdminUserPO param, final HttpServletRequest req) {
		
		AdminUserVO beforeData = this.findUserId(param.getUserId());
		
		if(beforeData == null){
			return -9;
		}
		
		AdminUserVO item = new AdminUserVO();
		item.setUserId(param.getUserId());
		
		if(StringUtils.isNotEmpty(param.getPassword())){
//			item.setPassword(passwordEncoder.encode(param.getPassword()));
			item.setPassword(passwordEncoder.encodePassword(param.getPassword(), null));
		}
		item.setName(param.getName());
		item.setContact(param.getContact());
		item.setEmail(param.getEmail());
		item.setComment(param.getComment());
		item.setEditUserId(SessionUtil.getAuthUserId());
		
		userMapper.editAdminUser(item);
		
		AdminInfoRO resultInfo = this.findAdminInfo(item.getUserId());
		
		logEditService.insertEditLog(req, beforeData, resultInfo);
		
		
		editAdminUserMenu(param, item, req);
		return 1;
	}

	/**
	 * @param param 사용자 수정 정보 파라미터
	 * @param item 사용자 vo
	 * @param req req
	 */
	private void editAdminUserMenu(final AdminUserPO param, final AdminUserVO item, final HttpServletRequest req) {
		
		List<AdminUserMenuMappingVO> beforeData = userMapper.findAllUserMenu(param.getUserId());
		
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
			userMapper.deleteAllUserMenu(item);
			
			addAdminUserMenu(param, item, req, false);
			
			List<AdminUserMenuMappingVO> afterData = userMapper.findAllUserMenu(param.getUserId());
			
			logEditService.insertEditLog(req, beforeData, afterData);
		}
	}
	
	/**
	 * @param param 수정 파라미터
	 * @param req req
	 * @return 수정 성공 여부 
	 * <pre>
	 *  -9 : 사용자 정보 없음
	 *  -8 : 기존 비밀번호 불일치
	 *  -7 : 신규 비밀번호 입력값 검증 통과 못함
	 * 
	 * </pre>
	 */
	public int editMyInfo(final EditMyInfoPO param, final HttpServletRequest req){
	
		String authUserId = SessionUtil.getAuthUserId();
		AdminUserVO myInfo = findUserId(authUserId);
		
		if(myInfo == null){
			return -9;
		}
		
		String nowPw = passwordEncoder.encodePassword(param.getNowPassword(), null);
		if(!myInfo.getPassword().equals(nowPw)){
			return -8;
		}

		if(!param.getNewPassword().equals(param.getNewCheckPassword())){
			return -7;
		}
		
		AdminUserVO item = new AdminUserVO();
		item.setUserId(authUserId);
		item.setEditUserId(authUserId);
		item.setPassword(passwordEncoder.encodePassword(param.getNewPassword(), null));
		
		userMapper.editMyInfo(item);
		
		AdminUserVO afterData = findUserId(authUserId);
		
		logEditService.insertEditLog(req, myInfo, afterData);
		
		return 1;
	}
	
	
}
