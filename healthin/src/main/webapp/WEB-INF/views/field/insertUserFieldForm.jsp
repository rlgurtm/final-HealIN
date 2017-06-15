<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet"
	href="https://unpkg.com/purecss@0.6.2/build/pure-min.css"
	integrity="sha384-UQiGfs9ICog+LwheBSRCt1o5cbyKIHbwjWscjemyBMT9YCUMZffs6UqUTd0hObXD"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
.body {
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
$(document).ready(function() {
	
});

function countChecking() {
	var checkedLength = $(":checkbox[name='field']:checked").length;
	//alert(checkedLength);
	if (checkedLength > 0 && checkedLength < 4) {
		//alert("가능");
		return true;
	} else {
		alert("1~3개까지 선택가능합니다.");
	}
	return false;
}
</script>

<div class="container">
	<div class="row">
		<div class="col-lg-12">
		<h1 class="page-header">
			관심분야 <small>강사추천 받기위한 관심분야 설정</small>
		</h1>
		<div class="col-lg-12 body" align="center">
			<form
				action="${pageContext.request.contextPath}/insertUserField.do"
				onsubmit="return countChecking();">
				<c:forEach items="${flist}" var="flist">
					<input type="checkbox" id="${flist}" name="field" value="${flist}" />
					<label for="${flist}"><span></span>${flist}</label>
				</c:forEach>
				&nbsp;&nbsp;&nbsp;
				<input type="hidden" id="mvoIstrainer" name="istrainer" value="${mvo.istrainer}"> 
				<input type="hidden" id="mvoId" name="mvoId" value="${mvo.id}"> 
				<input type="submit" value="저장하기">
			</form>
		</div>
		</div>
	</div>
	<br>
	<c:if test="${trainerList!=null}">
	<div id="trainerArea">
	<c:forEach items="${trainerList.LVO}" var="t">
		<!-- 강사 리스트  -->
		<div class="row">
			<div class="col-md-3 text-center">
				<img class="" src="${pageContext.request.contextPath}/resources/trainerPic/${t.tTrainerPhoto}" height="200px">
			</div>
			<div class="col-md-6">
				<h3>ID : ${t.id}</h3>
				<h4>NAME : ${t.tName}</h4>
				<h4>ADDRESS : ${t.tAddress}</h4>
				<form action="${pageContext.request.contextPath}/trainerDetail.do" method="post">
					<input type="hidden" value="${t.id}" name="trainerId">
					<input type="submit" value="강사정보 더보기">
				</form>
			</div>
			<div class="col-md-3">
				<c:if test="${t.pushCount==3}">
					<img src="${pageContext.request.contextPath}/resources/img/field/100퍼센트.PNG">
				</c:if>
				<c:if test="${t.pushCount==2}">
					<img src="${pageContext.request.contextPath}/resources/img/field/60퍼센트.PNG">
				</c:if>
				<c:if test="${t.pushCount==1}">
					<img src="${pageContext.request.contextPath}/resources/img/field/30퍼센트.PNG">
				</c:if>
			</div>
		</div>
		<hr>
	</c:forEach>
	</div>
	</c:if>
</div>