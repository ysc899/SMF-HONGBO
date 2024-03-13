package com.seegene.web.common;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.awt.image.PixelGrabber;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.encryption.InvalidPasswordException;
import org.apache.pdfbox.rendering.ImageType;
import org.apache.pdfbox.rendering.PDFRenderer;
import org.apache.pdfbox.tools.imageio.ImageIOUtil;
import org.jcodec.api.FrameGrab;
import org.jcodec.api.JCodecException;
import org.jcodec.common.model.Picture;
import org.jcodec.scale.AWTUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class FileComponent {

	@Value("${fileUpload.path}")
	private String DEFAULT_FILE_PATH;
	
	public String getDefaultFilePath() {
		return DEFAULT_FILE_PATH;
	}
	
	@Value("${fileUpload.temp.folder}")
	private String TEMP_FILE_FOLDER;
	
	public String getTempFileFolder(){
		return TEMP_FILE_FOLDER;
	}
	
	/** 스케줄러 작동 확인용 */
	@Value("${scheduler.hostname}")
	private String SCHEDULER_HOSTNAME;



	/**
	 * @param filePath
	 *            파일 경로
	 * @return 이미지 byte
	 * @throws IOException
	 *             io에러
	 */
	public byte[] getImage(final String filePath) throws IOException {

		InputStream is = new FileInputStream(getDefaultFilePath() + File.separator + filePath);
		return IOUtils.toByteArray(is);
	}

	/**
	 * @param filePath
	 *            파일 경로
	 * @return base64로 인코딩된 파일 내용
	 * @throws IOException
	 */
	public String getImageToBase64(final String filePath) throws IOException {

		File file = new File(getDefaultFilePath() + File.separator + filePath);

		String ext = StringUtil.specialRemove(FilenameUtils.getExtension(file.getName()));

		byte[] fileContent = FileUtils.readFileToByteArray(file);
		String encodedString = Base64.getEncoder().encodeToString(fileContent);

		return "data:image/" + ext + ";base64, " + encodedString;
	}
	
	public void streamImageFile(final String parentPath, final String targetFilePath, 
			final HttpServletRequest request, final HttpServletResponse response) {
		
		File file1 = new File(DEFAULT_FILE_PATH + File.separator + parentPath + File.separator + targetFilePath);
		if (!file1.exists()) {
			
			return;
		}
		try {
			setResponseContentType(response,DEFAULT_FILE_PATH + File.separator +  parentPath + File.separator + targetFilePath);
			IOUtils.copy(new FileInputStream(file1), response.getOutputStream());
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return;
	}
	
	public void streamImageString(final String base64, 
			final HttpServletRequest request, final HttpServletResponse response) {
		
		if(StringUtils.isEmpty(base64)){
			return;
		}
		
		String[] contents = base64.split(",");
		
		try {
			setResponseContentTypeByBase64(response, contents[0]);
			
			byte[] imageByte = Base64.getDecoder().decode(StringUtil.spaceRemove(contents[1]));
			
			
			IOUtils.copy(new ByteArrayInputStream(imageByte), response.getOutputStream());
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return;
	}

	/**
	 * @param response
	 *            contenttype 입력될 리스폰
	 * @param filePath
	 *            파일 경로
	 * @return 이미지 byte
	 * @throws IOException
	 *             io 에러
	 */
	public byte[] getImage(HttpServletResponse response, final String filePath) throws IOException {
		this.setResponseContentType(response, filePath);
		return this.getImage(filePath);
	}

	/**
	 * @param response
	 *            리스폰
	 * @param filePath
	 *            파일 경로
	 * @throws IOException
	 *             io 에러
	 */
	public void setResponseContentType(HttpServletResponse response, final String filePath) throws IOException {

		String mimeType = Files.probeContentType(new File(filePath).toPath());

		switch (mimeType) {
		case "image/png":
			response.setContentType(MediaType.IMAGE_PNG_VALUE);
			break;

		case "image/gif":
			response.setContentType(MediaType.IMAGE_GIF_VALUE);
			break;
		default:
			response.setContentType(MediaType.IMAGE_JPEG_VALUE);
			break;
		}
	}
	
	public void setResponseContentTypeByBase64(HttpServletResponse response, final String base64){
		
		String checkText = base64.toLowerCase();
		if(StringUtils.contains(checkText, "image/png")){
			response.setContentType(MediaType.IMAGE_PNG_VALUE);
		}else if(StringUtils.contains(checkText, "image/gif")){
			response.setContentType(MediaType.IMAGE_GIF_VALUE);
		}else{
			response.setContentType(MediaType.IMAGE_JPEG_VALUE);
		}
	}

	/**
	 * @param parentPath
	 *            부모 경로
	 * @param targetFilePath
	 *            다운로드 대상 파일 명
	 * @param downloadFileName
	 *            다운로드시 저장될 파일이름
	 * @param request
	 *            req
	 * @param response
	 *            res
	 */
	public void downloadFile(final String parentPath, final String targetFilePath, final String downloadFileName,
			final HttpServletRequest request, final HttpServletResponse response) {

		String downFileName = "";
		try {
			String browser = request.getHeader("User-Agent");
			// 파일 인코딩
			if (browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")) {
				downFileName = URLEncoder.encode(downloadFileName, "UTF-8").replaceAll("\\+", "%20");
			} else {
				downFileName = new String(downloadFileName.getBytes("UTF-8"), "ISO-8859-1");
			}
		} catch (UnsupportedEncodingException ex) {
			ex.printStackTrace();
		}
		File file1 = new File(DEFAULT_FILE_PATH + File.separator + parentPath + File.separator + targetFilePath);
		if (!file1.exists()) {
			return;
		}

		// 파일명 지정
		response.setContentType("application/octer-stream");
		response.setHeader("Content-Transfer-Encoding", "binary;");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + downFileName + "\"");
		try {
			OutputStream os = response.getOutputStream();
			FileInputStream fis = new FileInputStream(file1);

			int ncount = 0;
			byte[] bytes = new byte[4096];

			while ((ncount = fis.read(bytes)) != -1) {
				os.write(bytes, 0, ncount);
			}
			fis.close();
			os.close();
		} catch (FileNotFoundException ex) {
			ex.printStackTrace();
		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}
	
	public void viewPdfFile(final String parentPath, final String targetFilePath, final String downloadFileName,
			final HttpServletRequest request, final HttpServletResponse response){
		String downFileName = "";
		try {
			String browser = request.getHeader("User-Agent");
			// 파일 인코딩
			if (browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")) {
				downFileName = URLEncoder.encode(downloadFileName, "UTF-8").replaceAll("\\+", "%20");
			} else {
				downFileName = new String(downloadFileName.getBytes("UTF-8"), "ISO-8859-1");
			}
		} catch (UnsupportedEncodingException ex) {
			ex.printStackTrace();
		}
		File file1 = new File(DEFAULT_FILE_PATH + File.separator + parentPath + File.separator + targetFilePath);
		if (!file1.exists()) {
			return;
		}
		
		byte[] fileByte;
		try {
			fileByte = FileUtils.readFileToByteArray(file1);

		 
			response.setContentType("application/pdf");
			response.setContentLength(fileByte.length);
			 
			response.setHeader("Content-Disposition", "inline; fileName=\"" + URLEncoder.encode(downFileName, "UTF-8") + "\";");
			response.getOutputStream().write(fileByte);
			 
			response.getOutputStream().flush();
			response.getOutputStream().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * @param parentPath
	 *            상위 폴더 명
	 * @param file
	 *            저장할 파일
	 * @return 파일 이름
	 * @throws IOException
	 *             입출력 에러
	 */
	public String writeFile(final String parentPath, MultipartFile file) throws IOException {

		String checkExt = StringUtil.specialRemove(FilenameUtils.getExtension(file.getOriginalFilename())).toLowerCase();
		if(checkExt.contains("exe") || checkExt.contains("sh") || checkExt.contains("bat")){
			throw new RuntimeException("허용되지 않는 파일 타입 입니다. - "+ file.getOriginalFilename());
		}
		
		
		// 가끔 특수 문자가 들어가서 특수문자 제거
		String ext = "." + StringUtil.specialRemove(FilenameUtils.getExtension(file.getOriginalFilename()));
		// String ext = "." +
		// FilenameUtils.getExtension(file.getOriginalFilename());
		File fileDirectory = new File(getDefaultFilePath() + File.separator + parentPath);

		// log.info("폴더 경로 : " + fileDirectory.getPath());
		if (!fileDirectory.exists()) {
			// log.info("폴더가 없다;;");
			// 폴더가 없을시 폴더 생성
			fileDirectory.mkdirs();
		}

		//
		File convFile = File.createTempFile(parentPath, ext, fileDirectory);
		file.transferTo(convFile);

		// String filePath =
		// convFile.getAbsolutePath().replace(getDefaultFilePath(), "");

		return convFile.getName();
	}
	
	/**
	 * @param parentPath 부모 경로
	 * @param file 멀티파츠 파일(이미지)
	 * @param width 폭
	 * @param height 높이
	 * @return 저장된 섬네일 경로
	 * @throws IOException
	 * @throws InterruptedException
	 */
	public String writeImageThumFile(final String parentPath, final MultipartFile file, final int width, final int height)throws IOException, InterruptedException{
		
		String tempFilePath = this.writeFile(TEMP_FILE_FOLDER, file);
		File tempImageFile = new File(DEFAULT_FILE_PATH + File.separator+TEMP_FILE_FOLDER + File.separator + tempFilePath);
		
		return this.writeThumFile(parentPath, tempImageFile, width, height);
		
	}
	
	
	

	/**
	 * @param parentPath
	 *            상위 경로
	 * @param imageFileName
	 *            이미지 파일 명
	 * @param width
	 *            리사이즈될 폭
	 * @param height
	 *            리사이즈 될 높이
	 * @return 섬네일 파일 명
	 * @throws IOException
	 * @throws InterruptedException 
	 */
	public String writeThumFile(final String parentPath, final String imageFileName, final int width, final int height)
			throws IOException, InterruptedException {

		File imageFile = new File(DEFAULT_FILE_PATH + File.separator + parentPath + File.separator + imageFileName);

		return this.writeThumFile(parentPath, imageFile, width, height);
	}
	
	/**
	 * @param parentPath
	 *            상위 경로
	 * @param imageFile
	 *            이미지
	 * @param width
	 *            리사이즈될 폭
	 * @param height
	 *            리사이즈 될 높이
	 * @return 섬네일 파일 명
	 * @throws IOException
	 * @throws InterruptedException 
	 */
	public String writeThumFile(final String parentPath, final File imageFile, final int width, final int height)
			throws IOException, InterruptedException {
		
		Image srcImg = ImageIO.read(imageFile);

		Image imgTarget = srcImg.getScaledInstance(width, height, Image.SCALE_SMOOTH);
		int pixels[] = new int[width * height];
		PixelGrabber pg = new PixelGrabber(imgTarget, 0, 0, width, height, pixels, 0, width);
		
		pg.grabPixels();
		
		boolean argbFlag = FilenameUtils.getExtension(imageFile.getName()).toLowerCase().equals("png");
		
		BufferedImage outputImage = null;
		
		if(argbFlag){
			outputImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
		}else{
			outputImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		}
		outputImage.setRGB(0, 0, width, height, pixels, 0, width);
		
		
		String ext = StringUtil.specialRemove(FilenameUtils.getExtension(imageFile.getName()));
		String fileName = UUID.randomUUID() + "." + ext;
		
		File fileDirectory = new File(getDefaultFilePath() + File.separator + parentPath);

		if (!fileDirectory.exists()) {
			// 폴더가 없을시 폴더 생성
			fileDirectory.mkdirs();
		}
		
		ImageIO.write(outputImage, ext,
				new File(DEFAULT_FILE_PATH + File.separator + parentPath + File.separator + fileName));
		
		return fileName;
	}

	/**
	 * @param 삭제
	 *            할 file 파일 or 폴더
	 */
	public void deleteFile(File file) {
		if (file.isFile()) {
			// 파일인 경우 삭제
			file.delete();
		} else {
			File[] listFiles = file.listFiles();
			for (int idx = 0; idx < listFiles.length; idx++) {
				deleteFile(listFiles[idx]);
			}
			file.delete();
		}
	}
	
	/**
	 * @param parentPath 자식 파일들을 삭제할 상위 폴더
	 */
	public void deleteChildFile(final String parentPath){
		File file = new File(DEFAULT_FILE_PATH + File.separator + parentPath);
		
		if(file != null && file.isDirectory() && file.listFiles().length > 0){
			File[] listFiles = file.listFiles();
			for (int idx = 0; idx < listFiles.length; idx++) {
				deleteFile(listFiles[idx]);
			}
		}
	}

	/**
	 * @param parentPath 부모 경로
	 * @param file 멀티파츠 파일
	 * @return 이미지 파일명 리스트
	 * @throws IOException
	 */
	public List<String> pdfToImage(final String parentPath, final MultipartFile file) throws IOException {

		return pdfToImage(parentPath, file.getInputStream());
	}
	
	/**
	 * @param parentPath 부모경로
	 * @param file 파일
	 * @return 이미지 파일명 리스트
	 * @throws IOException
	 */
	public List<String> pdfToImage(final String parentPath, final File file) throws IOException {
		FileInputStream fis = new FileInputStream(file);
		
		return pdfToImage(parentPath, fis);
	}


	private List<String> pdfToImage(final String parentPath, final InputStream is)
			throws IOException, InvalidPasswordException {
		List<String> resultList = new ArrayList<String>();
		try(PDDocument pdfDoc = PDDocument.load(is)) {
			PDFRenderer pdfRenderer = new PDFRenderer(pdfDoc);

			String dir = getDefaultFilePath() + File.separator + parentPath;
			
			File fileDirectory = new File(dir);

			// log.info("폴더 경로 : " + fileDirectory.getPath());
			if (!fileDirectory.exists()) {
				// log.info("폴더가 없다;;");
				// 폴더가 없을시 폴더 생성
				fileDirectory.mkdirs();
			}
			
			final String prefix = String.valueOf(System.nanoTime());

			// 순회하며 이미지로 변환 처리
			for (int i = 0; i < pdfDoc.getPages().getCount(); i++) {
				
				String fileName = prefix+"_"+ i + ".jpg";
				
				String imgFileName = dir + File.separator + fileName;

				// DPI 설정
				BufferedImage bim = pdfRenderer.renderImageWithDPI(i, 150, ImageType.RGB);

				// 이미지로 만든다.
				ImageIOUtil.writeImage(bim, imgFileName, 150);

				// 저장 완료된 이미지를 list에 추가한다.
				resultList.add(fileName);
				
			}
		} 
		return resultList;
	}
	
	/**
	 * @param parentPath 상위 경로
	 * @param file pdf 파일
	 * @return base64 이미지로 변환된 
	 * @throws IOException
	 */
	public List<String> pdfToBase64Img(final String parentPath, final MultipartFile file) throws IOException {
		
		List<String> fileList = this.pdfToImage(parentPath, file);
		List<String> resultList = new ArrayList<>();
		
		for(String item : fileList){
			resultList.add(this.getImageToBase64(parentPath + File.separator + item));
		}
		
		return resultList;
	}
	
	/**
	 * @param videoPath 동영상 파일 경로
	 * @param parentPath 상위 파일 경로
	 * @return 저장된 섬네일 파일 명
	 * @throws IOException
	 * 
	 * http://andang72.blogspot.com/2019/12/extract-image-from-video.html 참고
	 * @throws JCodecException 
	 * @throws InterruptedException 
	 */
	public String getVideoThum(final String videoPath, final String parentPath, final int width, final int height)throws IOException, JCodecException, InterruptedException{
		
		File videoFile = new File(DEFAULT_FILE_PATH + File.separator + parentPath + File.separator + videoPath);

		int frameNumber = 0;
		Picture picture = FrameGrab.getFrameFromFile(videoFile, frameNumber);
		
		
		Image inputImage = AWTUtil.toBufferedImage(picture);

		Image imgTarget = inputImage.getScaledInstance(width, height, Image.SCALE_SMOOTH);
		int pixels[] = new int[width * height];
		PixelGrabber pg = new PixelGrabber(imgTarget, 0, 0, width, height, pixels, 0, width);
		
		pg.grabPixels();
		
		BufferedImage outputImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		outputImage.setRGB(0, 0, width, height, pixels, 0, width);
		

		String ext = "jpg";
		String fileName = UUID.randomUUID() + "." + ext;
//
		ImageIO.write(outputImage, ext,
				new File(DEFAULT_FILE_PATH + File.separator + parentPath + File.separator + fileName));

		return fileName;
		
	}
	
	/**
	 * @param filePath 비디오 파일 경로
	 * @param request  리퀘스트
	 * @param response 리스폰
	 */
	public void getVideo(final String filePath, final HttpServletRequest request, final HttpServletResponse response) {

		File targetFile = new File(DEFAULT_FILE_PATH + File.separator + filePath);

		try {
			MultipartFileSender.fromFile(targetFile).with(request).with(response).serveResource();
		} catch (IOException e) {
			if (!e.getClass().getName().equals("org.apache.catalina.connector.ClientAbortException")) {
				throw new RuntimeException(e);
			}
		}
	}

	/**
	 * 파일 다운로드 헤더 설정 브라우져의 종류에 따라 설정한다
	 *
	 * @param request
	 *            리퀘스트
	 * @param fileName
	 *            파일명
	 * @return 헤더 정보
	 * @throws UnsupportedEncodingException
	 *             문자열 변환 에러
	 */
	public String getFileDownHeader(final HttpServletRequest request, final String fileName)
			throws UnsupportedEncodingException {

		String header = request.getHeader("User-Agent");
		String filename = fileName;

		String result = "";
		if (header.contains("MSIE") || header.contains("Trident")) { // IE 11버전부터 Trident로 변경되었기때문에 추가해준다.
			filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
			result = "attachment;filename=" + filename + ";";
		} else if (header.contains("Chrome")) {
			filename = new String(filename.getBytes("UTF-8"), "ISO-8859-1");
			result = "attachment; filename=\"" + filename + "\"";
		} else if (header.contains("Opera")) {
			filename = new String(filename.getBytes("UTF-8"), "ISO-8859-1");
			result = "attachment; filename=\"" + filename + "\"";
		} else if (header.contains("Firefox")) {
			filename = new String(filename.getBytes("UTF-8"), "ISO-8859-1");
			result = "attachment; filename=\"" + filename + "\"";
		}

		return result;
	}
	
	/**
	 * @param targetUrl 대상 URL
	 * @return 파일 다운로드된 경로
	 * @throws MalformedURLException
	 * @throws IOException
	 */
	public String downloadUrlImageFile(final String targetUrl) throws MalformedURLException, IOException {
		URL url = new URL(targetUrl);
		BufferedImage targetFile = ImageIO.read(url);
		String ext = StringUtil.specialRemove(FilenameUtils.getExtension(targetUrl));
		if(StringUtils.isEmpty(ext)){
			ext = "jpg";
		}

		File fileDirectory = new File(getDefaultFilePath() + File.separator + TEMP_FILE_FOLDER);

		// log.info("폴더 경로 : " + fileDirectory.getPath());
		if (!fileDirectory.exists()) {
			// log.info("폴더가 없다;;");
			// 폴더가 없을시 폴더 생성
			fileDirectory.mkdirs();
		}

		String filePath = fileDirectory.getAbsolutePath() + File.separator + System.nanoTime() + "." + ext;

		ImageIO.write(targetFile, ext, new File(filePath));
		return filePath;
	}
	
	/**
	 * @param filePath 파일 경로
	 * @return base64로 인코딩된 파일 내용
	 * @throws IOException
	 */
	public String getImageFullPathToBase64(final String filePath) throws IOException {

		File file = new File(filePath);

		String ext = StringUtil.specialRemove(FilenameUtils.getExtension(file.getName()));

		byte[] fileContent = FileUtils.readFileToByteArray(file);
		String encodedString = Base64.getEncoder().encodeToString(fileContent);

		return "data:image/" + ext + ";base64, " + encodedString;
	}
	
	public String downloadUrlFile(final String targetUrl, final String filename, final String parentPath)
			throws IOException {

		String ext = "." + StringUtil.specialRemove(FilenameUtils.getExtension(filename));
		File fileDirectory = new File(getDefaultFilePath() + File.separator + parentPath);

		// log.info("폴더 경로 : " + fileDirectory.getPath());
		if (!fileDirectory.exists()) {
			// log.info("폴더가 없다;;");
			// 폴더가 없을시 폴더 생성
			fileDirectory.mkdirs();
		}

		//
		File convFile = File.createTempFile(parentPath, ext, fileDirectory);

		FileUtils.copyURLToFile(new URL(targetUrl), convFile);

		return convFile.getName();
	}
	
	public long getFileSize(final String parentPath, final String fileName){
		
		File f = new File(getDefaultFilePath() + File.separator + parentPath + File.separator + fileName);
		return f.length();
	}
	
	
	/**
	 * 불필요 파일 삭제 메소드
	 * 매일 2시 0분 1초에 실행
	 */
	@Scheduled(cron = "1 0 2 * * *")
	public void checkStatusRecruit(){
		if(!IpUtil.getServerHostName().equals(SCHEDULER_HOSTNAME)){
			return;
		}
		
		log.debug("---------------------------------------");
		log.debug("불필요 파일 삭제 시작");
		this.deleteChildFile(TEMP_FILE_FOLDER);
		log.debug("---------------------------------------");
	}

}
