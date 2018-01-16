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
<script type="text/javascript">

$(document).ready(function(){
	$("#search").on("click", function(e){
		alert("11");
		e.preventDefault();
		//fn_selectList();
		    	$("#list").jqGrid({ datatype: "local", height: 250, colNames:['컬럼1','컬럼2'], colModel:[ {name:'col1',index:'col1'}, {name:'col2',index:'col2'}, ], caption: "그리드 배열 데이터 샘플링" });
    var mydata = [ {col1:"내용1",col2:"내용1"}, {col1:"내용233",col2:"내용233"}, ]; 
    //배열을 반복문으로 돌려서 그리드에 add 시킨다
    for(var i=0;i<=mydata.length;i++) 
    { $("#list").jqGrid('addRowData',i+1,mydata[i]); }
	})
});

function fn_selectList(){
	$.ajax({
		type : "POST",
		url : "<c:url value='/schedule/schedule001ListAjax.do'/>",
		dataType : "json",
		contentType : "application/json; charset=UTF-8",
		async: false,
		success : function (data, status, xhr){
			console.log(data);

/* 			//가상의 local json data
	        var gridData = [{seq:"1",create_date:"2007-10-01",create_name:"test",title:"note",hitnum:"11"},
	                      {seq:"2",create_date:"2007-10-02",create_name:"test2",title:"note2",hitnum:"22"}];
	         
	        var gridData = [{seq:"1",create_date:"2007-10-01",create_name:"test",title:"note",hitnum:"11"},
	                        {seq:"2",create_date:"2007-10-02",create_name:"test2",title:"note2",hitnum:"22"}];
	           
	          //jqGrid껍데기 생성
	          $("#list").jqGrid({
	              //로컬그리드이용
	              datatype: "local",
	              //그리드 높이
	              height: 250,
	              //컬럼명들
	              colNames:['시퀀스','제목', '등록일', '등록자명','조회수'],
	              //컬럼모델
	              colModel:[
	                  {name:'seq'},
	                  {name:'title'},
	                  {name:'create_date'},
	                  {name:'create_name'},
	                  {name:'hitnum'}    
	              ],
	              //그리드타이틀
	              caption: "그리드 목록"
	          });
	           
	          // 스크립트 변수에 담겨있는 json데이터의 길이만큼
	          for(var i=0;i<=gridData.length;i++){
	                  //jqgrid의 addRowData를 이용하여 각각의 row에 gridData변수의 데이터를 add한다
	                  $("#list").jqGrid('addRowData',i+1,gridData[i]);
	          } */
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
							
															<table id="list"></table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form:form>
	</div>
</div>         
