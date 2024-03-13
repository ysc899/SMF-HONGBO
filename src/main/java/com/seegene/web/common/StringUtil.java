package com.seegene.web.common;

import org.apache.commons.lang3.StringUtils;

/**
 * 문자열 처리 관련 유틸 클래스
 */
public abstract class StringUtil {

	/**
	 * 기본 생성자
	 */
	private StringUtil() {
	}

	/**
	 * @param str 처리할 문자열
	 * @return 특수문자 제거된 문자열
	 */
	public static String specialRemove(final String str) {
		if (StringUtils.isNotEmpty(str)) {
			String match = "[^\uAC00-\uD7A3xfe0-9a-zA-Z\\s]";
			return str.replaceAll(match, " ");
		} else {
			return "";
		}
	}

	/**
	 * @param str 처리할 문자열
	 * @return 스페이스가 제거된 문자열
	 */
	public static String spaceRemove(final String str) {
		if (StringUtils.isNotEmpty(str)) {
			String target = str;
			String match2 = "\\s{2,}";
			target = target.replaceAll(match2, "");
			target = target.replaceAll("\\p{Z}", "");
			target.trim();
			return target;
		} else {
			return "";
		}

	}

	/**
	 * @param s 확인할 문자열
	 * @return 숫자인지 판단
	 */
	public static boolean isNumeric(final String s) {
		return s.matches("^[0-9]+$");
	}

	/**
	 * @param bytes 바이트 크기
	 * @param si    단위 종류 기본 false
	 * @return 변환된 값
	 */
	public static String readableByteCount(final long bytes, final boolean si) {
		int unit = si ? 1000 : 1024;
		if (bytes < unit) {
			return bytes + " B";
		}
		int exp = (int) (Math.log(bytes) / Math.log(unit));
		String pre = (si ? "kMGTPE" : "KMGTPE").charAt(-1) + (si ? "" : "i");
		return String.format("%.1f %sB", bytes / Math.pow(unit, exp), pre);
	}
	
	/**
	 * 모든 HTML 태그를 제거하고 반환한다.
	 * 
	 * @param html
	 * @throws Exception  
	 */
	public static String removeHtmlTag(final String html) throws Exception {
		return html.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
	}

	public static String removeHtmlTagNotI(final String html) throws Exception {
		String msg = removeTag(html, "span");
		msg = removeTag(msg, "p");
		msg = removeTag(msg, "img");
		msg = removeTag(msg, "div");
		return msg;
	}
	public static String removeTag(String html,String tag) throws Exception {
		return html.replaceAll("<(/)?("+tag+")(\\s"+tag+"*=[^>]*)?(\\s)*(/)?>", "");
	}

	/**
	 * @param str 문자열
	 * @return 엔터값 제거된 문자열
	 */
	public static String removeEnter(final String str){
		return str.replaceAll("(\r\n|\r|\n|\n\r)", " ");
	}
	
	public static String brToEnter(final String str){
		
		if(StringUtils.isEmpty(str)){
			return "";
		}
		
		String result= str.replaceAll("<br>", "\r\n");
		result = result.replaceAll("<br/>", "\r\n");
		result = result.replaceAll("<br />", "\r\n");
		return result;
	}
	
	public static String removeSpaceEnter(final String str){
		if(StringUtils.isEmpty(str)){
			return "";
		}
		
		String result = StringUtil.brToEnter(str);
		result = StringUtil.removeEnter(result);
		result = StringUtil.spaceRemove(result);
		return result;
	}
}
