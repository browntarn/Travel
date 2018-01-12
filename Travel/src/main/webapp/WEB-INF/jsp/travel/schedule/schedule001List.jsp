<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<style>
.btn{
	font-size:12px;
	padding:14px;
}
</style>
<script src="/jquery.jqGrid-4.4.3/js/jquery-1.7.2.min.js"></script>
<script src="/jquery.jqGrid-4.4.3/js/i18n/grid.locale-kr.js"></script>
<script src="/jquery.jqGrid-4.4.3/js/jquery.jqGrid.min.js"></script>
<script src="/jquery.jqGrid-4.4.3/js/jquery.jqGrid.src.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	$("#search").on("click", function(e){
		alert("11");
		e.preventDefault();
		fn_selectList();
	})
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
</head>
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
			<div class="main_product roomy-80">
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<div class="container">
							<div class="row">
                            	<div class="home_btns m-top-40" id="search">
                                	<a href="#" class="btn btn-primary btn-xs m-top-20">검색</a>
                            	</div>
							1234123412341234123412341234123412341234123412341234123412341234123412341234123412341234123412341234123412341234123412341234123412341234123412341234123412341234
							1234123412341234123412341234123412341234123412341234123412341234123412341234123412341234123412341234123412341234123412341234123412341234123412341234123412341234
							1234123412341234123412341234123412341234123412341234123412341234123412341234123412341234123412341234123412341234123412341234123412341234123412341234123412341234
							</div>
						</div>
					</div>
				</div>
			</div>
		</form:form>
	</div>
</div>         
