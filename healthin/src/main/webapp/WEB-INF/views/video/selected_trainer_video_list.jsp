<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="http://vjs.zencdn.net/c/video-js.css" rel="stylesheet" />
<script src="http://vjs.zencdn.net/c/video.js"></script>
<link rel="stylesheet"
	href="https://unpkg.com/purecss@0.6.2/build/pure-min.css"
	integrity="sha384-UQiGfs9ICog+LwheBSRCt1o5cbyKIHbwjWscjemyBMT9YCUMZffs6UqUTd0hObXD"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(document).ready(function() {
	});
</script>
<div class="container">
	<!-- Page Heading/Breadcrumbs -->
	<div class="row">
	<h2>
	Trainer Video 검색 결과</h2><br>
	<br>
	</div>
	<!-- /.row -->
	<%-- ${listVO} --%>
	<!-- Projects Row -->
	<div class="row">
		<c:forEach items="${listVO.LVO}" var="lvo">
			<div class="col-md-3 img-portfolio">
				<div class="videoList">
					<a href="${pageContext.request.contextPath}/trainerVideoShow.do?videoNo=${lvo.videoNo}#loca">
						<video class="video-js" width="270" height="200" preload="metadata" >
							<source
								src="${pageContext.request.contextPath}/resources/video/${lvo.videoFile}"
								type="video/mp4">
						</video>
					</a>
					<!-- <div style="background:#F2F2F2"> -->
					<h4>
						<a>${lvo.title}</a>
					</h4>
					작성자 : ${lvo.trainerId}<br>
					추천 : ${lvo.likeState}<br> 
					분류 : ${lvo.category}<br>
					조회수 : ${lvo.hits}<br> 
					등록일 : ${lvo.postedDate}<br>
					<!-- </div> -->
				</div>
			</div>
		</c:forEach>
	</div>

	<hr>

	<!-- Pagination -->
	<div class="row text-center">
		<div class="col-lg-12">
			<ul class="pagination">
				<c:choose>
					<c:when test="${listVO.pb.previousPageGroup}">
						<li><a
							href="${ pageContext.request.contextPath }/filterVideoList.do?filter=${filter}&nowPage=${listVO.pb.startPageOfPageGroup-1}">&laquo;</a></li>
					</c:when>
				</c:choose>
				<li class="active">
				<c:forEach var="pg" begin="${listVO.pb.startPageOfPageGroup}"
					end="${listVO.pb.endPageOfPageGroup}">
					<li><a href="${ pageContext.request.contextPath }/filterVideoList.do?filter=${filter}&nowPage=${ pg }">${ pg }</a></li>
					</c:forEach>
				<li class="active">
				<c:choose>
					<c:when test="${listVO.pb.nextPageGroup}">
						<li><a href="${ pageContext.request.contextPath }/filterVideoList.do?filter=${filter}&nowPage=${listVO.pb.endPageOfPageGroup+1}">&raquo;</a></li>
					</c:when>
				</c:choose>
			</ul>
		</div>
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12" align="center">
			<ol class="breadcrumb">
				<li class="active"></li>
				<li><a
					href="${pageContext.request.contextPath}/filterVideoList.do?filter=no"
					class="btn"> <strong>List</strong></a></li>
				<c:if test="${mvo.istrainer=='trainer'&&mvo.withdrawal=='N'&&tvo.rank>0}">
					<li><a
						href="${pageContext.request.contextPath}/trainerVideoWriteForm.do"
						class="btn"> <strong>Write</strong></a></li>
				</c:if>
				<li class="active"></li>
			</ol>
		</div>
	</div>
</div>
<br>
${tvo.rank}


