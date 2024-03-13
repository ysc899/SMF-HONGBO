package com.seegene.web.repository.db2;

import com.seegene.web.auth.vo.DB2TrmsLoginVO;
import com.seegene.web.auth.vo.DB2UserChangePwVO;
import com.seegene.web.auth.vo.DB2UserLoginVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface DB2UserLoginMapper {
	
	void callUserLogin(DB2UserLoginVO param);
	
	void callUserChangePw(DB2UserChangePwVO param);
	
	void callTrmsLogin(DB2TrmsLoginVO param);
}
