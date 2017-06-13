<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				MENTORING LIST
				<small>
				<c:choose>
					<c:when test="${mvo.istrainer=='trainer'}">사용자목록</c:when>
					<c:when test="${mvo.istrainer=='user'}">강사목록</c:when>
				</c:choose>
				</small>
			</h1>
			<hr>
			<table class="table">
			<thead>
			<tr>
				<th>ID</th>
				<th>NickName</th>
				<th>생년월일</th>
				<th>성별</th>
				<th>주소</th>
				<th>Mentoring</th>
			</tr>
			</thead>
			<c:forEach items="${listVO.LVO}" var="lvo">
			<tbody>
			<tr>
				<td>${lvo.sendMember.id}</td>
				<td>${lvo.sendMember.nickname}</td>
				<td>${lvo.sendMember.birthdate}</td>
				<td>${lvo.sendMember.gender}</td>
				<td>${lvo.sendMember.address}</td>
				<td>
				<a class="btn"
				href="${pageContext.request.contextPath}/mentoringDetail.do?sendId=${lvo.sendMember.id}">
				Mentoring</a>
				<c:if test="${lvo.hits>0}">
				<img style="width: 35px; height: 20px" src="${pageContext.request.contextPath}/resources/img/newMentoring.gif">
				</c:if>
				</td>
			</tr>
			</tbody>
			</c:forEach>
		</table>
		</div>
	</div>



</div>
















