package com.seegene.web.admin.inspection.test.vo;

import lombok.Data;

/**
 * MWT001R1 리스트 결과
 */
@Data
public class MWT001R1ListRO {
	/** 보험코드 */
	private String f018ocd;
	/** COR */
	private String f010cor;
	/** 검사코드 */
	private String f010gcd;
	/** 검사 약어 */
	private String f010snm;
	/** 검사명 한글 */
	private String f010fkn;
	/** 검사명 영어 */
	private String f010fen;
	/** 검체코드 */
	private String f010tcd;
	/** 검체명 */
	private String f010tnm;
	/** 검체 용기 코드 */
	private String f010gbx;
	/** 검사법 */
	private String f010msc;
	/** 검사법 */
	private String f010msnm;
	/** 검사일 */
	private String t001day;
	/** 검사소요일수 */
	private String f010eed;
	/** 사용 여부 */
	private String t001flg;
	/** 리스트 사용 여부 */
	private String t001lflg;
	/** 상태 */
	private String f010sts;
}
