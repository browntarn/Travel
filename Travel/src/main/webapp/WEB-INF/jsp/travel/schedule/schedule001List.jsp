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
	setAreaCode($);
	$("#search1").on("click", function(e){
		e.preventDefault();
		fn_selectList1($);
	});
	$("#search2").on("click", function(e){
		e.preventDefault();
		fn_selectList2($);
	});
	$("#search3").on("click", function(e){
		e.preventDefault();
		fn_selectList3($);
	});	
});

function setGrid($){
	$("#JqGrid").jqGrid({
	 	colNames:[
		         '지역',
		         '시군구',
		         '주제',
		         '주소',
		         '전화번호',
		         '위치'
		         ],
		colModel:[
		          { name:'areacode', 		index:'areacode', 		width:100 },
		          { name:'sigungucode', 	index:'sigungucode', 	width:100 },
		          { name:'title', 			index:'title',	 		width:200 },
		          { name:'addr1', 			index:'addr1', 			width:250 },
		          { name:'tel', 			index:'tel', 			width:150 },				          
		          { name:'map', 			index:'map', 			width:100 },
		          ],
  	   	rowNum : 10,
  	   	autowidth : true,
  	   	gridview :  true,
	   	rowList:[10,20,30],
	   	rownumbers : true,
	   	height : "220",		   	
	   	pager: '#listData',
	    viewrecords: false,
	   	caption: "여행정보 목록", 					   	
	});
} 

function fn_selectList1($){
	
    var userId = $("#userId").val();
    var userPass = $("#userPass").val();
    
    // name이 같은 체크박스의 값들을 배열에 담는다.
	var checkValues = [];
	var checkValues2 = [];
	$("input[name='hobboy']:checked").each(function(i){
		checkValues.push($(this).val());
	});
	
	$("input[name='sports']:checked").each(function(i){
		checkValues2.push($(this).val())
	});
	
	var allData = {"userId":userId, "userPass":userPass, "checkValues":checkValues, "checkValues2":checkValues2};
 
	$("#list").jqGrid({
		url : "<c:url value='/schedule/schedule001ListAjaxEx1.do'/>",
		mtype : "POST",
		data : allData,
		async : false,
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

    var userId = $("#userId").val();
    var userPass = $("#userPass").val();
    var areaCode = $("#areaCode").val();
    var sigunguCode = $("#sigunguCode").val();
    var page = $("#page").val();
    
    // name이 같은 체크박스의 값들을 배열에 담는다.
	var checkValues = new Array();
	var checkValues2 = new Array();
	$("input[name='hobboy']:checked").each(function(i){
		checkValues.push($(this).val());
	});
	
	$("input[name='sports']:checked").each(function(i){
		checkValues2.push($(this).val())
	});
	
	var allData = {
			"userId":userId, 
			"userPass":userPass,
			"areaCode":areaCode,
			"sigunguCode":sigunguCode,
			"page":page, 
			"checkValues":checkValues, 
			"checkValues2":checkValues2
	};
	//var allData = $("#listForm").serialize();
	
	$.ajax({
		url : "<c:url value='/schedule/schedule001ListAjax.do'/>",
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

function fn_selectList3($){
	
    var userId = $("#userId").val();
    var userPass = $("#userPass").val();
    
    // name이 같은 체크박스의 값들을 배열에 담는다.
	var checkValues = new Array();
	var checkValues2 = new Array();
	$("input[name='hobboy']:checked").each(function(i){
		checkValues.push($(this).val());
	});
	
	$("input[name='sports']:checked").each(function(i){
		checkValues2.push($(this).val())
	});
	
	//var allData = {"userId":userId, "userPass":userPass, "checkValues":checkValues, "checkValues2":checkValues2};
	var allData = $("#listForm").serialize();
	
	$.ajax({
		url : "<c:url value='/schedule/schedule001ListAjax3.do'/>",
		type : "POST",
		data : JSON.stringify(allData),
		dataType : "json",
		loadtext : '로딩중..',
		contentType : "application/json; charset=UTF-8",
		async : false,
		success : function (data, status, xhr){
			console.log("data:"+JSON.stringify(data));
			console.log("data1:"+data.response.body.items.item);
			var listData = data.response.body.items.item;
			console.log("listData:"+listData);
			
			$("#JqGrid").jqGrid({
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
 			$("#JqGrid").clearGridData();
   			for(var i=0;i<=listData.length;i++){
		         //jqgrid의 addRowData를 이용하여 각각의 row에 gridData변수의 데이터를 add한다
		         $("#JqGrid").jqGrid('addRowData',i+1,listData[i]);
		 	}    
			$("#JqGrid").trigger('reloadGrid');
			
			var json_data = JSON.stringify(data);
			var parse_data = JSON.parse(json_data);
		}
	});
}

function setAreaCode($){
	
	var $target = $("select[name='areaCode']");
	$.ajax({
		type : "POST",
		url : "<c:url value='/common/selectAreaCode.do'/>",
		contentType:"application/json;charset=UTF-8",
		dataType : "json",
		async: false,
		success : function(data){
			var listData = data.response.body.items.item;
			if(listData.length > 0){
				$.each(listData, function(i, val){
					$target.append("<option value='"+listData[i].code+"'>"+listData[i].name+"</option>");
				});
			}
		}, 
		error: function(xhr, textStatus, errorThrown) {
			console.log(xhr.responseText);
			alert("error= " + errorThrown);
		}
	});
}

function selectSigungu(val){
	
	var $target = $("select[name='sigunguCode']");
	var allData = {
			"areaCode" : $("#areaCode").val()
	}
	$target.empty();
	$target.append("<option value=''>전체</option>");
	
	$.ajax({
		type : "POST",
		url : "<c:url value='/common/selectSigunguCode.do'/>",
		data : JSON.stringify(allData),
		contentType : "application/json; charset=UTF-8",
		dataType : "json",
		async : false,
		success : function(data){
			var listData = data.response.body.items.item;
			if(listData.length > 0){
				$.each(listData, function(i, val){
					$target.append("<option value='"+listData[i].code+"'>"+listData[i].name+"</option>");
				});
			}
		},
		error: function(xhr, textStatus, errorThrown) {
			console.log(xhr.responseText);
			alert("error= " + errorThrown);
		}
	});
}

</script>
</head>
<div class="content">
	<div class="container">
		<form:form id="listForm" name="listForm" method="post">
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
			<div class="main_product roomy-40">
				<div class="item active">
					<div class="container">
						<div class="row">
							지역 : 
							<select name="areaCode" id="areaCode" onChange="selectSigungu(this.value);" style="width:100px">
								<option>선택</option>
							</select>
							<select name="sigunguCode" id="sigunguCode" style="width:100px">
								<option>선택</option>
							</select>							
							<input type="hidden" name="userId" id="userId" value="test">
							<input type="hidden" name="userPass" id="userPass" value="a12345">
<!-- 								<input type="checkbox" name="list[0].hobboy" id="list[0].hobboy" value="영어">
								<input type="checkbox" name="list[0].hobboy" id="list[0].hobboy" value="수학">
								<input type="checkbox" name="list[0].hobboy" id="list[0].hobboy" value="과학"> -->
							<input type="checkbox" name="hobboy" id="hobboy" value="영어">
							<input type="checkbox" name="hobboy" id="hobboy" value="수학">
							<input type="checkbox" name="hobboy" id="hobboy" value="과학">		
							<input type="text" name="page" id="page">					
						
<!--                             	<div class="home_btns m-top-40" id="search1">
                                	<a href="#" class="btn btn-primary btn-xs m-top-20">검색</a>
                            	</div> -->
                           	<input type="button" name="search1" id="search1" value="전송">     
                           	<input type="button" name="search2" id="search2" value="조회">                           
                           	<input type="button" name="search3" id="search3" value="전송">      	
							<div>
<!-- 									<input type="checkbox" name="list[1].sports" id="list[1].sports" value="축구">
									<input type="checkbox" name="list[1].sports" id="list[1].sports" value="농구">
									<input type="checkbox" name="list[1].sports" id="list[1].sports" value="야구"> -->
								<input type="checkbox" name="sports" id="sports" value="축구">
								<input type="checkbox" name="sports" id="sports" value="농구">
								<input type="checkbox" name="sports" id="sports" value="야구">									
							</div>
							<div>
								<table id="JqGrid" border="1"></table>
							</div>                      
							<div id="listData"></div>      										
						</div>						
					</div>
				</div>
			</div>	
		</form:form>
	</div>
</div>         
