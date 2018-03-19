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
var rowid=0;
// jquery 버전충돌시 function($) 를 넣어준다
$(document).ready(function($){
	$(window).resize(function(){
		$("JqGrid").setGridWidth($(this).width() * .100);
	});
	setGrid($);
	//조회
	$("#search").on("click", function(){
		fn_selectList($);
	});
	//입력
	$("#insert").on("click", function(){
		fn_insert($);
	});
	$("#save").on("click", function(){
		fn_save($);
	});
});

function setGrid($){
	var lastSel;
	$("#JqGrid").jqGrid({
		colNames:[
		          "ID",
		          "이름",
		          "주소",
		          "우편번호",
		          "전화번호",		          
		          "이메일",
		          "권한",
		          "가입일",
		          "사용여부",
		          ],
		colModel:[
		          { name:'ID',		index:'ID',    	 	width:100, editable:true},
		          { name:'MNAME',	index:'MNAME',     	width:100, editable:true},
		          { name:'ADDRESS',	index:'ADDRESS',    width:200, editable:true},
		          { name:'ZIP',		index:'ZIP',     	width:100, editable:true},
		          { name:'TEL',		index:'TEL',     	width:100, editable:true},
		          { name:'EMAIL',	index:'EMAIL',	 	width:200, editable:true},
		          { name:'CLEVEL',	index:'CLEVEL',     width:100, editable:true},
		          { name:'CDATE',	index:'CDATE',      width:100},
		          { name:'USE_FLAG',index:'USE_FLAG',   width:100, editable:true},
		          ],
		rowNum : 10,
		autowidth : true,
		gridview : true,
		rowList : [10,20,30],
		rownumbers : true,
		height : "220",
		pager : "#listData",
		datatype: 'local',
		viewrecords : false,
		caption : "회원정보",
		width : 500,
		shrinkToFit : false,
		editurl : "/notice/insertNotice001",
		onSelectRow : function(id){
			if(id && id!==lastSel){
				$("#JqGrid").restoreRow(lastSel);
				lastSel=id;
			}
			console.log("lastSel:"+lastSel);
			$("#JqGrid").editRow(id,true);
		},
		afterSaveCell : function(rowid, name, val, iRow, iCol){
			console.log("rowid:"+rowid+"name:"+name+"val:"+val+"iRow:"+iRow+"iCol:"+iCol);
		},
	});
	
	$("#JqGrid").jqGrid('navGrid', "#listData", {edit:true, add:true, del:true});
	
	var ids = $("#JqGrid").jqGrid('getDataIDs');
	console.log("ids:"+ids);
	
	var id2 = $("#JqGrid").jqGrid('getGridParam', "selarrow");
	console.log("id2:"+id2);
	
	$("#gridAddBtn").remove();              //remove하지 않으면 +추가버튼이 계속생김
	$("#JqGrid").navButtonAdd("#listData", {
	             caption: "추가",
	             title: "행 삽입",
	             buttonicon: "ui-icon-plusthick",  //버튼 이미지( + )
	             onClickButton: fn_add,        //버튼 클릭시 실행될 function
	             position: "first",            //first, last - 버튼 클릭시 추가되는 행의 위치
	             id:"gridAddBtn"           //버튼 id
	});	
}

function fn_add(){

}

function fn_selectList($){
	
	$.ajax({
		url : "<c:url value='/user/user001ListAjax'/>",
		type : "POST",
		//data : JSON.stringify(allData), //서버에 전송할 데이터
		dataType : "json", 				//서버로부터 수신할 데이터타입
		loadtext : "로딩중...",
		contentType : "application/json; charset=UTF-8",
		async : false,
		success : function (data, status, xhr){
			console.log("data:" + data);
			$("#JqGrid").clearGridData();
			$("#JqGrid").jqGrid('setGridParam', {
				data : data.listData
			});
			$("#JqGrid").trigger('reloadGrid');
		}
	});
}

function fn_insert($){
	var rowData = $("#JqGrid").jqGrid("getRowData");
	console.log("rowData:"+rowData.length);
	rowid++;
	console.log("rowid:"+rowid);
	var line = rowData.length;
	//line+=1;
	console.log("line:"+line);
	rowid = "new_line"+line;
	$("#JqGrid").jqGrid("addRow", {
		rowID : rowid,
		position : "last", //first, last
		useDefValues : false,
		useFormatter : false,
		addRowParams : {extraparam:{}}
	});
}

function fn_save($){
	alert("저장");
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
							alt="" /> <spring:message code="list.sample" /></li>
					</ul>
				</div>
			</div>
			<!-- /List -->
			<div class="main_product roomy-40">
				지역 : <select name="areaCode" id="areaCode" onChange="selectSigungu(this.value);" style="width: 100px">
				<option>선택</option>
				</select> <select name="sigunguCode" id="sigunguCode" style="width: 100px">
					<option>선택</option>
				</select> 
				<input type="button" name="search" id="search" value="조회">
				<input type="button" name="insert" id="insert" value="입력">
				<input type="button" name="save" id="save" value="저장">  
				<div>
					<table id="JqGrid" border="1"></table>
				</div>
				<div id="listData"></div>
			</div>
		</form:form>
	</div>
</div>         