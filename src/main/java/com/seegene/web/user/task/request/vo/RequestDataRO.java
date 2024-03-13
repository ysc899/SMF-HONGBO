package com.seegene.web.user.task.request.vo;

import lombok.Data;

@Data
public class RequestDataRO implements Comparable<RequestDataRO>{

	/** 식별자 */
	private int seq;
	/** 타이틀 */
	private String title;
	/** 섬네일 여부 */
	private String thumFlag;

	/** 출력 순서 */
	private int printOrder;
	/** 섬네일 저장 경로 */
	private String thumFilePath;
	private String thumFileContent;
	@Override
	public int compareTo(RequestDataRO o) {
		return Integer.compare(this.printOrder, o.getPrintOrder());
	}
}
