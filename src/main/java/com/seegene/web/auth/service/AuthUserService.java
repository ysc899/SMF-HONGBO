package com.seegene.web.auth.service;

import java.math.BigInteger;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.seegene.web.auth.vo.AuthUser;
import com.seegene.web.auth.vo.DB2TrmsLoginVO;
import com.seegene.web.auth.vo.DB2UserChangePwVO;
import com.seegene.web.auth.vo.DB2UserLoginVO;
import com.seegene.web.auth.vo.UserChangePwPO;
import com.seegene.web.auth.vo.UserLoginPO;
import com.seegene.web.auth.vo.UserLoginRO;
import com.seegene.web.common.IpUtil;
import com.seegene.web.common.StringUtil;
import com.seegene.web.repository.db2.DB2UserLoginMapper;

/**
 * 일반 사용자 로그인용
 */
@Service
public class AuthUserService {

	@Autowired
	private DB2UserLoginMapper db2UserLoginMapper;

	@Autowired
	private ShaPasswordEncoder encoder;

	@Autowired
	@Qualifier("org.springframework.security.authenticationManager")
	private AuthenticationManager authenticationManager;

	@Value("${trms.login.url}")
	private String TRMS_URL;

	/**
	 * @param userInfo
	 *            로그인 정보
	 * @param request
	 *            req
	 * @throws Exception
	 */
	public UserLoginRO userLogin(final UserLoginPO userInfo, final HttpServletRequest request) {

		UserLoginRO loginResult = new UserLoginRO();

		String ip = IpUtil.getRequestIp(request);
		String encodPwd = encoder.encodePassword(userInfo.getPwd(), null);
		DB2UserLoginVO loginInfo = new DB2UserLoginVO("NML", userInfo.getUserId().toUpperCase(), ip, userInfo.getPwd(),
				encodPwd);

		db2UserLoginMapper.callUserLogin(loginInfo);

		String checkCode = StringUtil.spaceRemove(loginInfo.getO_ERRCOD());

		int result = -1;

		if (StringUtils.isNumeric(checkCode)) {
			result = Integer.valueOf(checkCode);
		} else if (checkCode.equals("O")) {
			result = 0;
		}

		if (result == 0) {
			
			if (loginInfo.getO_PIYN().equals("Y") && loginInfo.getO_PUGB().equals("1")) {
				result = 8;
				loginResult.setCallUrl(userInfo.getUserId().toUpperCase());
				
			}else{

				Random random = ThreadLocalRandom.current();
				BigInteger base = BigInteger.valueOf(10000000);
				int randomBits = 30;
	
				BigInteger rnd_01 = base.add(new BigInteger(randomBits, random));
				BigInteger rnd_02 = base.add(new BigInteger(randomBits, random));
	
				String key_val = rnd_01.toString().concat(rnd_02.toString());
	
				DB2TrmsLoginVO trmsParam = new DB2TrmsLoginVO("NML", loginInfo.getI_UID(), key_val);
				db2UserLoginMapper.callTrmsLogin(trmsParam);
				if (trmsParam.getO_RSTCOD().equals("O")) {
					result = 7;
					loginResult.setCallUrl(TRMS_URL + key_val + "&I_DID=" + request.getAttribute("I_DID"));
				}
	
				loginInfo.setTrmsUrl(loginResult.getCallUrl());
				AuthUser authUser = new AuthUser(loginInfo);
				Authentication authentication = new UsernamePasswordAuthenticationToken(authUser, authUser.getPassword(),
						authUser.getAuthorities());
				SecurityContext securityContext = SecurityContextHolder.getContext();
				securityContext.setAuthentication(authentication);
	
				HttpSession session = request.getSession(true);
				session.setAttribute("roleType", loginInfo.getO_PUGB());
				System.out.println("############ role "+ session.getAttribute("roleType"));
				session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);

			}

		}
		loginResult.setCode(result);

		return loginResult;
	}

	/**
	 * @param userInfo
	 *            로그인 정보
	 * @param request
	 *            req
	 * @throws Exception
	 */
	public UserLoginRO userChangePw(final UserChangePwPO pwInfo, final HttpServletRequest request) {

		UserLoginRO loginResult = new UserLoginRO();

//		if (SessionUtil.isLogin()) {

		if (pwInfo.getNewPw().equals(pwInfo.getNewPwCheck())) {
//			String loginId = SessionUtil.getAuthUserId();
			String loginId = pwInfo.getUserId();

			String ip = IpUtil.getRequestIp(request);
			String nowPwEnc = encoder.encodePassword(pwInfo.getNowPw(), null);
			String newPwEnc = encoder.encodePassword(pwInfo.getNewPw(), null);

			DB2UserChangePwVO param = new DB2UserChangePwVO("NML", loginId.toUpperCase(), ip, pwInfo.getNowPw(),
					nowPwEnc, pwInfo.getNewPw(), newPwEnc);

			db2UserLoginMapper.callUserChangePw(param);

			if (param.getO_MSGCOD().equals("272")) {
				
				
				UserLoginPO loginPo = new UserLoginPO();
				loginPo.setUserId(loginId);
				loginPo.setPwd(pwInfo.getNewPw());
				
				loginResult = this.userLogin(loginPo, request);
				

			} else {
				loginResult.setCode(-7);
			}

		} else {
			// 신규 비밀번호와 확인이 다름
			loginResult.setCode(-8);
		}

//		} else {
//			// 로그인 안함
//			loginResult.setCode(-9);
//		}

		return loginResult;
	}

}
