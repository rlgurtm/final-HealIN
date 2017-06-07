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
                                <a href="${pageContext.request.contextPath}/trainer/trainerList.do">PT 강사진</a>
                            </li>
                            <li>
                                <a href="portfolio-3-col.html">PT 강사 추천 받기</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/tip/tip.do">나만의 Tip</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/pt_qna/qna.do">PT 강사에게 묻는다!</a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">이용안내 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="member/login_form.do">이용안내_로그인(임시)</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/board/faq.do">FAQ</a>
                            </li>
                            <li>
                                <a href="#">QnA</a>
                            </li>
                        </ul>
                    </li>
                    <!-- 	세션이 없는 경우 My Page는 나타나지 않음
                    		일반 회원인 경우와 PT 강사의 경우 My Page가 다르게 나타남
                     -->
                    <c:if test="${sessionScope.mvo != null }">
                    	<c:choose>
                    		<c:when test="${sessionScope.mvo.istrainer == 'trainer' }">
                    			<li class="dropdown">
			                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">My Page <b class="caret"></b></a>
			                        <ul class="dropdown-menu">
			                            <li>
			                                <a href="${pageContext.request.contextPath}/trainer/followingList.do">Following List</a>
			                            </li>
			                            <li>
			                                <a href="${pageContext.request.contextPath}/ptList.do?id=${mvo.id}">PT List</a>
			                            </li>
			                            <li>
			                                <a href="#">나의 PT 회원</a>
			                            </li>
			                        </ul>
			                    </li>
                    		</c:when>
                    		<c:when test="${sessionScope.mvo.istrainer == 'user' }">
                    			<li class="dropdown">
			                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">My Page <b class="caret"></b></a>
			                        <ul class="dropdown-menu">
			                            <li>
			                                <a href="${pageContext.request.contextPath}/userCalendar.do">캘린더(이름 임시)</a>
			                            </li>
			                            <li>
			                                <a href="${pageContext.request.contextPath}/user_health_check.do">기간별 건강 변화 체크(이름 임시)</a>
			                            </li>
			                            <li>
			                                <a href="${pageContext.request.contextPath}/mypage/bmi_list.do">비만도 측정(기능 임시)</a>
			                            </li>
			                            <li>
			                            	<a href="${pageContext.request.contextPath}/mypage/graph.do">그래프 보기(기능 임시)</a>
			                            </li>
			                            <li>
			                                <a href="#">팔로우 한 강사(이름 임시)</a>
			                            </li>
			                            <li>
			                                <a href="#">팔로우 한 강사 동영상(이름 임시)</a>
			                            </li>
			                            <li>
			                                <a href="#">PT 결제 현황(이름 임시)</a>
			                            </li>
			                            <li>
			                                <a href="#">나의 PT 강사(이름 임시)</a>
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

    <%-- <!-- Header Carousel -->
    <header id="myCarousel" class="carousel slide">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <!-- <li data-target="#myCarousel" data-slide-to="2"></li> -->
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <div class="item active">
                <div class="fill" style="background-image:url('${pageContext.request.contextPath}/resources/img/헬스장.jpg');"></div>
                <div class="carousel-caption">
                    <h2>Caption 1</h2>
                </div>
            </div>
            <div class="item">
                <div class="fill" style="background-image:url('${pageContext.request.contextPath}/resources/img/헬스장2.jpg');"></div>
                <div class="carousel-caption">
                    <h2>Caption 2</h2>
                </div>
            </div>
            <div class="item">
                <div class="fill" style="background-image:url('${pageContext.request.contextPath}/resources/img/자전거.jpg');"></div>
                <div class="carousel-caption">
                    <h2>Caption 3</h2>
                </div>
            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="icon-prev"></span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="icon-next"></span>
        </a>
    </header> --%>