package com.seegene.web.admin.board.init.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.annotation.PostConstruct;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.yaml.snakeyaml.util.UriEncoder;

import com.seegene.web.admin.board.db2.vo.Db2BoardMappingVO;
import com.seegene.web.admin.board.init.vo.BoardDb2SearchDtlPO;
import com.seegene.web.admin.board.init.vo.BoardDb2SearchDtlRO;
import com.seegene.web.admin.board.init.vo.BoardDb2SearchFileRO;
import com.seegene.web.admin.board.init.vo.BoardDb2SearchPO;
import com.seegene.web.admin.board.init.vo.BoardDb2SearchRO;
import com.seegene.web.admin.board.init.vo.BoardDefaultFileMigVO;
import com.seegene.web.admin.board.init.vo.BoardDefaultSlaveMigVO;
import com.seegene.web.admin.board.init.vo.BoardNoticeFileMigVO;
import com.seegene.web.admin.board.init.vo.BoardNoticeMigVO;
import com.seegene.web.common.FileComponent;
import com.seegene.web.common.StringUtil;
import com.seegene.web.repository.db2.DB2BoardMapper;
import com.seegene.web.repository.mariadb.BoardDb2MappingMapper;
import com.seegene.web.repository.mariadb.BoardIntegratedMapper;
import com.seegene.web.repository.mariadb.BoardNoticeMapper;

@Service
public class BoardInitService {

	@Autowired
	private BoardDb2MappingMapper db2MappingMapper;
	
	@Autowired
	private DB2BoardMapper db2boardMapper;
	
	@Autowired
	private BoardNoticeMapper boardNoticeMapper;
	
	@Autowired
	private BoardIntegratedMapper boardIntegratedMapper;
	
	@Autowired
	private FileComponent fileComponent;
	
//	@PostConstruct
	public void initDb2BoardData(){
		
		int cnt = db2MappingMapper.countDb2Mapping();
		
		if(cnt > 0){
			return;
		}
		
		//공문 마이그레이션 시작
		BoardDb2SearchPO param = new BoardDb2SearchPO();
		param.setIDcl("OFF_DOCU");
		param.setIFwdt(20000815);
		param.setITwdt(20201231);
		
		List<Long> noticeErrorList = new ArrayList<Long>();
		List<Long> newsErrorList = new ArrayList<Long>();
		
		List<BoardDb2SearchRO> result = db2boardMapper.findBoardList(param);
		result = result.stream().sorted().collect(Collectors.toList());
		for(BoardDb2SearchRO t : result){
			BoardDb2SearchDtlPO dtlParam = new BoardDb2SearchDtlPO();
			dtlParam.setS014seq(t.getS014seq());
			BoardDb2SearchDtlRO dtl = db2boardMapper.findBoardDtl(dtlParam);
			System.out.println("공문  : " + t.getS014seq());
			BoardNoticeMigVO item = new BoardNoticeMigVO();
			item.setCodeCenterType("seoul");
			item.setCodeLangType("ko");
			item.setNoticeNumber(dtl.getS014dno());
			item.setTitle(dtl.getS014tit());
			
			String content = dtl.getS014con();
			Document doc = Jsoup.parse(content);
			Elements imgs = doc.getElementsByTag("img");
			if (imgs.size() > 0) {
				for (Element img : imgs) {

					String url = img.attr("src");
					System.out.println("문서 번호 : "+ t.getS014seq());
					if (!url.startsWith("http")) {
						url = "https://trms.seegenemedical.com/" + url;
					} else if (url.startsWith("https://www.neodin.com/boardImg/")) {
						url = url.replace("https://www.neodin.com", "https://trms.seegenemedical.com/");
					}

					url = UriEncoder.encode(url);
					try {

						String downloadFileName = fileComponent.downloadUrlImageFile(url);
						String r = fileComponent.getImageFullPathToBase64(downloadFileName);

						img.attr("src", r);
					} catch (Exception e) {
//						e.printStackTrace();
						System.out.println(e.getMessage());
						System.out.println(t.getS014seq() + " : " +t.getS014tit());
						System.out.println("공문 에러 url : " + url);
					}
				}
			}

			item.setContent(doc.getElementsByTag("body").html());
			item.setContent(StringUtil.removeEnter(item.getContent()));
			
			item.setHitCnt(0);
			item.setNoticeFlag("N");
			String date = dtl.getS014wdt()+"";
			
			item.setRegDate(date);
			item.setRegUserId("system");
			
			boardNoticeMapper.addMigNotice(item);
			
			String baseUrl = "https://trms.seegenemedical.com";
			String filePath = "notice";
			
			List<BoardDb2SearchFileRO> files = db2boardMapper.findBoardFileDtl(dtlParam);
			for(BoardDb2SearchFileRO f : files){
				try {
					
					String url = baseUrl+UriEncoder.encode(f.getS014fpt());
					
					String saveFileName = fileComponent.downloadUrlFile(url, f.getS014fnm(), filePath);
					
					BoardNoticeFileMigVO fileItem = new BoardNoticeFileMigVO();
					fileItem.setBoardNoticeSeq(item.getSeq());
					fileItem.setFilePath(saveFileName);
					fileItem.setFileName(f.getS014fnm());
					fileItem.setFileSize(fileComponent.getFileSize(filePath, saveFileName));
					fileItem.setDownCnt(0);
					fileItem.setRegDate(date);
					fileItem.setRegUserId("system");
					boardNoticeMapper.addMigNoticeFile(fileItem);
					
				} catch (Exception e) {
					System.out.println("첨부파일 에러");
					System.out.println(t.getS014seq() + " : " +t.getS014tit());
					
					noticeErrorList.add(t.getS014seq());
				}
			}
			
			Db2BoardMappingVO mapping = new Db2BoardMappingVO();
			mapping.setBoardSeq(item.getSeq());
			mapping.setBoardType("OFF_DOCU");
			mapping.setS014seq(t.getS014seq());
			
			db2MappingMapper.addDb2Mapping(mapping);
			
		}
		
		
		
		//새소식 마이그레이션 시작
		param.setIDcl("NOTICE");
		result = db2boardMapper.findBoardList(param);
		result = result.stream().sorted().collect(Collectors.toList());
		for(BoardDb2SearchRO t : result){
			BoardDb2SearchDtlPO dtlParam = new BoardDb2SearchDtlPO();
			dtlParam.setS014seq(t.getS014seq());
			BoardDb2SearchDtlRO dtl = db2boardMapper.findBoardDtl(dtlParam);
			
			BoardDefaultSlaveMigVO item = new BoardDefaultSlaveMigVO();
			item.setBoardDefaultMasterSeq(1);
			item.setTitle(dtl.getS014tit());
			
			String content = dtl.getS014con();
			Document doc = Jsoup.parse(content);
			Elements imgs = doc.getElementsByTag("img");
			
			System.out.println("새소식 : " + t.getS014seq());
			
			String thumFilename = "";
			String thumOriName = "";
			
			if (imgs.size() > 0) {
				int idx = 0;
				for (Element img : imgs) {
					idx++;
					String url = img.attr("src");
					if (!url.startsWith("http")) {
						url = "https://trms.seegenemedical.com/" + url;
					} else if (url.startsWith("https://www.neodin.com/boardImg/")) {
						url = url.replace("https://www.neodin.com", "https://trms.seegenemedical.com/");
					}

					url = UriEncoder.encode(url);
					
					if(t.getS014seq() == 104640){
						url = "http://121.161.182.213:50080/cgchoi/board/Gwangju_Honam_open.jpg";
					}

					try {

						String downloadFileName = fileComponent.downloadUrlImageFile(url);
						if(idx == 1){
							thumFilename = downloadFileName;
							thumOriName = FilenameUtils.getName(url);
						}
						String r = fileComponent.getImageFullPathToBase64(downloadFileName);

						img.attr("src", r);
					} catch (Exception e) {
						System.out.println(e.getMessage());
						System.out.println(t.getS014seq() + " : " +t.getS014tit());
						System.out.println("새소식 에러 url : " + url);
						e.printStackTrace();
						
						if(t.getS014seq() == 104640){
						
						System.exit(0);
						}
					}
				}
			}

			item.setContent(doc.getElementsByTag("body").html());
			item.setContent(StringUtil.removeEnter(item.getContent()));
			
			item.setHitCnt(0);
			item.setNoticeFlag("N");
			String date = dtl.getS014wdt()+"";
			
			item.setRegDate(date);
			item.setRegUserId("system");
			
			boardIntegratedMapper.addMigBoardIntegrated(item);
			
			if(StringUtils.isNotEmpty(thumFilename)){
				try{
				String thumFilePath = fileComponent.writeThumFile("boardIntegrated", new File(thumFilename), 265,
						195);
				
				BoardDefaultFileMigVO fileItem = new BoardDefaultFileMigVO();
				fileItem.setBoardDefaultSlaveSeq(item.getSeq());
				fileItem.setThumFlag("Y");
				fileItem.setFilePath(thumFilePath);
				if(thumOriName.length() > 200){
					thumOriName = thumFilePath;
				}
				fileItem.setFileName(thumOriName);
				fileItem.setFileSize(fileComponent.getFileSize("boardIntegrated", thumFilePath));
				fileItem.setDownCnt(0);
				fileItem.setRegDate(date);
				fileItem.setRegUserId("system");
				boardIntegratedMapper.addMigBoardFileIntegrated(fileItem);
				
				}catch(Exception e){
					e.printStackTrace();
				}
				
			}
			
			String baseUrl = "https://trms.seegenemedical.com";
			String filePath = "boardIntegrated";
			
			
			List<BoardDb2SearchFileRO> files = db2boardMapper.findBoardFileDtl(dtlParam);
			for(BoardDb2SearchFileRO f : files){
				if(f.getS014fpt().endsWith("jsp")){
					continue;
				}
				try {
					
					String url = baseUrl+UriEncoder.encode(f.getS014fpt());
					
					String saveFileName = fileComponent.downloadUrlFile(url, f.getS014fnm(), filePath);
					
					BoardDefaultFileMigVO fileItem = new BoardDefaultFileMigVO();
					fileItem.setBoardDefaultSlaveSeq(item.getSeq());
					fileItem.setThumFlag("N");
					fileItem.setFilePath(saveFileName);
					fileItem.setFileName(f.getS014fnm());
					fileItem.setFileSize(fileComponent.getFileSize(filePath, saveFileName));
					fileItem.setDownCnt(0);
					fileItem.setRegDate(date);
					fileItem.setRegUserId("system");
					boardIntegratedMapper.addMigBoardFileIntegrated(fileItem);
					
				} catch (Exception e) {
					System.out.println(t.getS014seq());
					newsErrorList.add(t.getS014seq());
				}
			}
			
			Db2BoardMappingVO mapping = new Db2BoardMappingVO();
			mapping.setBoardSeq(item.getSeq());
			mapping.setBoardType("NOTICE");
			mapping.setS014seq(t.getS014seq());
			db2MappingMapper.addDb2Mapping(mapping);
		
		}
		
		
		System.out.println("------------------------------------");
		System.out.println("공문 에러 목록 : ");
		System.out.println(noticeErrorList.toString());
		System.out.println("새소식 에러 목록 : ");
		System.out.println(newsErrorList.toString());
		
		System.out.println("------------------------------------");
		
		
	}
	
}
