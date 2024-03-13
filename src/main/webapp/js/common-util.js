// 프로그램 전역적으로 사용하는 공통 함수
var CommonUtil = {};

//줄바꿈을 br 테그로 변경
CommonUtil.toBr = function(text){
	if(text === undefined || text == null){
		return null;
	}
	return text.replace(/(?:\r\n|\r|\n)/g, '<br/>');
}

//br을 줄바꿈 테그로 변경
CommonUtil.toEnter = function(text){
	if(text === undefined || text == null){
		return null;
	}
	return text.replace(/<br\s*[\/]?>/gi, "\n");
}

//null 또는 빈 공백이면 true 반환
CommonUtil.isEmpty = function(val){
  return (val === undefined || val == null || val.length <= 0) ? true : false;
}

//trim적용후 빈 스트링 체크
CommonUtil.isEmptyString = function (val) {
	if (CommonUtil.isEmpty(val)) {
		return true;
	}
	return val.trim() == "";
}

//escape 문자 변환
CommonUtil.unescapeHtml = function(val){
    return val
		    .replace(/&amp;/g, '&')
		    .replace(/&lt;/g, '<')
		    .replace(/&gt;/g, '>')
		    .replace(/&quot;/g, '"')
		    .replace(/&#034;/g, '"')
		    .replace(/&#039;/g, "'");
}

//IP PORT 입력 형식 체크
//111.22.11.5:1212  <== 이런 입력 값이 올바른지 체크
CommonUtil.checkIpPort = function(ipPort){
	var found = /^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\:\d{1,5}$/g.test(ipPort);
	return found;
}

//url 입력 형식 체크
//http://adams.ai/property/111  <== 이런 입력 값이 올바른지 체크
CommonUtil.checkUrl = function(url){
	var found = /^(((http(s?))\:\/\/)?)([0-9a-zA-Z\-]+\.)+[a-zA-Z]{2,6}(\:[0-9]+)?(\/\S*)?/.test(url);
	return found;
}

//해당 문자열이 URL 형식인지 판단
//http://adams.ai/property/111?asfsadf=safa  <== 파라미터 값이 있는 URL도 체크 함. true 반환
//http://127.0.0.1/property/111?asfsadf=safa <== IP된 건 체크하지 않음. false 반환
CommonUtil.validateUrl = function(value) {
return /^(?:(?:(?:https?|ftp):)?\/\/)(?:\S+(?::\S*)?@)?(?:(?!(?:10|127)(?:\.\d{1,3}){3})(?!(?:169\.254|192\.168)(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\u00a1-\uffff0-9]-*)*[a-z\u00a1-\uffff0-9]+)(?:\.(?:[a-z\u00a1-\uffff0-9]-*)*[a-z\u00a1-\uffff0-9]+)*(?:\.(?:[a-z\u00a1-\uffff]{2,})))(?::\d{2,5})?(?:[/?#]\S*)?$/i.test(value);
}

//이미지 확장자인지 확인
CommonUtil.fileCheckImage = function(value) {
	if(value.toUpperCase() == 'JPG' || value.toUpperCase() == 'JPEG'
		|| value.toUpperCase() == 'PNG' || value.toUpperCase() == 'GIF'){
		return true;
	}else{
		return false;
	}
	
}

//msword 확장자인지 확인
CommonUtil.fileCheckDoc = function(value) {
	if(value.toUpperCase() == 'DOC' || value.toUpperCase() == 'DOCX'){
		return true;
	}else{
		return false;
	}
}

//msword 확장자인지 확인
CommonUtil.fileCheckPdf = function(value) {
	if(value.toUpperCase() == 'PDF'){
		return true;
	}else{
		return false;
	}
}

//sheet.js blob 읽을때 사용 하는 메소드
CommonUtil.readFixData = function(data) {
	var o = "", l = 0, w = 10240;
	for(; l<data.byteLength/w; ++l) o+=String.fromCharCode.apply(null,new Uint8Array(data.slice(l*w,l*w+w)));
	o+=String.fromCharCode.apply(null, new Uint8Array(data.slice(l*w)));
	return o;
}
