<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header.jspf" %>

<script type="text/javaScript"  defer="defer">
    function fn_scheduleList(){
		var frm = document.scheduleListForm;
		frm.action = "<c:url value='/schedule/scheduleList.do'/>";
		frm.submit();
	}   
</script>
<br><br><br><Br><br><Br><br>
<div class="head_title text-center fix">
    <h2 class="text-uppercase">${detailResult.eventplace}</h2>
    <c:set var="date" value="${detailResult.eventstartdate}" /> 
    <h5>행사기간 : ${fn:substring(date,0,4)}.${fn:substring(date,4,6)}.${fn:substring(date,6,8)} </h5>
</div>
<form id="scheduleListForm" name="scheduleListForm" method="post">
   	<input type="hidden" name="areaSelectList" value="${commandMap.areaSelectList}"/>
</form>
    <form id="scheduleForm" name="scheduleForm" method="post">
    	<div id="content_pop">
	    	<div id="title">
	       		<ul>
	       			<li><img src="<c:url value='/images/egovframework/example/title_dot.gif'/>" alt=""/>&nbsp;<spring:message code="schedule.detail" /></li>
	       		</ul>
	       	</div>
			<div id="table">
		    	<table width="100%" border="1" cellpadding="0" cellspacing="0" style="bordercolor:#D3E2EC; bordercolordark:#FFFFFF; BORDER-TOP:#C2D0DB 2px solid; BORDER-LEFT:#ffffff 1px solid; BORDER-RIGHT:#ffffff 1px solid; BORDER-BOTTOM:#C2D0DB 1px solid; border-collapse: collapse;">
		    		<colgroup>
		    			<col width="150"/>
		    			<col width="?"/>
		    		</colgroup>
	        		<tr>
	        			<td class="tbtd_caption">test1</td>
	        			<td class="tbtd_content">
	        				<input name="agelimit" class="txt" value="${detailResult.agelimit}" />
	        			</td>
	        		</tr>
		    		<tr>
		    			<td class="tbtd_caption">test2</td>
		    			<td class="tbtd_content">
		    				<input name="eventplace" class="txt" value="${detailResult.eventplace}" />
		    			</td>
		    		</tr>
		    		<tr>
	        			<td class="tbtd_caption">test3</td>
	        			<td class="tbtd_content">
	        				<input name="eventstartdate" class="txt" value="${detailResult.eventstartdate}" />
	        			</td>
	        		</tr>
		    		<tr>
		    			<td class="tbtd_caption"><label for="useYn"><spring:message code="title.sample.useYn" /></label></td>
		    			<td class="tbtd_content">
		    				<select name="useYn" class="use">
		    					<option value="Y" label="Yes" />
		    					<option value="N" label="No" />
		    				</select>
		    			</td>
		    		</tr>
		    		<tr>
	        			<td class="tbtd_caption">x좌표</td>
	        			<td class="tbtd_content">
	        				<input name="mapx" class="txt" value="${commandMap.mapx}" />
	        				<c:set var="name" value="${commandMap.mapx}" />                                       
							${fn:substring(name,0,3)}
	        			</td>
	        		</tr>
	        		<tr>
	        			<td class="tbtd_caption">y좌표</td>
	        			<td class="tbtd_content">
	        				<input name="mapy" class="txt" value="${commandMap.mapy}" />
	        				<c:set var="name" value="${commandMap.mapy}" />                                       
							${fn:substring(name,0,2)}
	        			</td>
	        		</tr>
		    	</table>
			</div>
			<div id="sysbtn">
    		<ul>
    			<li>
                    <span class="btn_blue_l">
                        <a href="javascript:fn_scheduleList();"><spring:message code="button.list" /></a>
                        <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                    </span>
                </li>
            </ul>
    	</div>
       	</div>
       	
       	<div id="map" style="width:500px;height:400px;"></div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ca01729a9d3032a9c18230bc5caeb7e1"></script>
		<script>
		var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
		var mapx = ${commandMap.mapx};
		var mapy = ${commandMap.mapy};
		
	    mapOption = { 
	        center: new daum.maps.LatLng(mapy, mapx), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };

		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
		// 마커가 표시될 위치입니다 
		var markerPosition  = new daum.maps.LatLng(mapy, mapx); 
	
		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
		    position: markerPosition
		});
	
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		</script>
       	
    </form>

<%@ include file="/WEB-INF/include/include-footer.jspf" %>  
