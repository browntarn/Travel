<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
	<tiles:insertAttribute name="header" /> 
</head>
<body>
	<header id="menu">
	<tiles:insertAttribute name="menu" />
	</header>
	<section id="main">
	<tiles:insertAttribute name="main" />
	</section>
	<section id="footer">
	<tiles:insertAttribute name="footer" />
	</section>
</body>
</html>
