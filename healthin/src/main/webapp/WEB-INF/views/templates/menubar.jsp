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
				if (st > 200)
					$("#mainnav").addClass("navbar-fixed-top");
			} else {
				if (st < 200)
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
                <a class="navbar-brand" href="${pageContext.request.contextPath }/home.do">Home</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-left">
                	<li class="dropdown" >
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">PT 강사 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="portfolio-1-col.html">PT 강사 동영상</a>
                            </li>
                            <li>
                                <a href="portfolio-2-col.html">PT 강사진</a>
                            </li>
                            <li>
                                <a href="portfolio-3-col.html">PT 강사 추천 받기</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="about.html">나만의 Tip</a>
                    </li>
                    <li>
                        <a href="services.html">PT 강사에게 묻는다!</a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">이용안내 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="member/login_form.do">이용안내_로그인(임시)</a>
                            </li>
                            <li>
                                <a href="blog-home-2.html">QnA</a>
                            </li>
                        </ul>
                    </li>
                    <!-- 	세션이 없는 경우 My Page는 나타나지 않음
                    		일반 회원인 경우와 PT 강사의 경우 My Page가 다르게 나타남
                     -->
                    <%-- <c:choose>
                    	<c:when test="${sessionScope. }">		<!-- 회원인 경우 -->
                    		<li class="dropdown">
		                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">My Page <b class="caret"></b></a>
		                        <ul class="dropdown-menu">
		                            <li>
		                                <a href="full-width.html">Full Width Page</a>
		                            </li>
		                            <li>
		                                <a href="sidebar.html">Sidebar Page</a>
		                            </li>
		                        </ul>
		                    </li>
                    	</c:when>	
                    	<c:when test="">		<!-- 강사인 경우 -->
                    		<li class="dropdown">
		                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">My Page <b class="caret"></b></a>
		                        <ul class="dropdown-menu">
		                            <li>
		                                <a href="full-width.html">Full Width Page</a>
		                            </li>
		                            <li>
		                                <a href="sidebar.html">Sidebar Page</a>
		                            </li>
		                        </ul>
		                    </li>
                    	</c:when>	
                    	<c:otherwise></c:otherwise>	<!-- 비로그인 상태인 경우 -->
                    </c:choose> --%>
                    
                    
                    <!-- 여기부분은 나중에 지울거임 -->
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">My Page <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="full-width.html">Full Width Page</a>
                            </li>
                            <li>
                                <a href="sidebar.html">Sidebar Page</a>
                            </li>
                        </ul>
                    </li>
                    
                    
                    
                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Header Carousel -->
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
            <%-- <div class="item">
                <div class="fill" style="background-image:url('${pageContext.request.contextPath}/resources/img/자전거.jpg');"></div>
                <div class="carousel-caption">
                    <h2>Caption 3</h2>
                </div>
            </div> --%>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="icon-prev"></span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="icon-next"></span>
        </a>
    </header>