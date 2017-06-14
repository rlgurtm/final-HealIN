<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- for Calendar -->
<%-- <script src="${pageContext.request.contextPath}/resources/js/fullcalendar/jquery-ui.min.js"></script> --%>
<script src="${pageContext.request.contextPath}/resources/js/fullcalendar/moment.min.js"></script>
<script src='http://fullcalendar.io/js/fullcalendar-3.4.0/fullcalendar.js'></script>
<link href='http://fullcalendar.io/js/fullcalendar-3.4.0/fullcalendar.css' rel='stylesheet' />



<!-- for date range picker -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="${pageContext.request.contextPath}/resources/js/daterangepicker/daterangepicker.js"></script>

<!-- Script to Activate the Carousel -->
<script>
	$('.carousel').carousel({
		interval : 5000
	//changes the speed
	})
	function openNewWindow(window) {
		open(
				window,
				"NewWindow",
				"left=0, top=0, toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=yes, width=500, height=500");
	}
</script>

<!-- title이 null인 경우는 무시된다. -->
<title><tiles:insertAttribute name="title" ignore="true" /></title>
<!-- Bootstrap Core CSS -->
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">

<!-- Custom CSS -->
<link href="${pageContext.request.contextPath}/resources/css/modern-business.css" rel="stylesheet" type="text/css">

<!-- Custom Fonts -->
<link href="${pageContext.request.contextPath}/resources/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
<!-- For date range picker -->
<link href="${pageContext.request.contextPath}/resources/css/daterangepicker/daterangepicker.css" rel="stylesheet" type="text/css">

<!-- slick -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/slick.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/slick-theme.css"/>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/slick.min.js"></script>

<!-- rating -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/rating.css"/>


</head>
<body>
	<div class="header2">
		<tiles:insertAttribute name="header" />
	</div>
	<tiles:insertAttribute name="menubar" />
	<tiles:insertAttribute name="main" />
	<tiles:insertAttribute name="footer" />
</body>
</html>