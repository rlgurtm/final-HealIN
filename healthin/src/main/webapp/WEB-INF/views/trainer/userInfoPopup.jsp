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
	function matching(){
		if("${pvo.payState }"=="입금대기"){
			alert("입금이 되지 않아 수락할 수 없습니다");
			window.close();
			return false;			
		}
		
		if(confirm("수락하시겠습니까?")){
			opener.location.href="${pageContext.request.contextPath}/trainerMatching.do?trainerId=${mvo.id}&userId=${pvo.userId }";
			window.close();
		}else{
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
				<th>회원아이디</th>
				<th>신청날짜</th>
				<th>기간</th>
				<th>가격</th>
				<th>결제</th>
				<c:if test="${result!='result' }">
					<th>수락</th>
				</c:if>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${pvo.userId }</td>
				<td>${pvo.payDate }</td>
				<td>${pvo.period }개월</td>
				<td>${pvo.price }</td>
				<td>${pvo.payState }</td>
				<c:if test="${result!='result' }">
					<td><input type="button" value="수락" onclick="matching()"></td>
				</c:if>
			</tr>
		</tbody>
	</table>
</div>
</body>
</html>