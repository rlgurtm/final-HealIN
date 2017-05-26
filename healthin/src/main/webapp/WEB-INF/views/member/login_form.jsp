<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>login</title>
<script src="//code.jquery.com/jquery.min.js"></script>
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- Custom Theme files -->
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--Google Fonts-->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/login.css" />

<script>
	$(document).ready(function() {
		$("#btn-login").click(function() {
			$("#loginFrm").submit();
		});
	});
</script>
<meta charset="UTF-8">
</head>
<body>
	<h1>Flat New Login Form</h1>
	<div class="login">
		<h2>Login</h2>
		<form action="${pageContext.request.contextPath}/login.do"
			id="loginFrm">
			<input type="text" class="user active" name="id" value="UserID"
				onfocus="this.value = '';"
				onblur="if (this.value == '') {this.value = 'User name';}" /> <input
				type="password" class="lock active" name="password" value="Password"
				onfocus="this.value = '';"
				onblur="if (this.value == '') {this.value = 'Password';}" />
			<div class="forgot">
				<div class="login-check"></div>
				<div class="login-para">
					<p>
						<a href="#"> 암호를 분실하셨나요? </a>
					</p>
				</div>
				<div class="clear"></div>
			</div>
			<div class="login-bwn">
				<input type="submit" value="로그인" id="btn-login" />
			</div>
		</form>
		<div class="login-bottom">
			<h3>Login</h3>
			<p>소셜미디어 로그인</p>
			<div class="social-icons">
				<div class="button">
					<a class="tw" href="#"> <i class="anc-tw"> </i> <span>Twitter</span>
						<div class="clear"></div></a> <a class="fa" href="#"> <i
						class="anc-fa"> </i> <span>Facebook</span>
						<div class="clear"></div></a> <a class="go" href="#"><i
						class="anc-go"> </i><span>Google+</span>
						<div class="clear"></div></a>
					<div class="clear"></div>
				</div>
				<h4>
					가입이 안되어있나요? <a href="#"> 지금 등록!</a>
				</h4>
				<div class="reg-bwn">
					<a href="#">회원가입</a>
				</div>
			</div>
		</div>
	</div>
	<div style="text-align: center; margin-top: 10px;">
		<ins class="adsbygoogle" style="display: block"
			data-ad-client="ca-pub-8011246932591811" data-ad-slot="9844648019"
			data-ad-format="auto"></ins>
		<script>
			(adsbygoogle = window.adsbygoogle || []).push({});
		</script>
		<script async
			src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
	</div>

	<div class="copyright">
		<p>
			Template by <a href="https://www.designmaz.net/" target="_blank">
				DesignMaz </a>
		</p>
	</div>

</body>
</html>


