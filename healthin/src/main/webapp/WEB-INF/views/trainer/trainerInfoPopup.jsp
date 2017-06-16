<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style>
	table{
		margin-top: 10%;
	}
</style>
<script type="text/javascript">
	function deposit(){
		if(confirm("입금하셨습니까?")){
			opener.location.href="${pageContext.request.contextPath}/userDeposit.do?trainerId=${pvo.trainerId.membervo.id }&userId=${mvo.id}";
			window.close();
		}else{
			window.close();
			return false;
		}
	}
</script>
</head>
<body>
<div class="container">
	<table class="table table-bordered" style="margin-left: auto; margin-right: auto;">
		<thead>
			<tr>
				<th>강사아이디</th>
				<c:choose>
					<c:when test="${pvo.payState!='PT중' }">
						<th>신청날짜</th>
					</c:when>
					<c:otherwise>
						<th>시작날짜</th>
						<th>종료날짜</th>
					</c:otherwise> 
				</c:choose>			
				<th>기간</th>
				<th>가격</th>
				<th>결제상태</th>
				<c:if test="${pvo.payState!='입금완료' }">
					<c:if test="${pvo.payState!='PT중' }">
					<th>입금확인</th>
					</c:if>
				</c:if>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${pvo.trainerId.membervo.id }</td>
				<c:choose>
					<c:when test="${pvo.payState!='PT중' }">
						<td>${pvo.payDate }</td>
					</c:when>
					<c:otherwise>
						<td>${pvo.payDate }</td>
						<td>${info }</td>
					</c:otherwise> 
				</c:choose>			
				<td>${pvo.period }개월</td>
				<td>${pvo.price }</td>
				<td>${pvo.payState }</td>
				<c:if test="${pvo.payState!='입금완료'}">
					<c:if test="${pvo.payState!='PT중' }">
					<td><input type="button" value="입금완료" onclick="deposit()"></td>
					</c:if>
				</c:if>
				
			</tr>
		</tbody>
	</table>
</div>
</body>
</html>