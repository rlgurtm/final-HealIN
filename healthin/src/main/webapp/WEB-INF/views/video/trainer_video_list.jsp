<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="http://vjs.zencdn.net/c/video-js.css" rel="stylesheet" />
<script src="http://vjs.zencdn.net/c/video.js"></script>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="css/modern-business.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet" href="https://unpkg.com/purecss@0.6.2/build/pure-min.css" integrity="sha384-UQiGfs9ICog+LwheBSRCt1o5cbyKIHbwjWscjemyBMT9YCUMZffs6UqUTd0hObXD" crossorigin="anonymous">

<div class="container">
	<!-- Page Heading/Breadcrumbs -->
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				Trainer Video <small></small>
			</h1>
			<ol class="breadcrumb">
				<li><a class="btn"
					href="${pageContext.request.contextPath}/filter.do"><strong>FILTER</strong></a></li>
				<li class="active"></li>
			</ol>
		</div>
	</div>
	<!-- /.row -->


	<!-- Projects Row -->
	<div class="row">
		<c:forEach items="${listVO.LVO}" var="lvo">
			<div class="col-md-3 img-portfolio">
				<a
					href="${pageContext.request.contextPath}/trainerVideoShow.do?videoNo=${lvo.videoNo}#loca">
					<video width="280" height="210">
						<source
							src="${pageContext.request.contextPath}/resources/video/${lvo.videoFile}"
							type="video/mp4">
					</video>
				</a>
				<h3>${lvo.title}</h3>
				<p>조회수 : ${lvo.hits}</p>
				<p>${lvo.content}</p>
			</div>

		</c:forEach>
	</div>

	<hr>
	<div class="col-lg-12" align="right">
		<form class="pure-form">
			<input type="text" class="pure-input-rounded">
			<button type="submit" class="pure-button">Search</button>
		</form>
	</div>

	<!-- Pagination -->
	<div class="row text-center">
		<div class="col-lg-12">
			<ul class="pagination">
				<li><a href="#">&laquo;</a></li>
				<li class="active"><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">&raquo;</a></li>
			</ul>
		</div>
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12" align="center">
			<ol class="breadcrumb">
				<li class="active"></li>
				<li><a
					href="${pageContext.request.contextPath}/trainerVideoList.do"
					class="btn"><strong>List</strong></a></li>
				<li><a
					href="${pageContext.request.contextPath}/trainerVideoWriteForm.do"
					class="btn"><strong>Write</strong></a></li>
				<li><a href="#" class="btn"><strong>Edit</strong></a></li>
				<li><a href="#" class="btn"><strong>Delete</strong></a></li>
				<li class="active"></li>
			</ol>
		</div>
	</div>
</div>

<br>


