<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <!-- Page Heading/Breadcrumbs -->
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">My Page
                    <small>My Page</small>
                </h1>
            </div>
        </div>
        <!-- /.row -->
		
		<c:choose>
			<c:when test="${sessionScope.mvo.istrainer == 'user' }">
				<ul class="nav nav-tabs">
					<li class="menu active"><a href="${pageContext.request.contextPath}/mypage/user_calendar.do">캘린더</a></li>
					<li class="menu"><a href="${pageContext.request.contextPath}/mypage/user_health_check.do">기간 별 건강 변화 체크</a></li>
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
		<br><br><h2>PT강사 팔로워 관리</h2>
	</div>
