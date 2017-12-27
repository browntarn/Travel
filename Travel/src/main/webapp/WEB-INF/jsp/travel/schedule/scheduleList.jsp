<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<script type="text/javaScript" defer="defer">
    	function fn_scheduleList(){
    		var frm = document.scheduleForm;
    		frm.action = "<c:url value='/schedule/scheduleList.do'/>";;
    		frm.submit();
    	}
    	
    	function fn_scheduleDetail(contId,mapx,mapy){
    		var frm = document.scheduleForm;
    		frm.contId.value = contId;
    		frm.mapx.value = mapx;
    		frm.mapy.value = mapy;
    		frm.action = "<c:url value='/schedule/scheduleDetail.do'/>";;
    		frm.submit();
    	}	
</script>

<form id="scheduleForm" name="scheduleForm" method="post" class="p_l_r m-bottom-120" >
  	<input type="hidden" name="contId" />
  	<input type="hidden" name="mapx" />
  	<input type="hidden" name="mapy" />
  	<br><br><br>
  	<!--product section-->
    <section id="product" class="product">
        <div class="container">
            <div class="main_product roomy-80">
                <div class="head_title text-center fix">
                    <h2 class="text-uppercase">전국 축제 · 행사 정보</h2>
                    <h5>
                    	<c:forEach var="area" items="${areaList}" varStatus="status">
  							<c:if test="${commandMap.areaSelectList == area.code}">
   								${area.name}
  							</c:if>
   						</c:forEach>
   					</h5>
                </div>

			
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                        <div class="item active">
                            <div class="container">
                                <div style="margin-right: -15px; margin-left: 15px;">
                                	<c:forEach var="recentList" items="${recentList}" varStatus="status">
	                                    <div class="col-sm-3">
	                                        <div class="port_item xs-m-top-30">
	                                            <div class="port_img">
	                                                <img src="assets/images/work-img1.jpg" alt="" />
	                                                <div class="port_overlay text-center">
	                                                    <a href="assets/images/work-img1.jpg" class="popup-img">+</a>
	                                                </div>
	                                            </div>
	                                            <div class="port_caption m-top-20">
	                                                <h5><a href="javascript:fn_scheduleDetail('<c:out value="${recentList.contentid}"/>',${recentList.mapx},${recentList.mapy})" >${recentList.title}</a></h5>
	                                                <h6>${recentList.eventstartdate.substring(0,4)}-${recentList.eventstartdate.substring(4,6)}-${recentList.eventstartdate.substring(6,8)} ~
	                                                	${recentList.eventenddate.substring(0,4)}-${recentList.eventenddate.substring(4,6)}-${recentList.eventenddate.substring(6,8)} 
	                                                </h6>
	                                            </div>
	                                        </div>
	                                    </div>
                                	</c:forEach>
                                </div>
                            </div>
                        </div>
					</div>
                        

                    <!-- Controls -->
                    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                        <i class="fa fa-angle-left" aria-hidden="true"></i>
                        <span class="sr-only">Previous</span>
                    </a>

                    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                        <i class="fa fa-angle-right" aria-hidden="true"></i>
                        <span class="sr-only">Next</span>
                    </a>
                </div>

            </div><!-- End off row -->
        </div><!-- End off container -->
    </section><!-- End off Product section -->
            
            
  	<div id="content_pop">
   		<div id="title">
      		<ul>
      			<li><spring:message code="schedule.title" /></li>
      		</ul>
      	</div>
      	<div id="search" class="m-bottom-30">
      		<ul>
   				<li>
      				<select name="areaSelectList" class="-webkit-autofill" style="height:39.6px;">
      					<c:forEach var="area" items="${areaList}" varStatus="status">
      						<c:choose>
      							<c:when test="${commandMap.areaSelectList == area.code}">
       								<option value="${area.code}" label="${area.name} (${area.code})" selected="selected"/> 
      							</c:when>
      							<c:otherwise>
       								<option value="${area.code}" label="${area.name} (${area.code})" /> 
      							</c:otherwise>
      						</c:choose>
   						</c:forEach>
      				</select>
					<span>시작일 : </span> <input type="date" name="eventStartDate" value="${commandMap.eventStartDate}" />
					<span>종료일 : </span> <input type="date" name="eventEndDate" value="${commandMap.eventEndDate}" />      					
					<span>지역 : </span> 
      				<input type="button"  style="height:39.6px;" onclick="javascript:fn_scheduleList();" value="<spring:message code="button.search" />"/>
      	        </li>
              </ul>
      	</div>
   		<div id="table">
      		<table style="width:100%; border:0; cellpadding:0; cellspacing:0" >
      			<colgroup>
      				<col width="60"/>
      				<col width="270"/>
      				<col width="?"/>
      				<col width="100"/>
      				<col width="100"/>
      				<col width="200"/>
      				<col width="250"/>
      			</colgroup>
      			<tr>
      				<th align="center">지역코드</th>
      				<th align="center">명칭</th>
      				<th align="center">주소</th>
      				<th align="center">시작일</th>
      				<th align="center">종료일</th>
      				<th align="center">전화번호</th>
      				<th align="center">위치</th>
      			</tr>
      			<c:forEach var="result" items="${resultList}" varStatus="status">
          			<tr>
          				<td align="left" class="listtd"><c:out value="${result.areacode}"/></td>
          				<td align="left" class="listtd"><a href="javascript:fn_scheduleDetail('<c:out value="${result.contentid}"/>',${result.mapx},${result.mapy})" ><c:out value="${result.title}"/></a></td>
          				<td align="left" class="listtd"><c:out value="${result.addr1} ${result.addr2}"/></td>
          				<td align="left" class="listtd"><c:out value="${result.eventstartdate.substring(0,4)}-${result.eventstartdate.substring(4,6)}-${result.eventstartdate.substring(6,8)}"/></td>
          				<td align="left" class="listtd"><c:out value="${result.eventenddate.substring(0,4)}-${result.eventenddate.substring(4,6)}-${result.eventenddate.substring(6,8)}"/></td>
          				<td align="left" class="listtd"><c:out value="${result.tel}"/></td>
          				<td align="left" class="listtd"><c:out value="${result.mapx}, ${result.mapy}"/></td>
          			</tr>
      			</c:forEach>
      		</table>
      	</div>
    </div>
</form>
    
<%@ include file="/WEB-INF/include/include-footer.jspf" %>                  
            
			



           
