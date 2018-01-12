<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<title>Ajax Test</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

function goAjax1(){
	var sendData = JSON.stringify({aa:$('#AA').val(), bb:$('#BB').val()});
 	$.ajax({
		type: "POST",
		url : "<c:url value='/goAjax1.do' />",
		dataType: "json",
		data : sendData,
		contentType:"application/json;charset=UTF-8",
		async: false,
		success : function(data, status, xhr) {
			console.log(data);
			alert("data1:"+data.AA);
			alert("data2:"+data.BB);
		},
		error: function(jqXHR, textStatus, errorThrown) {
			alert("error= " + errorThrown);
		}
	});
}

function goAjax2(){
	var sendData = JSON.stringify({aa:$('#AA').val(), bb:$('#BB').val()});
 	$.ajax({
		type: "POST",
		url : "<c:url value='/goAjax2.do' />",
		dataType: "json",
		data : sendData,
		contentType:"application/json;charset=UTF-8",
		async: false,
		success : function(data, status, xhr) {
			console.log(data);
			alert("data:"+data);	
		},
		error: function(jqXHR, textStatus, errorThrown) {
			alert("error= " + errorThrown);
		}
	});
}

function goAjax3(){
	var sendData = JSON.stringify({aa:$('#AA').val(), bb:$('#BB').val()});
 	$.ajax({
		type: "POST",
		url : "<c:url value='/goAjax3.do' />",
		dataType: "json",
		data : sendData,
		contentType:"application/json;charset=UTF-8",
		async: false,
		success : function(data, status, xhr) {
			console.log(data);
			alert("data:"+data);	
		},
		error: function(jqXHR, textStatus, errorThrown) {
			alert("error= " + errorThrown);
		}
	});
}

function goAjax4(){
	var sendData = JSON.stringify({aa:$('#AA').val(), bb:$('#BB').val()});
 	$.ajax({
		type: "POST",
		url : "<c:url value='/goAjax4.do' />",
		dataType: "json",
		data : sendData,
		contentType:"application/json;charset=UTF-8",
		async: false,
		success : function(data, status, xhr) {
			console.log(data);
			alert("data:"+data);	
		},
		error: function(jqXHR, textStatus, errorThrown) {
			alert("error= " + errorThrown);
		}
	});
}

//]]>
</script>
</head>

<body>
<h3>Spring Framework - Ajax</h3>
<div style="margin-bottom:10px;">
	<form id="fm" name="fm" method="post">
	<input type="hidden" name="AA" id="AA">
	<input type="hidden" name="BB" id="BB">
	</form>
	<button onclick="goAjax1();">goAjax1</button>
	<button onclick="goAjax2();">goAjax2</button>
	<button onclick="goAjax3();">goAjax3</button>
	<button onclick="goAjax4();">goAjax4</button>
</div>
</body>
</html>
