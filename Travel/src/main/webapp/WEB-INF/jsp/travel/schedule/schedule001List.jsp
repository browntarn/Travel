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
<link rel="stylesheet" type="text/css" media="screen" href="/js/jqueryui/jquery-ui.css"/>
<link rel="stylesheet" type="text/css" media="screen" href="/jquery.jqGrid-4.4.3/css/ui.jqgrid.css" />    

<script src="${pageContext.request.contextPath}/jquery.jqGrid-4.4.3/js/jquery-1.7.2.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jqueryui/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/jquery.jqGrid-4.4.3/js/i18n/grid.locale-kr.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/jquery.jqGrid-4.4.3/js/jquery.jqGrid.min.js" type="text/javascript"></script>

<script type="text/javascript">

// jquery 버전충돌시 function($) 를 넣어준다
$(document).ready(function($){
	//setGrid($);
	$("#search1").on("click", function(e){
		e.preventDefault();
		fn_selectList1($);
	});
	$("#search2").on("click", function(e){
		e.preventDefault();
		fn_selectList2($);
	});
	//setGrid2($);
	//setGrid3($);
	//fn_selectList($);
});

/* function setGrid($){
	$("#list").jqGrid({
	 	colNames:[
		         '순번',
		         '지역',
		         '시군구',
		         '주제',
		         '주소',
		         '전화번호',
		         '위치'
		         ],
		colModel:[
		          { name : 'seq', 			index:'seq', 			width :100},
		          { name: 'areacode', 		index:'areacode', 		width: 100},
		          { name: 'sigungucode', 	index:'sigungucode', 	width: 100},
		          { name: 'title', 			index:'title',	 		width: 150},
		          { name: 'addr1', 			index:'addr1', 			width: 150},
		          { name: 'tel', 			index:'tel', 			width: 150},				          
		          { name: 'map', 			index:'map', 			width: 100},
		          ],
  	   	rowNum : 10,
  	   	autowidth : true,
  	   	gridview :  true,
	   	rowList:[10,20,30],
	    viewrecords: true,
	   	caption: "setGrid",
	});
} */

function fn_selectList1($){
 
	$("#list").jqGrid({
		url : "<c:url value='/schedule/schedule001ListAjax2.do'/>",
		mtype : "POST",
		datatype : "json",
	 	colNames:[
		         '순번',
		         '지역',
		         '시군구',
		         '주제',
		         '주소',
		         '전화번호',
		         '위치'
		         ],
		colModel:[
		          { name : 'seq', 			index:'seq', 			width :100},
		          { name: 'areacode1', 		index:'areacode', 		width: 100},
		          { name: 'sigungucode1', 	index:'sigungucode', 	width: 100},
		          { name: 'title', 			index:'title',	 		width: 150},
		          { name: 'addr1', 			index:'addr1', 			width: 150},
		          { name: 'tel', 			index:'tel', 			width: 150},				          
		          { name: 'map', 			index:'map', 			width: 100},
		          ],
  	   	rowNum : 10,	   	
  	   	autowidth : true,
  	   	gridview :  true,
	   	rowList:[10,20,30],
	   	pager: '#pager2',
	    viewrecords: true,
	   	caption: "Manipulating Array Data",
			jsonReader: {
			root : "response.body.items.item",
			repeatitems : false
	    }, 		    
	});	
} 
 
function fn_selectList2($){
	$.ajax({
		type : "POST",
		url : "<c:url value='/schedule/schedule001ListAjax2.do'/>",
		dataType : "json",
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
			
			$("#list").jqGrid({
				datatype : "json",
			 	colNames:[
				         '순번',
				         '지역',
				         '시군구',
				         '주제',
				         '주소',
				         '전화번호',
				         '위치'
				         ],
				colModel:[
				          { name : 'seq', 			index:'seq', 			width :100},
				          { name: 'areacode', 		index:'areacode', 		width: 100},
				          { name: 'sigungucode', 	index:'sigungucode', 	width: 100},
				          { name: 'title', 			index:'title',	 		width: 150},
				          { name: 'addr1', 			index:'addr1', 			width: 150},
				          { name: 'tel', 			index:'tel', 			width: 150},				          
				          { name: 'map', 			index:'map', 			width: 100},
				          ],
		  	   	rowNum : 10,
		  	   	autowidth : true,
		  	   	gridview :  true,
			   	rowList:[10,20,30],
/* 		  	   	loadBeforeSend: function(jqXHR) {
					jqXHR.setRequestHeader('X-ZUMO-APPLICATION', 'myKey');
		          	},
				loadComplete: function () {
		          		//alert("OK");
		    		},
				loadError: function (jqXHR, textStatus, errorThrown) {
		                                      alert('HTTP status code: ' + jqXHR.status + '\n' +
		                                      'textStatus: ' + textStatus + '\n' +
		                                      'errorThrown: ' + errorThrown);
		                                       alert('HTTP message body (jqXHR.responseText): ' + '\n' + jqXHR.responseText);
		                               },
				ajaxGridOptions: { contentType: "application/json", cache: true },	  */ 			   	
			   	pager: '#pager2',
			    viewrecords: true,
			   	caption: "Manipulating Array Data",
			});
			$("#list").clearGridData();
   			for(var i=0;i<=listData.length;i++){
		         //jqgrid의 addRowData를 이용하여 각각의 row에 gridData변수의 데이터를 add한다
		         $("#list").jqGrid('addRowData',i+1,listData[i]);
		 	}   
		 	
 			//$("#list").jqGrid('setGridParam', { data : listData });
			$("#list").trigger('reloadGrid'); 
		}
	});
}

function fn_selectList3($){
	$.ajax({
		type : "POST",
		url : "<c:url value='/schedule/schedule001ListAjax2.do'/>",
		dataType : "json",
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
			
  			for(var i=0;i<=listData.length;i++){
		         //jqgrid의 addRowData를 이용하여 각각의 row에 gridData변수의 데이터를 add한다
		         $("#list").jqGrid('addRowData',i+1,listData[i]);
		 	} 
/* 			$("#list").jqGrid('setGridParam', { data : listData });
			$("#list").trigger('reloadGrid'); */
		}
	});
}
/* 
/* function setGrid($){
	$("#jqGrid").jqGrid({
		datatype : "json",
	 	colName:[
		         '순번',
		         '지역',
		         '시군구',
		         '주제',
		         '주소',
		         '위치'
		         ],
		colModel:[
		          { name : 'seq', index:'seq', width :30},
		          { name: 'area', index:'area', width: 30},
		          { name: 'sigungu', index:'sigungu', width: 30},
		          { name: 'title', index:'title', width: 150},
		          { name: 'addr', index:'addr', width: 150},
		          { name: 'map', index:'map', width: 50},
		          ],
		viewrecords : true,
		width : 780,
		height : 200,
		rowNum : 10,
		autowidth : true,
		multiselect : true,
		rowList : [10,20,30],
		caption : "리스트목록"
	})
}

function fn_selectList($){
	alert("11");
	$.ajax({
		type : "POST",
		url : "<c:url value='/schedule/schedule001ListAjax.do'/>",
		dataType : "json",
		jsonReader:{
			repeatitems:false,
			root : "items",
			total : "totalCount"
		},
		loadtext : '로딩중..',
		contentType : "application/json; charset=UTF-8",
		async : false,
		success : function (data, status, xhr){
			console.log(data);

			
		}
	})
} */

</script>
</head>
<div class="content">
	<div class="container">
		<form:form id="listForm" name="listForm" method="post">
			<input type="hidden" id="userId=" value="test">
			<input type="checkbox" name="hoobby" value="독서">
			<input type="checkbox" name="hobboy" value="운동">
			<input type="checkbox" name="hobboy" value="전시관람">
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
                            	<div class="home_btns m-top-40" id="search1">
                                	<a href="#" class="btn btn-primary btn-xs m-top-20">검색</a>
                            	</div>
                            	<div class="home_btns m-top-40" id="search2">
                                	<a href="#" class="btn btn-primary btn-xs m-top-20">검색22</a>
                            	</div>                            	
							</div>
							<div>
								<table id="list" border="1"></table>
							
								<div id="pager2"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form:form>
	</div>
</div>         
