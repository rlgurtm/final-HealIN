<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<link href="http://vjs.zencdn.net/c/video-js.css" rel="stylesheet" />
<script src="http://vjs.zencdn.net/c/video.js"></script>
<style>
table, td, th {    
    text-align: left;
}
table {
    border-collapse: collapse;
}
th{
	font-size: 17px;
}
th, td {
    padding: 3px;
}
</style>
<c:forEach items="${listVO.LVO}" var="lvo">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-2">
			<a href="${pageContext.request.contextPath}/trainerVideoShow.do?videoNo=${lvo.videoNo}">
			<video width="200" height="150">
				<source
					src="${pageContext.request.contextPath}/resources/video/${lvo.videoFile}"
					type="video/mp4">
			</video>
			</a>
		</div>
		<div class="col-md-6">
			<table>
				<tr>
					<th>제목</th><th>&nbsp;${lvo.title}</th>
				</tr>
				<tr>
					<td>작성자</td><td>&nbsp;${lvo.trainerId}</td>
				</tr>
				<tr>
					<td>조회수</td><td>&nbsp;${lvo.hits}</td>
				</tr>
				<tr>
					<td>작성일자</td><td>&nbsp;${lvo.postedDate}</td>
				</tr>
				<tr>
					<td>내용</td><td>&nbsp;${lvo.content}</td>
				</tr>
			</table>
		</div>
		<div class="col-md-2"></div>
	</div>
</c:forEach>
<br>


