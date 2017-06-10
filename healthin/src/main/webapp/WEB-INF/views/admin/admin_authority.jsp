<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Bootstrap Core CSS -->
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">

<!-- Custom CSS -->
<link href="${pageContext.request.contextPath}/resources/css/modern-business.css" rel="stylesheet" type="text/css">

<!-- Custom Fonts -->
<link href="${pageContext.request.contextPath}/resources/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
<!-- For date range picker -->
<link href="${pageContext.request.contextPath}/resources/css/daterangepicker/daterangepicker.css" rel="stylesheet" type="text/css">

<title>관리자 페이지</title>
<script type="text/javascript">
	$(document).ready(function(){
		
	});
</script>
</head>
<body>
<br><br>
<div class="container">
	<!-- Page Heading/Breadcrumbs -->
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				관리자 페이지&emsp;&emsp; <small><a href="${pageContext.request.contextPath}/home.do">Home</a></small>
			</h1>
			<ol class="breadcrumb">
				<li class="active"></li>
				<li><a class="btn"
					href="${pageContext.request.contextPath}/findByIsTrainer.do">
						<strong>강사 등급 지정</strong>
				</a></li>
				<li><a class="btn"
					href="${pageContext.request.contextPath}/memberSecessionForm.do">
						<strong>회원 탈퇴 지정</strong>
				</a></li>
				<li><a class="btn"
					href="${pageContext.request.contextPath}/findByTrainerVideoForm.do">
						<strong>동영상 삭제</strong>
				</a></li>
				<li><a class="btn"
					href="${pageContext.request.contextPath}/findByBoardForm.do">
						<strong>게시글 삭제</strong>
				</a></li>
				<li class="active"></li>
			</ol>
		</div>
	</div>
<hr>
<c:if test="${adminState=='rankDesignation'}">
<table class="table">
	<thead>
	<tr>
		<th>ID</th>
		<th>NAME</th>
		<th>NickName</th>
		<th>탈퇴여부</th>
		<th>강사등급</th>
		<th>등급지정</th>
	</tr>
	</thead>
	<c:forEach items="${listVO.LVO}" var="lvo">
	<tbody>
	<tr>
		<td>${lvo.membervo.id}</td>
		<td>${lvo.membervo.name}</td>
		<td>${lvo.membervo.nickname}</td>
		<td>${lvo.membervo.withdrawal}</td>
		<td>${lvo.rank}</td>
		<td>
		<form action="trainerRankDesignation.do">
			<select name="trainerRank">
				<option value="0">0</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
			</select>
			<input type="hidden" name="id" value="${lvo.membervo.id}">
			<input class="btn" type="submit" value="변경저장">
		</form>
		</td>
	</tr>
	</tbody>
	</c:forEach>
</table>
</c:if>
<c:if test="${adminState=='SecessionForm'}">
<table class="table">
	<thead>
	<tr>
		<th>ID</th>
		<th>NAME</th>
		<th>NickName</th>
		<th>생년월일</th>
		<th>성별</th>
		<th>E-MAIL</th>
		<th>회원분류</th>
		<th>탈퇴여부</th>
		<th>사용정지</th>
		<th>사용가능</th>
	</tr>
	</thead>
	<c:forEach items="${listVO.LVO}" var="lvo">
	<tbody>
	<tr>
		<td>${lvo.id}</td>
		<td>${lvo.name}</td>
		<td>${lvo.nickname}</td>
		<td>${lvo.birthdate}</td>
		<td>${lvo.gender}</td>
		<td>${lvo.email}</td>
		<td>${lvo.istrainer}</td>
		<td>${lvo.withdrawal}</td>
		<td>
		<a class="btn"
		href="${pageContext.request.contextPath}/memberSecession.do?id=${lvo.id}&state=정지">
		정지</a></td>
		<td>
		<a class="btn"
		href="${pageContext.request.contextPath}/memberSecession.do?id=${lvo.id}&state=사용">
		사용</a></td>
	</tr>
	</tbody>
	</c:forEach>
</table>
</c:if>
<c:if test="${adminState=='findByTrainerVideoForm'}">
<table class="table">
	<thead>
	<tr>
		<th>VIDEO_NO</th>
		<th>TITLE</th>
		<th>등록일시</th>
		<th>조회수</th>
		<th>CATEGORY</th>
		<th>ID</th>
		<th>공개범위</th>
		<th>사용정지</th>
		<th>사용가능</th>
	</tr>
	</thead>
	<c:forEach items="${listVO.LVO}" var="lvo">
	<tbody>
	<tr>
		<td>${lvo.videoNo}</td>
		<td>${lvo.title}</td>
		<td>${lvo.postedDate}</td>
		<td>${lvo.hits}</td>
		<td>${lvo.category}</td>
		<td>${lvo.trainerId}</td>
		<td>${lvo.openrank}</td>
		<td>
		<a class="btn"
		href="${pageContext.request.contextPath}/deleteTrainerVideo.do?videoNo=${lvo.videoNo}&state=정지">
		정지</a></td>
		<td>
		<a class="btn"
		href="${pageContext.request.contextPath}/deleteTrainerVideo.do?videoNo=${lvo.videoNo}&state=사용">
		사용</a></td>
	</tr>
	</tbody>
	</c:forEach>
</table>
</c:if>
<c:if test="${adminState=='findByBoardForm'}">
<table class="table">
	<thead>
	<tr>
		<th>BOARD_NO</th>
		<th>TITLE</th>
		<th>등록일시</th>
		<th>조회수</th>
		<th>CATEGORY</th>
		<th>ID</th>
		<th>게시판분류</th>
		<th>삭제</th>
	</tr>
	</thead>
	<c:forEach items="${listVO.LVO}" var="lvo">
	<tbody>
	<tr>
		<td>${lvo.no}</td>
		<td>${lvo.title}</td>
		<td>${lvo.postedDate}</td>
		<td>${lvo.hits}</td>
		<td>${lvo.category}</td>
		<td>${lvo.memberVO.id}</td>
		<td>${lvo.tipqna}</td>
		<td>
		<a class="btn"
		href="${pageContext.request.contextPath}/deleteBoard.do?boardNo=${lvo.no}&state=삭제">
		삭제</a></td>
	</tr>
	</tbody>
	</c:forEach>
</table>
</c:if>


</div>
</body>
</html>