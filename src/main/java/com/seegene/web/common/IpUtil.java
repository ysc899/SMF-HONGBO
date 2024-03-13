package com.seegene.web.common;

import java.net.InetAddress;
import java.net.UnknownHostException;

import javax.servlet.http.HttpServletRequest;

/** IP 관련 유틸 */
public abstract class IpUtil {


	/** 기본 생성자 */
	private IpUtil(){
		
	}
	
	/**
	 * @param req
	 *            리퀘스트
	 * @return ip
	 */
	public static String getRequestIp(HttpServletRequest req) {
		String ip = req.getHeader("x-forwarded-for");

		if (ip == null) {
			ip = req.getHeader("X-FORWARDED-FOR");
		}
		if (ip == null) {
			ip = req.getHeader("Proxy-Client-IP");
		}
		if (ip == null) {
			ip = req.getHeader("WL-Proxy-Client-IP"); // 웹로직;
		}
		if (ip == null) {
			ip = req.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null) {
			ip = req.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null) {
			ip = req.getRemoteAddr();
		}

		return ip;
	}
	
	public static String getServerHostName(){
		InetAddress local;
		String ip = "";
		try {
			local = InetAddress.getLocalHost();
			ip = local.getHostName();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
//			e.printStackTrace();
			
		}
		
		return ip;
	}
	
	
}
