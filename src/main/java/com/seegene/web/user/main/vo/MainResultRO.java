package com.seegene.web.user.main.vo;

import java.util.List;

import com.seegene.web.admin.main.banner.main.vo.MainUserBannerListRO;
import com.seegene.web.admin.main.banner.sub.vo.MainUserBannerSubListRO;
import com.seegene.web.admin.main.popup.vo.MainPopupUserRO;
import com.seegene.web.user.board.integrated.vo.BoardListRO;
import com.seegene.web.user.customer.healthinfo.vo.HealthInfoUserListRO;
import com.seegene.web.user.customer.notice.vo.NoticeListRO;
import com.seegene.web.user.customer.webzine.vo.WebzineListRO;

import lombok.Data;

/**
 * 메인 화면에 데이터 전달할 vo
 */
@Data
public class MainResultRO {

	private List<RollingRO> rolling;
	
	private List<BoardListRO> board1;
	
	private List<NoticeListRO> board2;
	
	private List<WebzineListRO> board3;
	
	private List<WebzineListRO> webzine;
	
	private List<HealthInfoUserListRO> healthInfos;
	
	private List<MainUserBannerListRO> mainBanners;
	
	private List<MainUserBannerSubListRO> subBanners;
	
	private List<MainPopupUserRO> popups;
	
	private int board1_newYn;
	private int board2_newYn;
	private int board3_newYn;
	private int webzine_newYn;
	
	private int oneClick_newYn;
	private String newYn;
	
				
	
	
}
