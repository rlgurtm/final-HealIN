<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function () {
	$("#loginBtn").click(function () {
		alert('로그인');
		//$("#loginFrm").submit();
	});
});	
</script>
<form action="login.do" name="loginFrm">
	id<input type="text" name="id"><br /> 
	password<input type="password" name="password"><br />
	<input type="submit" value="login"><br />
</form>