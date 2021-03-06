<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<style>
.content {
    min-height: 500px;
    padding-bottom: 70px;
    position: relative;
    padding-top: 150px;
    width:90%;
}

.port_item{
	min-height:220px;
	width:90%;
}
.port_img > img{
	height:150px;
	width:80px;
}

</style>
<script type="text/javascript">
$(document).ready(function(){
	$("input[name=btn1]").on("click", function(e){
		e.preventDefault();
		alert("11");
		searchPost();
	});
	
	$("input[name=btn2]").on("click", function(e){
		e.preventDefault();
		alert("22");
		searchGet();
	});
	
	function searchPost(){
		var sendData = JSON.stringify({aa:$('aa').val()});
		$.ajax({
			type:"POST",
			url:"/accomm/accomm001ListAjax.do",
			dataType: "json",
			data : sendData,
			contentType:"application/json;charset=UTF-8",
			async: true,
			success : function(data, status, xhr) {
				console.log(data);
				alert("조회성공");
			},
			error: function(jqXHR, textStatus, errorThrown) {
				alert(jqXHR.responseText);
			}
		});
	}
	
	function searchGet(){
		alert("22");
		$.ajax({
			type: "GET",
			url:"/accomm/accomm001ListAjax2.do",
			dataType: "json",			
			async: true,
	        success : function(data, status, xhr) {
	            console.log(data);         
	        },
	        error: function(jqXHR, textStatus, errorThrown) {
	            alert(jqXHR.responseText);
	        }
			
		});
	}
});
</script>    
<div class="content">
	<div class="container">
		<form:form id="listForm" name="listForm" method="post">
			<input type="hidden" id="aa" name="aa" value="bb">
			<input type="hidden" name="selectedId" />
			<div id="content_pop">
				<!-- 타이틀 -->
				<div id="title">
					<ul>
						<li><img
							src="<c:url value='/images/egovframework/example/title_dot.gif'/>"
							alt="" />
						<spring:message code="list.sample" /></li>
					</ul>
				</div>
			</div>
			<!-- /List -->
			<div>
				<input type="button" name="btn1" value="조회POST">
				<input type="button" name="btn2" value="조회GET">
			</div>
			<div class="main_product roomy-40">
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<div class="container">
							<div class="row">
								<c:forEach var="result" items="${resultList}">
									<div class="col-sm-3">
										<div class="port_item xs-m-top-30">
											<div class="port_img">
												<c:choose>
													<c:when test="${result.firstimage2 ne null}">
														<img src="${result.firstimage2}" alt="" class="img-responsive img-thumbnail img-hover" />
														<div class="port_overlay text-center">
															<a href="${result.firstimage2}" class="popup-img">+</a>
														</div>
													</c:when>
													<c:otherwise>
														<img src="/images/travel/noImage.gif" alt="" class="img-responsive img-thumbnail img-hover" />
														<div class="port_overlay text-center">
															<a href="/images/travel/noImage.gif" class="popup-img">+</a>
														</div>
													</c:otherwise>
												</c:choose>
											</div>  
											<div class="port_caption m-top-20">
												<h6>
													<c:out value="${result.title}" />&nbsp;
												</h6>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form:form>
	</div>
</div>         
