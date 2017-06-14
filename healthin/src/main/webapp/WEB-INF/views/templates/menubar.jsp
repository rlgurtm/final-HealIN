<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<script>
	$(".dropdown-menu").mouseover(function(){
		$(this).parent('.dropdown').css({'backgroundColor':'white'});
		$(this).parent('.dropdown').children('a').css({'color':'#005e9e'});
	});
	$(".dropdown-menu").mouseout(function(){
	    $(this).parent('.dropdown').removeAttr('style');
	    $(this).parent('.dropdown').children('a').removeAttr('style');
	  });
	
	/* 스크롤을 내리면서 navbar가 상단에 고정 */
	$(function() {
		var lastScroll = 0;
		$(window).scroll(function(event) {
			var st = $(this).scrollTop();

			if (st > lastScroll) {
				if (st > 140)
					$("#mainnav").addClass("navbar-fixed-top");
			} else {
				if (st < 140)
					$("#mainnav").removeClass("navbar-fixed-top");
			}
			lastScroll = st;
		});
	});
</script>
<!-- Navigation -->
    <nav class="navbar navbar-inverse" id="mainnav" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${pageContext.request.contextPath}/home.do">Home</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                	<li class="dropdown" >
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">PT 강사 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="${pageContext.request.contextPath}/filterVideoList.do?filter=no">PT 강사 동영상</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/trainerList.do">PT 강사진</a>
                            </li>
                            <li>
                                <a href="#">PT 강사 추천 받기</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/tip/tip.do">나만의 Tip</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/pt_qna/qna.do">PT 강사에게 묻는다!</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/board/faq.do">FAQ</a>
                    </li>
                    <!-- 	세션이 없는 경우 My Page는 나타나지 않음
                    		일반 회원인 경우와 PT 강사의 경우 My Page가 다르게 나타남
                     -->
                    <c:if test="${sessionScope.mvo != null }">
                    	<c:choose>
                    		<%-- <c:when test="${sessionScope.mvo.istrainer == 'admin' }">
	                    		<li class="dropdown">
		                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Admin Page <b class="caret"></b></a>
		                        <ul class="dropdown-menu">
		                            <li>
		                                <a href="${pageContext.request.contextPath}/adminAuthority.do">관리자페이지</a>
		                            </li>
		                        </ul>
		                    	</li>
                    		</c:when> --%>
                    		<c:when test="${sessionScope.mvo.istrainer == 'trainer' }">
                    			<li class="dropdown">
			                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Trainer Page <b class="caret"></b></a>
			                        <ul class="dropdown-menu">
			                            <li>
			                                <a href="${pageContext.request.contextPath}/followerList.do">Following</a>
			                            </li>
			                            <li>
			                                <a href="${pageContext.request.contextPath}/trainerPtList.do">Matching</a>
			                            </li>
			                            <li>
			                                <a href="${pageContext.request.contextPath}/mentoringList.do">Mentoring</a>
			                            </li>
			                            <li>
			                                <a href="${pageContext.request.contextPath}/paymentList.do">Payment Status</a>
			                            </li>
			                        </ul>
			                    </li>
                    		</c:when>
                    		<c:when test="${sessionScope.mvo.istrainer == 'user' }">
                    			<li class="dropdown">
			                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">User Page <b class="caret"></b></a>
			                        <ul class="dropdown-menu">
			                            <li>
			                                <a href="${pageContext.request.contextPath}/userCalendar.do">Health 캘린더</a>
			                            </li>
			                            <li>
			                                <a href="${pageContext.request.contextPath}/userHealthCheck.do">기간별 칼로리 체크</a>
			                            </li>
			                            <li>
			                                <a href="${pageContext.request.contextPath}/bmi_list.do">비만도 측정(BMI)</a>
			                            </li>
			                            <li>
			                                <a href="${pageContext.request.contextPath}/userfollowingList.do">Following</a>
			                            </li>
			                            <li>
			                                <a href="${pageContext.request.contextPath}/userPtList.do">Matching</a>
			                            </li>
			                            <li>
			                                <a href="${pageContext.request.contextPath}/mentoringList.do">Mentoring</a>
			                            </li>
			                            <li>
			                                <a href="${pageContext.request.contextPath}/paymentList.do">Payment Status</a>
			                            </li>
			                        </ul>
			                    </li>
                    		</c:when>
                    	</c:choose>
                    </c:if>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

   