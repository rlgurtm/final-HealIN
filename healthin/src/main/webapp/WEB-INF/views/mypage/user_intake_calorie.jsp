<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	$(document).ready(function() {
		$("#backBtn").click(function() {
			location.href = "${pageContext.request.contextPath}/user_calendar.do";
		});
	});
</script>

    <!-- Page Heading/Breadcrumbs -->
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">My Page
                    <small>Intake Calorie &nbsp;&nbsp;&nbsp;<input type="button" id="backBtn" value="<< Back to Calendar"></small>
                </h1>
            </div>
        </div>
        <!-- /.row -->
		
		<c:choose>
			<c:when test="${sessionScope.mvo.istrainer == 'user' }">
				<ul class="nav nav-tabs">
					<li class="menu active"><a href="${pageContext.request.contextPath}/user_calendar.do">캘린더</a></li>
					<li class="menu"><a href="${pageContext.request.contextPath}/user_health_check.do">기간 별 건강 변화 체크</a></li>
					<li class="menu"><a href="#">비만도 측정</a></li>
					<li class="menu"><a href="#">팔로우 한 강사 </a></li>
					<li class="menu"><a href="#">팔로우 한 강사 동영상</a></li>
					<li class="menu"><a href="#">PT 결제 현황</a></li>
					<li class="menu"><a href="#">나의 PT 강사</a></li>
				</ul>
			</c:when>
			<c:when test="${sessionScope.mvo.istrainer == 'trainer' }">
				<ul class="nav nav-tabs">
					<li class="menu active"><a href="#">팔로워 관리</a></li>
					<li class="menu"><a href="#">PT 결제 현황</a></li>
					<li class="menu"><a href="#">나의 PT 회원</a></li>
				</ul>
			</c:when>
		</c:choose>
		
		<br><br>
		<div align="right"><h5>섭취한 음식 [${requestScope.date}]</h5></div>
		
		<table class="table table-hover">
			<tbody align="center">
				<tr class="info" style='font-weight:bold;'>
					<td>음식명</td><td>칼로리</td><td>수량</td><td>총 칼로리</td>
				</tr>
				<c:forEach items="${requestScope.foodList }" var="food">
					<tr>
						<td>${food.foodName}</td>
						<td>${food.calorie}</td>
						<td>${food.count}</td>
						<td>${food.totalCalorie}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div>
			총 먹은 양 : 
		</div>
			
		<hr>
		
		<!-- 먹은 음식 입력 -->
		<form>
			
		</form>
		
		<br><br><br>
	</div>
