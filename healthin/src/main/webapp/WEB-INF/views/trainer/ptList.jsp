<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
function popupOpen(){

	var popUrl = "${pageContext.request.contextPath}/trainer/ptListPopup.do";	

	var popOption = "width=500, height=200, top=200 ,left=400, resizable=no, scrollbars=no, status=no;";   

		window.open(popUrl,"popupname",popOption);

	}
</script>
<div class="container">
	<h1 class="page-header">강사 매칭 신청 List</h1>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th style="width:10%;">아이디</th>
				<th style="width:10%;">이름</th>
				<th style="width:15%;">닉네임</th>
				<th>주소</th>
				<th>pt현황</th>
			</tr>
		</thead>
		<tbody id="tipBoardInfo">
			<c:forEach items="${ptList }" var="list">
				<tr>
					<td>${list.id}</td><td>${list.name }</td><td>${list.nickname }</td>
					<td>${list.address }</td><td><a href="javascript:popupOpen();">현황보기</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>