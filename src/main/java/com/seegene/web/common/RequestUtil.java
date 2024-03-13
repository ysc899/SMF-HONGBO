package com.seegene.web.common;

import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

public abstract class RequestUtil {

	/**
	 * 기본 생성자
	 */
	private RequestUtil() {
	}

	public static HashMap<String, Object> convertMap(final HttpServletRequest request) {

		HashMap<String, Object> hmap = new HashMap<String, Object>();
		String key;

		Enumeration<?> enums = request.getParameterNames();

		while (enums.hasMoreElements()) {
			key = (String) enums.nextElement();
			if (request.getParameterValues(key).length > 1) {
				hmap.put(key, request.getParameterValues(key));
			} else {
				hmap.put(key, request.getParameter(key));
			}
		}

		return hmap;
	}

	public static String getClientOS(final HttpServletRequest req) {
		
		String userAgent = req.getHeader("User-Agent");
		
		String os = "";
		userAgent = userAgent.toLowerCase();
		
		if (userAgent.indexOf("windows nt 10.0") > -1) {
			os = "Windows10";
		} else if (userAgent.indexOf("windows nt 6.1") > -1) {
			os = "Windows7";
		} else if (userAgent.indexOf("windows nt 6.2") > -1 || userAgent.indexOf("windows nt 6.3") > -1) {
			os = "Windows8";
		} else if (userAgent.indexOf("windows nt 6.0") > -1) {
			os = "WindowsVista";
		} else if (userAgent.indexOf("windows nt 5.1") > -1) {
			os = "WindowsXP";
		} else if (userAgent.indexOf("windows nt 5.0") > -1) {
			os = "Windows2000";
		} else if (userAgent.indexOf("windows nt 4.0") > -1) {
			os = "WindowsNT";
		} else if (userAgent.indexOf("windows 98") > -1) {
			os = "Windows98";
		} else if (userAgent.indexOf("windows 95") > -1) {
			os = "Windows95";
		} else if (userAgent.indexOf("iphone") > -1) {
			os = "iPhone";
		} else if (userAgent.indexOf("ipad") > -1) {
			os = "iPad";
		} else if (userAgent.indexOf("android") > -1) {
			os = "android";
		} else if (userAgent.indexOf("mac") > -1) {
			os = "mac";
		} else if (userAgent.indexOf("linux") > -1) {
			os = "Linux";
		} else if (userAgent.indexOf("bingbot/") > -1 || userAgent.indexOf("googlebot/") > -1) {
			os = "Robot";
		} else {
			os = "기타";
		}
		return os;
	}

	public static String getClientBrowser(final HttpServletRequest req) {
		
		String userAgent = req.getHeader("User-Agent");
		
		String browser = "";
		if(userAgent.indexOf("Edg") > -1){
			browser = "Edge";
		}else if (userAgent.indexOf("Trident/7.0") > -1) {
			browser = "ie11";
		} else if (userAgent.indexOf("MSIE 10") > -1) {
			browser = "ie10";
		} else if (userAgent.indexOf("MSIE 9") > -1) {
			browser = "ie9";
		} else if (userAgent.indexOf("MSIE 8") > -1) {
			browser = "ie8";
		} else if (userAgent.indexOf("Chrome/") > -1) {
			browser = "Chrome";
		} else if (userAgent.indexOf("Safari/") > -1) {
			browser = "Safari";
		} else if (userAgent.indexOf("Firefox/") > -1) {
			browser = "Firefox";
		} else if (userAgent.indexOf("bingbot/") > -1 || userAgent.indexOf("Googlebot/") > -1) {
			browser = "Robot";
		} else {
			browser = "기타";
		}
		return browser;
	}

}
