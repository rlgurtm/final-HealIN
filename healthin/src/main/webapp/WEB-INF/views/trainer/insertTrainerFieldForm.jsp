<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Bootstrap Core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">

<!-- Custom CSS -->
<link
	href="${pageContext.request.contextPath}/resources/css/modern-business.css"
	rel="stylesheet" type="text/css">

<!-- Custom Fonts -->
<link
	href="${pageContext.request.contextPath}/resources/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- For date range picker -->
<link
	href="${pageContext.request.contextPath}/resources/css/daterangepicker/daterangepicker.css"
	rel="stylesheet" type="text/css">

<style>
body {
	font-family: Arial, sans-serif;
	position: relative;
	background: #40464b;
	height: 100%;
	padding: 20px 20px;
	margin: 0;
}

input[type="checkbox"] {
	display: none;
}

input[type="checkbox"]+label {
	color: #f2f2f2;
}

input[type="checkbox"]+label span {
	display: inline-block;
	width: 15px;
	height: 15px;
	margin: -2px 10px 0 0;
	vertical-align: middle;
	background:
		url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/check_radio_sheet.png)
		left top no-repeat;
	cursor: pointer;
}

input[type="checkbox"]:checked+label span {
	background:
		url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/check_radio_sheet.png)
		-19px top no-repeat;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#btnSave").click(function(){
		var checkboxValues = [];
		var checkedLength = $(":checkbox[name='field']:checked").length;
		//alert(checkedLength);
		if(checkedLength>0&&checkedLength<4){
			for(var i=0;i<checkedLength; i++){
				checkboxValues.push($(":checkbox[name='field']:checked")[i].value);
			}
			var allData = {"istrainer":$("#mvoIstrainer").val(),"mvoId":$("#mvoId").val(),"field":checkboxValues};
			//alert(checkboxValues[0]+checkboxValues[1]+checkboxValues[2]);
			$.ajax({
				type:"get",
				url:"${pageContext.request.contextPath}/insertTrainerField.do",
				data:allData,
				dataType:"json",
				success:function(data){

				},//success
				complete:function(){
						opener.location.reload();
						self.close();
				}//complete
			});//ajax
		} else {
			alert("1~3개까지 선택가능합니다.");
		}
	});
});

function countChecking(){
	var checkedLength = $(":checkbox[name='field']:checked").length;
	//alert(checkedLength);
	if(checkedLength>0&&checkedLength<4){
		//alert("가능");
		return true;
	} else {
		alert("1~3개까지 선택가능합니다.");
	}
	return false;
}
</script>
<title>Insert Field Form</title>
</head>
<body>

	<div class="container">
		<div class="row" align="center">
			<h1 class="page-header follo">
				관심분야<small>최대 3개</small>
			</h1>
			<div class="col-lg-6" align="left">
				<form action="${pageContext.request.contextPath}/insertTrainerField.do" onsubmit="return countChecking();">
					<c:forEach items="${fieldList}" var="flist">
						<input type="checkbox" id="${flist}" name="field" value="${flist}"/>
						<label for="${flist}"><span></span>${flist}</label>
						<p>
					</c:forEach>
					<input type="hidden" id="mvoIstrainer" name="istrainer" value="${istrainer}">
					<input type="hidden" id="mvoId" name="mvoId" value="${mvoId}">
					<input type="button" id="btnSave" value="저장하기">
				</form>
			</div>
		</div>
	</div>
</body>
</html>



