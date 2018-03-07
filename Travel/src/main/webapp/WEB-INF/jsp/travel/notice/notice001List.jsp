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
<link rel="stylesheet" type="text/css" media="screen" href="/jquery-ui-1.12.1.custom/jquery-ui.css"/>
<link rel="stylesheet" type="text/css" media="screen" href="/jquery-ui-1.12.1.custom/jquery-ui.theme.css">
<link rel="stylesheet" type="text/css" media="screen" href="/jquery.jqGrid-4.4.3/css/ui.jqgrid.css" />
<link rel="stylesheet" type="text/css" media="screen" href="/jquery.jqGrid-4.4.3/plugins/ui.multiselect.css" />        

<script src="${pageContext.request.contextPath}/jquery.jqGrid-4.4.3/js/jquery-1.7.2.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
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
	$("#save").on("click", function(e){
		e.preventDefault();
		fn_save($);
	})
});

function setGrid($){
	$("#JqGrid").jqGrid({
	 	colNames:[
	 	         '체크박스',
		         '순번',
		         '순번1',
		         '제목',
		         '작성시간',
		         '작성자',
		         '조회수',
		         ],
		colModel:[
		          {name:'checkBox', index:'checkBox', width:10, edittype:'checkbox',formatter: "checkbox",editoptions: { value:"True:False"},editable:true,formatoptions: {disabled : false}},
		          { name:'SEQ',				index:'SEQ', 			width:30,	editable:false, key:true},
		          { name:'GRP_SEQ',			index:'GRP_SEQ', 		width:0,	editable:false, key:true, hidden:true },
		          { name:'TITLE', 			index:'TITLE', 			width:200,	editable:true	},
		          { name:'INSERT_TIME', 	index:'INSERT_TIME', 	width:50,	editable:false, formatter:'ddate', formatoptions:{srcformat:"y-m-d H:i", newformat:"y-m-d H:i"}},
		          { name:'INSERT_ID', 		index:'INSERT_ID', 		width:50,	editable:false 	},
		          { name:'READ_COUNT', 		index:'READ_COUNT', 	width:30,	editable:false	},				          
		          ],
  	   	rowNum : 10,
  	   	autowidth : true,
  	   	gridview :  true,
  	   	rownumbers : false,
	   	rowList:[10,20,30],
	   	height : "220",
	   	pager: '#listData',
	   	datatype: 'local',
	    viewrecords: true,
	   	caption: "게시판 목록",
	   	multiselect : true,
	   	loadonce : true,
	   	loadtext:"로딩중..",
	   	cellEdit : true,
	   	//cellsubmit:'remote',   //remote 셀수정시 ajax 실행, clientArray 바로 ajax 실행X 
	   	//cellurl:"<c:url value='/notice/updateNotice001'/>",
	   	//editurl : "clientArray", // 값 수정후 엔터치면 지정된 url로 날라감
	   	cellSubmit : 'clientArray',
	   	gridComplete : function(){
	   		
	   	},
	   	loadError : function(xhr, status, error){
	   		alert("error:"+error);
	   	},
	   	beforeSubmitCell : function(rowid, cellName, cellValue){
	   		console.log("beforeSumitCell rowid:"+rowid+", cellName:"+cellName+", cellValue:"+cellValue);
	   		//return { "id":rowid, "cellName":cellName, "cellValue":cellValue }
	   	},
	   	afterSubmitCell : function(res){
	   		console.log("afterSubmitCell res:"+res);
	   		var aRes = $.parseJSON(res.responseText);
	   		console.log("aRes:"+aRes);
	   	},
	   	afterSaveCell : function(rowid, name, val, iRow, iCol){
	   		alert(rowid+val+name);
	   	},
	 	beforeProcessing : function(data){
	 		alert("data:"+data);
	 		boardBean = data.bean;
	 	},
	 	onCellSelect : function(row, col, val, e){
	 		var cm = $("#JqGrid").jqGrid("getGridParam", "colModel");
	 		console.log("bb:"+cm[col].name);
	 	}
	 	
		//editurl: "URL.action",                // 셀이 수정될 때 수정 요청을 받아서 처리할 URL
		//cellEdit: true,                       // 셀 수정 기능을 사용하려면 true!
		//cellurl:'/managerjqGridCRUD.action',  // 셀 수정 후 submit url
		});
	}

	function checkBox(cellvalue, options, rowObject) {
		var name = rowObject['name'];
		var str = "<input type=\"checkbox\"name=\"chk\"value="+name+">";

		return str;
	}

	function fn_selectList($) {
		var allData = {};
		//var allData = $("#listForm").serialize();
		var listData;

		$.ajax({
			url : "<c:url value='/notice/notice001ListAjax'/>",
			type : "POST",
			data : JSON.stringify(allData), //서버에 전송할 데이터
			dataType : "json", //서버로부터 수신할 데이터 타입
			contentType : "application/json; charset=UTF-8",
			async : false,
			success : function(data, status, xhr) {
				console.log("data:" + data);
				$("#JqGrid").clearGridData();
				$("#JqGrid").jqGrid('setGridParam', {
					data : data.listData
				});
				// refresh the grid
				$("#JqGrid").trigger('reloadGrid');
			}
		});
	}
	function fn_save($) {
		var ret = $("#JqGrid").getChangedCells("all");
		console.log("ret:" + ret);

		var data = $("#JqGrid").jqGrid("getGridParam", "selrow");
		console.log("data:" + data);
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
           	<input type="button" name="save" id="save" value="저장">
			<table id="JqGrid" border="1"></table>
				<div id="listData"></div>
			<table id="list" border="1"></table>
			<div id="pager2"></div>			
		</div>							 	
	</div>
</div>         
