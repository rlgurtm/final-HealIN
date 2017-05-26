<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<%-- <!-- jQuery -->
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> --%>

<!-- Script to Activate the Carousel -->
<script>
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    })
</script>

<!-- title이 null인 경우는 무시된다. -->
<title><tiles:insertAttribute name="title" ignore="true" /></title>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
 <!-- Bootstrap Core CSS -->
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">

<!-- Custom CSS -->
<link href="${pageContext.request.contextPath}/resources/css/modern-business.css" rel="stylesheet" type="text/css">

<!-- Custom Fonts -->
<link href="${pageContext.request.contextPath}/resources/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body>
	<div>
		<tiles:insertAttribute name="header" />
	</div>
	<!-- <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation"> -->
		<tiles:insertAttribute name="menubar" />
	<!-- </nav> -->
	<div class="container">
		<tiles:insertAttribute name="main" />
	</div>
	<div class="footer">
		
	</div>
	<tiles:insertAttribute name="footer" />
	<%-- <div id="header"><tiles:insertAttribute name="header" /></div>
	<div class="container-fluid text-center">    
		<div class="row content">
			<div id="left" class="col-sm-2 sidenav"><tiles:insertAttribute name="left" /></div>
			<div id="main" class="col-sm-8 text-left"><tiles:insertAttribute name="main" /></div>
			<div id="right" class="col-sm-2 sidenav"><tiles:insertAttribute name="right" /></div>
		</div>
	</div>
	<div id="footer"><tiles:insertAttribute name="footer" /></div> --%>
</body>
</html>