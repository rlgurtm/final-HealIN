<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div align="right">
	<c:choose>
	<c:when test="${sessionScope.mvo == null}">
	<a href="${pageContext.request.contextPath}/member/register_step1.do">회원가입</a>&nbsp;&nbsp;
	<a href="${pageContext.request.contextPath}/login_form.do">로그인</a>&nbsp;&nbsp;
	<a href="${pageContext.request.contextPath}/passwordSearchform.do">비밀번호 찾기</a>&nbsp;&nbsp;
	<a href="${pageContext.request.contextPath}/idSearchform.do">아이디 찾기</a>&nbsp;&nbsp;
	</c:when>
	<c:otherwise>
	${sessionScope.mvo.id}
	${sessionScope.mvo.nickname}님 로그인 하셨습니다.&nbsp;&nbsp;
	<a href="${pageContext.request.contextPath}/member/modify_form.do?id=${sessionScope.mvo.id}">회원정보수정</a>&nbsp;&nbsp;
	<a href="${pageContext.request.contextPath}/logout.do">로그아웃</a>
	</c:otherwise>
	</c:choose>
	<c:forEach begin="1" end="10">&nbsp;</c:forEach>
</div>
<hr>
<!-- <form align="right" id="loginForm">
	ID <input type="text">
	PW <input type="password">
</form>	 
<hr> -->
<div align="left" >
	<c:forEach begin="1" end="20">&nbsp;</c:forEach>
	<a href="${pageContext.request.contextPath}/home.do"><img src="${pageContext.request.contextPath}/resources/img/로고.png" width="150" height="110"></a>
	<c:forEach begin="1" end="130">&nbsp;</c:forEach>
	<img src="${pageContext.request.contextPath}/resources/img/검색.png" width="20" height="20">&nbsp;
	<select>
		<option>----</option>
		<option>aaa</option>
		<option>bbb</option>
		<option>ccc</option>
	</select>
	<input type="text" size="30"><input type="button" value="검색">
</div>
