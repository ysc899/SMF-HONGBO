package com.seegene.web.user.main.vo;

import java.util.Map;

import com.seegene.web.admin.inspection.test.vo.MWT001R1ListRO;
import com.seegene.web.admin.menu.user.vo.MenuVO;
import com.seegene.web.common.CommonListReuslt;
import com.seegene.web.user.board.integrated.vo.BoardListRO;
import com.seegene.web.user.board.recruit.vo.RecruitListRO;
import com.seegene.web.user.customer.healthinfo.vo.HealthInfoUserListRO;
import com.seegene.web.user.customer.notice.vo.NoticeListRO;
import com.seegene.web.user.customer.webzine.vo.WebzineListRO;
import com.seegene.web.user.faq.vo.FaqUserListRO;
import com.seegene.web.user.promotion.vo.PromotionUserListRO;
import com.seegene.web.user.task.request.vo.RequestDataRO;
import com.seegene.web.user.task.vessel.vo.VesselUserListRO;

import lombok.Data;

/**
 * 메인 화면에 데이터 전달할 vo
 */
@Data
public class MainSearchResultRO {
	
	private String searchKeyword;
	
	private int totalCount;
	
	private MenuVO noticeMenu;
	
	private CommonListReuslt<NoticeListRO> noticeList;
	
	private Map<MenuVO, CommonListReuslt<BoardListRO>> boards;
	
//	private Map<MenuVO, CommonListReuslt<FaqUserListRO>> faqs;
	private MenuVO faqMenu;
	private CommonListReuslt<FaqUserListRO> faqList;
	
	private MenuVO healthInfoMenu;
	
	private CommonListReuslt<HealthInfoUserListRO> healthInfoList;
	
	private MenuVO recruitMenu;
	
	private CommonListReuslt<RecruitListRO> recruitList;
	
	private MenuVO webzineMenu;
	
	private CommonListReuslt<WebzineListRO> webzineInfoList;
	
	private MenuVO promotionBookMenu;
	
	private CommonListReuslt<WebzineListRO> promotionBookList;

	private MenuVO promotionVideoMenu;
	
	private CommonListReuslt<PromotionUserListRO> promotionVideoList;
	
	private MenuVO promotionImageMenu;
	
	private CommonListReuslt<PromotionUserListRO> promotionImageList;
	
	private MenuVO requestMenu;
	
	private CommonListReuslt<RequestDataRO> requestList;
	
	private MenuVO vesselMenu;
	
	private CommonListReuslt<VesselUserListRO> vesselList;

	private MenuVO testMenu;
	
	private CommonListReuslt<MWT001R1ListRO> testList;
	
	
	
	

}
