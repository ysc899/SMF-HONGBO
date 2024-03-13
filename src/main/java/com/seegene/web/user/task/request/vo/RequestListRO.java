package com.seegene.web.user.task.request.vo;

import java.util.List;

import lombok.Data;

@Data
public class RequestListRO {
	
	private List<RequestDataRO> thumList;
	private List<RequestDataRO> normalList;
	
}

