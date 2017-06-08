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
</head>
<body>
<div class="container">
	<table class="table table-bordered" style="margin-left: auto; margin-right: auto;">
		<thead>
			<tr>
				<th>아이디</th><th>신청</th><th>결제</th><th>수락</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>ajax</td><td>신청중</td><td>결제대기</td><td><input type="button" value="수락"></td>
			</tr>
		</tbody>
	</table>
</div>
</body>
</html>