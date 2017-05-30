<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<style>
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}	
th, td {
    padding: 5px;
    text-align: center;    
}
.align-center { text-align: center; } 
</style>
<title>체질량지수(BMI) 계산하기</title>
<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
var height=$("#height").val();
var weight=$("#weight").val();
$(document).ready(function(){	
	$("#bmiTest").click(function(){
		height/weight*2
		alert();
		
		
	});	
});
</script>
<div class="container" align="center">
<form id="idForm">
<table style="width:200">
<caption>나의 체질량 지수 계산하기</caption>
<tr>
			<th>신장(cm) :<input type="text" id="height" name="name"> 
			   <span id="height"></span>
			   <input type="hidden" name="command" value="idcheck"></th>
</tr> 
<tr>
			<th><br>체중(kg) : <input type="text" id="weight" name="name">
			   <span id="weight"></span>
			   <input type="hidden" name="command" value="namecheck"></th>
</tr>
<tr>			   
			<th><br>나이(만) :&nbsp;&nbsp;<input type="text" id="name" name="name">
			   <span id="checkResult"></span>
			   <input type="hidden" name="command" value="namecheck"></th>
</tr>
<tr>			   
			<th><br>등록일자 : <input type="text" id="name" name="name">
			   <span id="checkResult"></span>
			   <input type="hidden" name="command" value="namecheck"></th>
</tr>
<tr>			   
			<th><br>BMI측정하기 : <input type="button" id="bmiTest" value="측정"></th>
</tr>
</table>
</form>
</div>
</html>