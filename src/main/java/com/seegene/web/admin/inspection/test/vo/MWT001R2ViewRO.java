package com.seegene.web.admin.inspection.test.vo;

import lombok.Data;

import java.util.HashMap;
import java.util.Map;

/**
 * MWT001R2 상세 결과
 */
@Data
public class MWT001R2ViewRO {
	/** cor */
	private String f010cor;
	/** 검사코드 */
	private String f010gcd;
	/** 검사명 한글 */
	private String f010fkn;
	/** 검사명 영어 */
	private String f010fen;
	/** 검사명 약어 */
	private String f010snm;
	/** 검체 코드 */
	private String f010tcd;
	/** 검체 코드 명 */
	private String f010tnm;
	/** 검체용기 코드 */
	private String f010gbx;
	/** 검체용기 코드 명 */
	private String f010gbnm;
	/** 검체 용기 이미지 경로 */
	private String vessimg;
	/** 검사법 코드 */
	private String f010msc;
	/** 검사법 명 */
	private String f010msnm;
	/** 검체량 */
	private String f010gtq;
	/** 웹 여부 */
	private String f010ach;
	/** 보존 방법 */
	private String t001sav;
	/** 검사일 */
	private String t001day;
	/** 검사소요일수 */
	private String f010eed;
	/** 임상정보 */
	private String t001cont;
	/** 주의사항 */
	private String t001etc;
	/** 참고치 */
	private String t001ref;
	/** 사용 여부 */
	private String t001flg;
	/** 리스트 사용 여부 */
	private String t001lflg;
	/** 상태 */
	private String f010sts;
	/** 질병검사코드 */
	private String f010isc;
	/** 검사학부코드 */
	private String f010hak;
	/** 보험기호 (서울) */
	private String somk;
	/** 보험기호 (부산)*/
	private String bomk;
	/** 보험코드 (서울) */
	private String socd;
	/** 보험코드 부산 */
	private String bocd;
	/** 기준 수가(서울) */
	private String sssu;
	/** 기준 수가 (부산)*/
	private String bssu;
	/** 보험수가 (서울) */
	private String sbsu;
	/** 보험수가 (부산) */
	private String bbsu;
	/** 기준수가(질가산미포함) */
	private String tssu;
	/** 보험코드(질가산미포함) */
	private String docd;
	/** 임시사영(질가산미포함) */
	private String docdTmp;
	
	/** 실온*/
	private String t001room;
	/** 냉장*/
	private String t001cold;
	/** 냉동*/
	private String t001frozen;
	
	/** 검체 소요량 2022.07.07 추가됨 */
	private String f010stq;
	/** 검사수가 노출여부 추가 2022.07.13 추가됨*/
	private String viewYn;

	/** qr코드 url 2022.07.07 추가됨 */
	private String t001url;

	/** qr코드 url 2022.07.07 추가됨 */
	private String t001urlqr;

	public void f010gbnmToEng() {
		// HashMap 생성
		Map<String, String> engMap = new HashMap<>();

		// 용기 코드별 영문이름
		engMap.put("Y01","SST tube (7mL)");
		engMap.put("Y02","SST tube (10mL)");
		engMap.put("Y04","plain tube (10mL)");
		engMap.put("Y05","NaF tube");
		engMap.put("Y06","Pyruvic acid (1:2)");
		engMap.put("Y07","Pyruvic acid (1:1)");
		engMap.put("Y08","Galacto (1:1)");
		engMap.put("Y09","Heparin tube");
		engMap.put("Y10","EDTA tube");
		engMap.put("Y11","Sod.citrate tube");
		engMap.put("Y12","24hr urine collection container");
		engMap.put("Y13","FDP tube");
		engMap.put("Y14","Chlamydia tube");
		engMap.put("Y15","Aprotinin tube");
		engMap.put("Y16","HPV PCR tube");
		engMap.put("Y17","GH(U) Dedicated container");
		engMap.put("Y18","Light blocking container");
		engMap.put("Y19","Stool bottle");
		engMap.put("Y20","Blood culture bottle");
		engMap.put("Y22","Transfort medium");
		engMap.put("Y23","Biopsy bottle");
		engMap.put("Y24","Biopsy bottle");
		engMap.put("Y25","Biopsy bottle");
		engMap.put("Y26","Sputum bottle");
		engMap.put("Y27","Blood spot paper");
		engMap.put("Y28","Unfixed Tissue");
		engMap.put("Y29","Slide");
		engMap.put("Y30","Oxytocin tube");
//		engMap.put("Y33","염색체 전용용기(BM)");
		engMap.put("Y34","Container for CVS samples");
		engMap.put("Y35","Vit C test tube");
		engMap.put("Y36","Ogawa Medium");
		engMap.put("Y37","ACD sol.(HLA container)");
		engMap.put("Y38","Conical tube (15mL)");
		engMap.put("Y39","Conical tube (50mL)");
		engMap.put("Y42","UBT tube");
		engMap.put("Y48","Culture media");
		engMap.put("Y49","EDTA.2Na Aprotin");
		engMap.put("Y50","Chlamydia Ag tube");
//		engMap.put("Y51","검체 용기 없음");
		engMap.put("Y52","Plural container");
		engMap.put("Y53","Exclusive container");
		engMap.put("Y54","ACD/ Sod. Heparin tube");
		engMap.put("Y55","Amniocentesis set");
		engMap.put("Y56","Capillary tube");
//		engMap.put("Y57","소변여지");
		engMap.put("Y58","Plain tube(5mL)");
		engMap.put("Y59","CTT tube");
		engMap.put("Y60","Media");
		engMap.put("Y61","10% Formalin");
//		engMap.put("Y62","전용용기(신생아용 SST)");
//		engMap.put("Y63","AFB 배지");
		engMap.put("Y64","Anasorb 708(SKC226-30-08)");
		engMap.put("Y65","E-tube");
		engMap.put("Y66","nunc cryo");
//		engMap.put("Y67","포집홀더");
		engMap.put("Y68","XAD-2 tube");
//		engMap.put("Y69","실리카겔 튜브");
		engMap.put("Y70","Trace Element Serum");
		engMap.put("Y71","Trace ElementK2EDTA");
//		engMap.put("Y72","중금속에 오염되지 않는 PP재질용기");
//		engMap.put("Y73","멸균된 객담통");
//		engMap.put("Y74","유리섬유여과지(30mm)");
//		engMap.put("Y75","흡착튜브");
//		engMap.put("Y76","흡착튜브(XAD-7)");
//		engMap.put("Y77","흡착튜브(활성탄100mg/50mg)");
		engMap.put("Y78","polyethylene bag");
//		engMap.put("Y79","막여과지");
		engMap.put("Y80","NH trace elements Na-Heparin tube");
		engMap.put("Y81","Plain tube (Plastic tube)");
		engMap.put("Y82","Container for liquid-based cervical cytology");
		engMap.put("Y83","Liquid-based body fluid cytopathology (urine)");
		engMap.put("Y84","Liquid-based body fluid cytopathology (sputum)");
		engMap.put("Y85","Liquid-based aspiration cytopathology");
		engMap.put("Y86","Liquid-based cervical cytology (Thinprep)");
		engMap.put("Y87","NK Vue tube");
		engMap.put("Y88","β-TG test tube");
		engMap.put("Y89","Containers for MTB-specific antigen-induced IFN-γ test");
		engMap.put("Y90","NIPT test tube");
		engMap.put("Y91","Container for respiratory virus test");
		engMap.put("Y92","H. pylori PCR test tube");
		engMap.put("Y93","NMP22 test tube");
		engMap.put("Y94","UTM (Universal transport medium)");
		engMap.put("Y95","Endotoxin test tube");
		engMap.put("Y96","Container for stool occult blood test");
		engMap.put("Y97","CLO kit");
		engMap.put("Y98","STI, HPV PCR tube");
		engMap.put("Y99","Tissue sample container");

		f010gbnm = engMap.get(this.f010gbx);
	}
}
