<%@ page contentType="UTF-8; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script src="/js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="/js/grid.locale-kr.js" type="text/javascript"></script>
<script src="/js/jquery.jqGrid.min.js" type="text/javascript"></script>
<script type="text/javascript">

$(document).ready(function(){ 
	
});

function fn_selectList(){
	$.ajax({
		type : "post",
		url : "<c:url value='/schedule/schedule001ListAjax.do'/>",
		dataType : "json",
		contentType : "application/json; charset=UTF-8",
		async : "true",
		success : function (data, status, xhr){
			console.log(data);
		},
		error: function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	})
}

</script>
111111111111
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
			<div class="main_product roomy-80">
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