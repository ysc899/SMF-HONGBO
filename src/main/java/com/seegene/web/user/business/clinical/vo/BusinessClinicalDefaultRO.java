package com.seegene.web.user.business.clinical.vo;

import java.util.List;

import com.seegene.web.admin.menu.user.vo.MenuVO;
import com.seegene.web.user.code.vo.CodeRO;

import lombok.Data;

@Data
public class BusinessClinicalDefaultRO {
	
	List<MenuVO> tabMenus;
	
	List<CodeRO> locCodes;
	
}

