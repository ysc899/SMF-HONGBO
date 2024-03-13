package com.seegene.web.user.foundation.map.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class MapService {
	
	@Value("${kakao.key}")
	private String apiKey;
	
	
	public String getApiKey(){
		return apiKey;
	}

}
