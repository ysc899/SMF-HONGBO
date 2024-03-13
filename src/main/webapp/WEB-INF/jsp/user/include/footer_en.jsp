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
        <font size="2">320, Cheonho-daero, Seongdong-gu, Seoul, 04805, Republic of Korea / FAX +82-2-3394-6503 / E-mail seegenecs@mf.seegene.com </font>
      </address>
      <p>Copyright © Seegene Medical Foundation. All right reserved.</p>
    </div>

    <select name="패밀리사이트" id="family_site">
      <option value="">Family Site</option>
      <option value="1">Seegene</option>
      <!-- <option value="2">Seegenewoman</option> -->
      <option value="3">SGmedical</option>
      <option value="4">SeeChart</option>
    </select>

    <ul>
      <li><a href="<c:url value='/policy/index.do'/>">Privacy policy</a></li>
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