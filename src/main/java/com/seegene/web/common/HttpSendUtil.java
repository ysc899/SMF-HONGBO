package com.seegene.web.common;

import java.io.IOException;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;

/**
 * http 전송 관련 유틸 클래스
 *
 *
 */
public class HttpSendUtil {


	/**
	 * get 방식 전송 타입
	 *
	 * @param url 파라미터가 작성 완료된 url
	 * @return
	 * @throws IOException
	 * @throws ClientProtocolException
	 */
	public static String doGet(String url) throws ClientProtocolException, IOException {

		// 통신 관련 변수들 생성
		HttpClient client = HttpClientBuilder.create().build();

		HttpGet request = new HttpGet(url);
		request.addHeader("Accept", "application/json; charset=utf-8 ");
		request.addHeader("Content-Type", "application/json; charset=utf-8 ");

		final int TIMEOUT = 2000;
		// 타임아웃 설정
		RequestConfig reqConfig = RequestConfig.copy(RequestConfig.DEFAULT).setConnectionRequestTimeout(TIMEOUT)
				.setConnectTimeout(TIMEOUT).setSocketTimeout(TIMEOUT).build();

		request.setConfig(reqConfig);

		// 데이터 전송
		String result = "";
		HttpResponse response = client.execute(request);
		result = EntityUtils.toString(response.getEntity(), "UTF-8");

		return result;
	}


}
