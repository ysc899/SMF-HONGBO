<!doctype html><%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"    uri="http://www.springframework.org/security/tags"%>


<!--footer-->
<footer>
	  <!--footer-->
  <div>

    <div class="address">
      <address>
        서울특별시 성동구 천호대로 320 (용답동 2-3) / 대표전화번호 1566-6500 / 대표팩스번호 02-3394-6503
      </address>
      <p>Copyright © Seegene Medical Foundation. All right reserved.</p>
    </div>

    <select name="패밀리사이트" id="family_site">
      <option value="">패밀리사이트</option>
      <option value="1">(주)씨젠</option>
      <!-- <option value="2">씨젠우먼</option> -->
      <option value="3">SG메디컬</option>
      <option value="4">씨차트</option>
    </select>

    <ul onclick="location.href='<c:url value='/policy/index.do'/>'">
      <li><a href="<c:url value='/policy/index.do'/>">개인정보 취급방침</a></li>
    </ul>

  </div>
  <!--//footer End-->
</footer>
<!--//footer End-->

<script type="text/javascript">


	$(document).ready(function(){
		
		$("#family_site").change(function(){
			var fVal = $(this).val();
			if(fVal == 1){
				window.open("http://www.seegene.co.kr/", '_blank');
			}else if(fVal == 2){
				window.open("http://www.seegenewoman.com/kr/index.php", '_blank');
			}else if(fVal == 3){
				window.open("http://www.sgmedical.kr/neo/kr/main/main.php", '_blank');
			}else if(fVal == 4){
				window.open("https://seechart.seegenemedical.com", '_blank');
			}
		});
		
		
	});

</script>
