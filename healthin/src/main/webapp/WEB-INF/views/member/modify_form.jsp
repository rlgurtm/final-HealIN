<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>bootstrap template</title>

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
			<form role="form">
				<div class="form-group">
					<label for="InputId">id</label> <input type="text"
						class="form-control" id="id" placeholder="${sessionScope.mvo.id }" disabled="disabled">
				</div>
				<div class="form-group">
					<label for="InputPassword">password</label> <input type="text"
						class="form-control" id="password" placeholder="${sessionScope.mvo.password }" >
				</div>
				<div class="form-group">
					<label for="Inputnickname">nickname</label> <input type="text"
						class="form-control" id="nickname" placeholder="${sessionScope.mvo.nickname }" >
				</div>
				<div class="form-group">
					<label for="Inputnickname">name</label> <input type="text"
						class="form-control" id="name" placeholder="${sessionScope.mvo.name }" >
				</div>
				<div class="form-group">
					<label for="Inputnickbirthdate">birthdate</label> <input type="text"
						class="form-control" id="birthdate" placeholder="${sessionScope.mvo.birthdate }" >
				</div>
				<div class="form-group">
					<label for="Inputnickgender">gender</label> 
					<input type="text" class="form-control" id="gender" placeholder="${sessionScope.mvo.gender }" >
				</div>
				<div class="form-group">
					<label for="Inputnickaddress">address</label> <input type="text"
						class="form-control" id="address" placeholder="${sessionScope.mvo.address }" >
				</div>
				<div class="form-group">
					<label for="Inputtel">tel</label> <input type="text"
						class="form-control" id="tel" placeholder="${sessionScope.mvo.tel }" >
				</div>
				<div class="form-group">
					<label for="Inputemail">email</label> <input type="text"
						class="form-control" id="email" placeholder="${sessionScope.mvo.email }" >
				</div>
				<div class="form-group">
					<label for="Inputistrainer">istrainer</label> <input type="text"
						class="form-control" id="istrainer" placeholder="${sessionScope.mvo.istrainer }" >
				</div>
				
				
				<div class="form-group text-center">
					<button type="submit" class="btn btn-info">
						회원정보수정<i class="fa fa-check spaceLeft"></i>
					</button>
					<button type="submit" class="btn btn-warning">
						초기화<i class="fa fa-times spaceLeft"></i>
					</button>
				</div>
			</form>
		</div>
	</article>
</body>

