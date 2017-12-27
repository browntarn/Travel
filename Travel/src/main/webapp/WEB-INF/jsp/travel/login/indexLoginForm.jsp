<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>

<%
String clientId = "QZvVFeWc0TA2h7DkUAh6";//애플리케이션 클라이언트 아이디값";
String redirectURI = URLEncoder.encode("http://127.0.0.1:8088/login/naverCallback.do", "UTF-8");
SecureRandom random = new SecureRandom();
String state = new BigInteger(130, random).toString();
String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
apiURL += "&client_id=" + clientId;
apiURL += "&redirect_uri=" + redirectURI;
apiURL += "&state=" + state;
session.setAttribute("state", state);
System.out.println("apiURL :"+apiURL);

%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>프로젝트</title>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
    <!-- Bootstrap Core CSS -->
    <link href="/css/bootstrap.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="/css/modern-business.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	<style type="text/css">
	.loginmodal-container {
	  padding: 30px;
	  max-width: 350px;
	  width: 100% !important;
	  background-color: #F7F7F7;
	  margin: 0 auto;
	  border-radius: 2px;
	  box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	  overflow: hidden;
	  font-family: roboto;
	}
	
	.loginmodal-container h1 {
	  text-align: center;
	  font-size: 1.8em;
	  font-family: roboto;
	}
	
	.loginmodal-container input[type=submit] {
	  width: 100%;
	  display: block;
	  margin-bottom: 10px;
	  position: relative;
	}
	
	.loginmodal-container input[type=text], input[type=password] {
	  height: 44px;
	  font-size: 16px;
	  width: 100%;
	  margin-bottom: 10px;
	  -webkit-appearance: none;
	  background: #fff;
	  border: 1px solid #d9d9d9;
	  border-top: 1px solid #c0c0c0;
	  /* border-radius: 2px; */
	  padding: 0 8px;
	  box-sizing: border-box;
	  -moz-box-sizing: border-box;
	}
	
	.loginmodal-container input[type=text]:hover, input[type=password]:hover {
	  border: 1px solid #b9b9b9;
	  border-top: 1px solid #a0a0a0;
	  -moz-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
	  -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
	  box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
	}
	
	.loginmodal {
	  text-align: center;
	  font-size: 14px;
	  font-family: 'Arial', sans-serif;
	  font-weight: 700;
	  height: 36px;
	  padding: 0 8px;
	/* border-radius: 3px; */
	/* -webkit-user-select: none;
	  user-select: none; */
	}
	
	.loginmodal-submit {
	  /* border: 1px solid #3079ed; */
	  border: 0px;
	  color: #fff;
	  text-shadow: 0 1px rgba(0,0,0,0.1); 
	  background-color: #4d90fe;
	  padding: 17px 0px;
	  font-family: roboto;
	  font-size: 14px;
	  width : 288px;
	  margin-bottom: 5px;
	  /* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#4787ed)); */
	}
	
	.loginmodal-submit:hover {
	  /* border: 1px solid #2f5bb7; */
	  border: 0px;
	  text-shadow: 0 1px rgba(0,0,0,0.3);
	  background-color: #357ae8;
	  /* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#357ae8)); */
	}
	
	.loginmodal-container a {
	  text-decoration: none;
	  color: #666;
	  font-weight: 400;
	  text-align: center;
	  display: inline-block;
	  opacity: 0.6;
	  transition: opacity ease 0.5s;
	} 
	
	.login-help{
	  font-size: 12px;
	}
	
	.content {
	    min-height: 500px;
	    padding-bottom: 70px;
	    position: relative;
	    padding-top: 150px;
	    width:100%;
	}	
	</style>
    <!-- jQuery -->
    <script src="/js/jquery.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="/js/bootstrap.min.js"></script>
    <!-- Script to Activate the Carousel -->
    <script type="text/javascript">
    var apiUrl = "<%=apiURL%>";
    $(document).ready(function(){
     	$("#loginForm").on("click", function(e){
     		loginForm(e);
     	});    	
     	$("#naverLoginBtn").on("click", function(e){
     		naverLogin(e);
     	});
    });
     	
   	function loginForm(e){
   		e.preventDefault();
   		$("#fm").attr("action", "/login/indexLoginForm.do");
   		$("#fm").submit();
   	}

	function commonCheck(e){
		if($("input[name=loginid]").val() == "" ){
			e.preventDefault();
			alert("아이디를 입력하세요");
			return;
		}
		if($("input[name=loginpwd]").val() == ""){
     		e.preventDefault();
			alert("비밀번호를 입력하세요");
			return;
		}    	
		return true;
    }

   	function naverLogin(e){
   		e.preventDefault();
    	var winHeight = document.body.clientHeight;	// 현재창의 높이
 	    var winWidth = document.body.clientWidth;	// 현재창의 너비
 	    var winX = window.screenLeft;	// 현재창의 x좌표
 	    var winY = window.screenTop;	// 현재창의 y좌표
 		    
 		var popX = winX + (winWidth - 300)/2;
 		var popY = winY + (winHeight - 500)/2;	    
 		window.open('${naverUrl}', "_blank", "location=0,status=0,scrollbars=0,resizable=1,width=600,height=650"+ 
		",top="+popY+",left="+popX);
		//$("#loginProcess").attr("target", "loginPop");
		//$("#loginProcess").attr("action", '<c:out value="${naverUrl}"/>');
		//$("#loginProcess").submit();	
   	}
   	
	</script>
</head>
<body>
<div class="content">
	<form name="fm" id="fm" method="post"></form>
	<div class="container">
		<div class="modal-dialog">
			<div class="loginmodal-container">
				<h1>Login to Your Account</h1>
				<br>
				<form action="" name="loginProcess" id="loginProcess" method="post">
					<input type="text" name="loginid" placeholder="Username"> 
					<input type="password" name="loginpwd" placeholder="Password">
					<div class="checkbox">
						<label> <input type="checkbox"> Remember me</label>
					</div>
					<!-- <input type="submit" name="sysLoginBtn" class="login loginmodal-submit" value="Login"> -->
					<input type="button" name="sysLoginBtn" class="login loginmodal-submit" value="Login">
					<div>
						<a href="#" id="naverLoginBtn"><img src="/images/travel/naver/NaverLogin01.png"></a>
					</div>
				</form>
				<div class="login-help">
					<a href="#">Register</a> - <a href="#">Forgot Password</a>
				</div>
			</div>
		</div>
	</div>

    <!-- /.container -->
	<iframe name="hidden" style="display:none"></iframe>
</div>		
</body>	
</html>