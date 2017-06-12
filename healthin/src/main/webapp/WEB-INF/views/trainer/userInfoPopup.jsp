<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		if(confirm("수락하시겠습니까?")){
			opener.location.href="${pageContext.request.contextPath}/trainerMatching.do?trainerId=${mvo.id}&userId=${id}";
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
				<th>아이디</th>
				<th>신청날짜</th>
				<th>기간</th>
				<th>가격</th>
				<th>결제</th>
				<th>수락</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${id }</td>
				<td>2017-06-01</td>
				<td>3개월</td>
				<td>30000</td>
				<td>입금대기</td>
				<td><input type="button" value="수락" onclick="matching()"></td>
			</tr>
		</tbody>
	</table>
</div>
</body>
</html>