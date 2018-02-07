<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<style>
.content {
    min-height: 300px;
    padding-bottom: 70px;
    position: relative;
    padding-top: 150px;
    width:100%;
}

.container{
	border:1px;
	/* width:90%; */
}

.port_item{
	min-height:220px;
	width:90%;
}
.port_img > img{
	height:150px;
	width:80px;
}


.btn{
	font-size:12px;
	padding:14px;
}
</style>
<link rel="stylesheet" type="text/css" media="screen" href="/js/jqueryui/jquery-ui.css"/>
<link rel="stylesheet" type="text/css" media="screen" href="/jquery.jqGrid-4.4.3/css/ui.jqgrid.css" />    

<script src="${pageContext.request.contextPath}/jquery.jqGrid-4.4.3/js/jquery-1.7.2.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jqueryui/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/jquery.jqGrid-4.4.3/js/i18n/grid.locale-kr.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/jquery.jqGrid-4.4.3/js/jquery.jqGrid.min.js" type="text/javascript"></script>

<script type="text/javascript">

// jquery 버전충돌시 function($) 를 넣어준다
$(document).ready(function($){
	setGrid($);
	$("#search").on("click", function(e){
		e.preventDefault();
		fn_selectList($);
	});
});

function setGrid($){
	$("#JqGrid").jqGrid({
	 	colNames:[
		         '순번',
		         '제목',
		         '작성자',
		         '작성시간',
		         '조회수',
		         ],
		colModel:[
		          { name:'seq', 			index:'seq', 			width:30 },
		          { name:'title', 			index:'title', 			width:200 },
		          { name:'name', 			index:'name',	 		width:50 },
		          { name:'insertTime', 		index:'insertTime', 	width:50 },
		          { name:'readCount', 		index:'readCount', 		width:30 },				          
		          ],
  	   	rowNum : 10,
  	   	autowidth : true,
  	   	gridview :  true,
  	   	rownumbers : false,
	   	rowList:[10,20,30],
	   	height : "220",
	   	pager: '#listData',
	    viewrecords: false,
	   	caption: "게시판 목록", 					   	
	});
} 

function fn_selectList($){

	var allData = {

	};
	//var allData = $("#listForm").serialize();
	
	$.ajax({
		url : "<c:url value='/notice/notice001ListAjax'/>",
		type : "POST",
		data : JSON.stringify(allData),	//서버에 전송할 데이터
		dataType : "json",				//서버로부터 수신할 데이터 타입
		loadtext : '로딩중..',			
		contentType : "application/json; charset=UTF-8",
		async : false,
		success : function (data, status, xhr){
			console.log("data:"+data);
			console.log("data1:"+data.response.body.items.item);
			var listData = data.response.body.items.item;
			console.log("listData:"+listData);
			console.log("listData[0]:"+listData[0]);
			console.log("data2:"+listData.length);
			console.log("data3:"+listData[0].eventenddate);
			console.log("data4:"+listData[0].contentid);
			
 			$("#JqGrid").clearGridData();
   			for(var i=0;i<=listData.length;i++){
		         //jqgrid의 addRowData를 이용하여 각각의 row에 gridData변수의 데이터를 add한다
		         $("#JqGrid").jqGrid('addRowData',i+1,listData[i]);
		 	}    
			$("#JqGrid").trigger('reloadGrid');
		}
	});
}

</script>
</head>
<div class="content">
	<div class="container">
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
		<div class="main_product roomy-40">
			지역 : 
			<select name="areaCode" id="areaCode" onChange="selectSigungu(this.value);" style="width:100px">
				<option>선택</option>
			</select>
			<select name="sigunguCode" id="sigunguCode" style="width:100px">
				<option>선택</option>
			</select>							
			<input type="hidden" name="userId" id="userId" value="test">
			<input type="hidden" name="userPass" id="userPass" value="a12345">
			<input type="text" name="page" id="page">					
           	<input type="button" name="search" id="search" value="조회">
			<table id="JqGrid" border="1"></table>
			<div id="listData"></div>
		</div>							 	
	</div>
</div>         
