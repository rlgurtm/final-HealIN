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

th {
	font-size: 30px;
}

td {
	font-size: 30px;
}

th, td {
	padding: 3px;
}
</style>
<video width="640" height="480" controls="controls" autoplay="autoplay">
	<source
		src="${pageContext.request.contextPath}/resources/video/${videoVO.videoFile}"
		type="video/mp4">
</video>
<table>
	<tr>
		<td>작성자</td>
		<td>&nbsp;${videoVO.trainerId}</td>
	</tr>
	<tr>
		<td>제목</td>
		<td>&nbsp;${videoVO.title}</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>&nbsp;${videoVO.content}</td>
	</tr>

	<tr>
		<td>조회수</td>
		<td>&nbsp;${videoVO.hits}</td>
	</tr>
	<tr>
		<td>작성일자</td>
		<td>&nbsp;${videoVO.postedDate}</td>
	</tr>

</table>






