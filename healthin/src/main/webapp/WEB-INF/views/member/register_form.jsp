<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>회원가입</title>
<script type="text/javascript">
$(document).ready(function () {
	$("registerBtn").click(function () {
		$("#registerFrm").submit(); 
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
				회원가입 <small> form</small>
			</h1>
		</div>
		<div class="col-md-6 col-md-offset-3">
			<form role="form" id="registerFrm" action="${pageContext.request.contextPath}/register.do">
				<div class="form-group">
					<label for="InputId">id</label> <input type="text"
						class="form-control" name="id" placeholder="ID를 입력해주세요" >
				</div>
				<div class="form-group">
					<label for="InputPassword">password</label> <input type="password"
						class="form-control" name="password" placeholder="ID를 입력해주세요" >
				</div>
				<div class="form-group">
					<label for="Inputnickname">nickname</label> <input type="text"
						class="form-control"  name="nickname" placeholder="ID를 입력해주세요" >
				</div>
				<div class="form-group">
					<label for="Inputnickname">name</label> <input type="text"
						class="form-control" name="name" placeholder="ID를 입력해주세요" >
				</div>
				<div class="form-group">
					<label for="Inputnickbirthdate">birthdate</label> <input type="text"
						class="form-control"   name="birthdate" placeholder="ID를 입력해주세요" >
				</div>
				<div class="form-group">
					<label for="Inputgender">gender</label><br> 
					<input type="radio" name="gender" value="female" checked="checked">여자
					<input type="radio" name="gender" value="male" >남자
				</div>
				<div class="form-group">
					<label for="Inputnickaddress">address</label> <input type="text"
						class="form-control" name="address" placeholder="ID를 입력해주세요" >
				</div>
				<div class="form-group">
					<label for="Inputtel">tel</label> <input type="text"
						class="form-control" name="tel" placeholder="ID를 입력해주세요" >
				</div>
				<div class="form-group">
					<label for="Inputemail">email</label> <input type="text"
						class="form-control" name="email" placeholder="ID를 입력해주세요" >
				</div>
				<div class="form-group">
					<label for="Inputistrainer">istrainer</label> <br>
					<input type="radio" name="istrainer" value="y" checked="checked">코치
					<input type="radio" name="istrainer" value="n">학생
					<input type="hidden" value="N" name="withdrawal"  >
				</div>
				
				
				<div class="form-group text-center">
					<button type="submit" class="btn btn-info" id="registerBtn">
						회원가입<i class="fa fa-check spaceLeft"></i>
					</button>
					<button type="reset" class="btn btn-warning">
						초기화<i class="fa fa-times spaceLeft"></i>
					</button>
				</div>
			</form>
		</div>
	</article>
</body>

