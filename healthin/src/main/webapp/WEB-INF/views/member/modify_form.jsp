<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>회원정보 수정</title>
<script type="text/javascript">
$(document).ready(function () {
	$("modifyBtn").click(function () {
		$("#modifyFrm").submit(); 
	});//회원정보 수정
});//ready
</script>

<!-- Bootstrap -->
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<!-- font awesome -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" media="screen"
	title="no title" charset="utf-8">
<!-- Custom style -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" media="screen"
	title="no title" charset="utf-8">
</head>

<body>

	<article class="container">
		<div class="page-header">
			<h1>
				회원정보수정 <small> form</small>
			</h1>
		</div>
		<div class="col-md-6 col-md-offset-3">
			<form role="form" id="modifyFrm" action="${pageContext.request.contextPath}/modify.do">
				<div class="form-group">
					<label for="InputId">id</label> <input type="text"
						class="form-control" value="${sessionScope.mvo.id }"   name="id" placeholder="${sessionScope.mvo.id }" readonly="readonly">
				</div>
				<div class="form-group">
					<label for="InputPassword">password</label> <input type="password"
						class="form-control" value="${sessionScope.mvo.password }"   name="password" placeholder="${sessionScope.mvo.password }" >
				</div>
				<div class="form-group">
					<label for="Inputnickname">nickname</label> <input type="text"
						class="form-control"  value="${sessionScope.mvo.nickname }"  name="nickname" placeholder="${sessionScope.mvo.nickname }" >
				</div>
				<div class="form-group">
					<label for="Inputnickname">name</label> <input type="text"
						class="form-control" value="${sessionScope.mvo.name }" name="name" placeholder="${sessionScope.mvo.name }" >
				</div>
				<div class="form-group">
					<label for="Inputnickbirthdate">birthdate</label> <input type="text"
						class="form-control"  value="${sessionScope.mvo.birthdate }"  name="birthdate" placeholder="${sessionScope.mvo.birthdate }" >
				</div>
				<div class="form-group">
					<label for="Inputgender">gender</label><br> 
					<c:choose>
					<c:when test="${sessionScope.mvo.gender ==  'female'}">
					<input type="radio" name="gender" value="female" checked="checked">여자
					<input type="radio" name="gender" value="male" >남자
					</c:when>
					<c:when test="${sessionScope.mvo.gender ==  'male'}">
					<input type="radio" name="gender" value="female" >여자
					<input type="radio" name="gender" value="male" checked="checked" >남자
					</c:when>
					</c:choose>
				</div>
				<div class="form-group">
					<label for="Inputnickaddress">address</label> <input type="text"
						class="form-control" value="${sessionScope.mvo.address }" name="address" placeholder="${sessionScope.mvo.address }" >
				</div>
				<div class="form-group">
					<label for="Inputtel">tel</label> <input type="text"
						class="form-control" value="${sessionScope.mvo.tel }" name="tel" placeholder="${sessionScope.mvo.tel }" >
				</div>
				<div class="form-group">
					<label for="Inputemail">email</label> <input type="text"
						class="form-control" value="${sessionScope.mvo.email }" name="email" placeholder="${sessionScope.mvo.email }" >
				</div>
				<div class="form-group">
					<label for="Inputistrainer">istrainer</label> <br>
					<c:choose>
					<c:when test="${sessionScope.mvo.istrainer ==  'y'}">
					<input type="radio" name="istrainer" value="y" checked="checked" readonly="readonly">코치
					<input type="radio" name="istrainer" value="n" readonly="readonly">학생
					</c:when>
					<c:when test="${sessionScope.mvo.istrainer ==  'n'}">
					<input type="radio" name="istrainer" value="y" readonly="readonly">코치
					<input type="radio" name="istrainer" value="n" checked="checked" readonly="readonly" >학생
					</c:when>
					</c:choose>
					<input type="hidden" value="N" name="withdrawal"  >
				</div>
				
				
				<div class="form-group text-center">
					<button type="submit" class="btn btn-info" id="modifyBtn">
						회원정보수정<i class="fa fa-check spaceLeft"></i>
					</button>
					<button type="reset" class="btn btn-warning">
						초기화<i class="fa fa-times spaceLeft"></i>
					</button>
				</div>
			</form>
		</div>
	</article>
</body>
