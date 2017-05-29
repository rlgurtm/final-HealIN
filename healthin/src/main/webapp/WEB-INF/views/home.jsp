<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
  	$(document).ready(function(){
    	$(".menu").click(function(){
        	$(".active").removeClass("active");
        	$(this).addClass("active");
        });
    });
</script>

    <!-- Header Carousel -->
    <div id="myCarousel" class="carousel slide " data-ride="carousel">
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
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="icon-prev"></span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="icon-next"></span>
        </a>
    </div>
    
    <br><br><br>
    
	<!-- Page Content -->
    <div class="container">
		<!-- 메인화면에 출력될 부분 별칭 지정 -->
		<c:set value="${requestScope.allContentList.tip}" var="tipList"/>
		<c:set value="${requestScope.allContentList.qna}" var="qnaList"/>
		<c:set value="${requestScope.allContentList.videoList}" var="videoList"/>
		<c:set value="${requestScope.allContentList.trainerList}" var="trainerList"/>
    	<!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">Tip and QnA Board
                    <small>Ask Anything</small>
                </h2>
            </div>
        </div>
        <!-- /.row -->
        <!-- Marketing Icons Section -->
        <div class="row">
            <div class="col-md-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i> 나만의 Tip </h4>
                    </div>
                    <div class="panel-body">
                    	<!-- 
                    			나중에 ajax로 처리 예정 
                    	-->
                    	<ul class="nav nav-tabs">
							<li class="menu active"><a href="#">전체</a></li>
							<li class="menu"><a href="#">운동</a></li>
							<li class="menu"><a href="#">다이어트</a></li>
							<li class="menu"><a href="#">식단</a></li>
						</ul>
                    	<table class="table table-condensed">
                    		<thead>
	                    		<tr>
	                    			<th>제목</th><th>작성자</th><th>작성일</th>
	                    		</tr>
                    		</thead>
                    		<tbody>
                    			<c:if test="${!empty tipList }">
                    				<c:forEach items="${tipList}" var="tip" begin="0" end="9">
                    					<tr>
                    						<td>${tip.title}</td>
                    						<td>${tip.memberVO.name}</td>
                    						<td>${tip.postedDate}</td>
                    					</tr>
                    				</c:forEach>
                    			</c:if>
                    		</tbody>
                    	</table>
                    	<div align="center">
                    		<a href="#" class="btn btn-default">Go to board</a>
                    	</div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-gift"></i> PT 강사에게 묻는다</h4>
                    </div>
                    <div class="panel-body">
                   		<!-- 
                    			나중에 ajax로 처리 예정 
                    	-->
                    	<ul class="nav nav-tabs">
							<li class="menu active"><a href="#">전체</a></li>
							<li class="menu"><a href="#">운동</a></li>
							<li class="menu"><a href="#">다이어트</a></li>
							<li class="menu"><a href="#">식단</a></li>
						</ul>
                       <table class="table table-condensed">
                    		<thead>
	                    		<tr>
	                    			<th>제목</th><th>작성자</th><th>작성일</th>
	                    		</tr>
                    		</thead>
                    		<tbody>
                    			<c:if test="${!empty tipList }">
                    				<c:forEach items="${tipList}" var="tip" begin="0" end="9">
                    					<tr>
                    						<td>${tip.title}</td>
                    						<td>${tip.memberVO.name}</td>
                    						<td>${tip.postedDate}</td>
                    					</tr>
                    				</c:forEach>
                    			</c:if>
                    		</tbody>
                    	</table>
                        <div align="center">
                    		<a href="#" class="btn btn-default">Go to board</a>
                    	</div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.row -->
        
        <br><br><br>

        <!-- 강사진 보기 Section -->
        <div class="row">
            <div class="col-lg-12">
            	<div class="col-lg-12">
	                <h2 class="page-header">PT Trainer
	                    <small>popular trainer</small>
	                </h2>
	            </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <a href="portfolio-item.html">
                    <img class="img-responsive img-portfolio img-hover" src="${pageContext.request.contextPath}/resources/img/트레이너1.jpg" alt="">
                </a>
            </div>
            <div class="col-md-4 col-sm-6">
                <a href="portfolio-item.html">
                    <img class="img-responsive img-portfolio img-hover" src="${pageContext.request.contextPath}/resources/img/트레이너1.jpg" alt="">
                </a>
            </div>
            <div class="col-md-4 col-sm-6">
                <a href="portfolio-item.html">
                    <img class="img-responsive img-portfolio img-hover" src="${pageContext.request.contextPath}/resources/img/트레이너1.jpg" alt="">
                </a>
            </div>
            <div class="col-md-4 col-sm-6">
                <a href="portfolio-item.html">
                    <img class="img-responsive img-portfolio img-hover" src="${pageContext.request.contextPath}/resources/img/트레이너1.jpg" alt="">
                </a>
            </div>
            <div class="col-md-4 col-sm-6">
                <a href="portfolio-item.html">
                    <img class="img-responsive img-portfolio img-hover" src="${pageContext.request.contextPath}/resources/img/트레이너1.jpg" alt="">
                </a>
            </div>
            <div class="col-md-4 col-sm-6">
                <a href="portfolio-item.html">
                    <img class="img-responsive img-portfolio img-hover" src="${pageContext.request.contextPath}/resources/img/트레이너1.jpg" alt="">
                </a>
            </div>
        </div>
        <!-- /.row -->
        
        <br><br><br>
        
        <!-- 인기 동영상 section -->
        <div class="row">
            <div class="col-lg-12">
                <div class="col-lg-12">
	                <h2 class="page-header">Video
	                    <small>popular video</small>
	                </h2>
	            </div>
            </div>
            
          	 <c:forEach items="${videoList.LVO}" var="video" begin="0" end="7">
	          	 <div class="col-md-3 col-sm-6">
	          		<a
					href="${pageContext.request.contextPath}/trainerVideoShow.do?videoNo=${video.videoNo}#loca">
					<video width="250" height="185">		<!-- 280,210 -->
						<source
							src="${pageContext.request.contextPath}/resources/video/${video.videoFile}"
							type="video/mp4">
					</video>
					</a>
					<h3>${video.title}</h3>
					<p>작성자 : ${video.hits}</p>
					<p>${video.content}</p>
	          	 </div>
          	 </c:forEach>
        </div>
        <!-- /.row -->
        
        <br><br><br>
		
        <!-- Features Section -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">Modern Business Features</h2>
            </div>
            <div class="col-md-6">
                <p>The Modern Business template by Start Bootstrap includes:</p>
                <ul>
                    <li><strong>Bootstrap v3.3.7</strong>
                    </li>
                    <li>jQuery v1.11.1</li>
                    <li>Font Awesome v4.2.0</li>
                    <li>Working PHP contact form with validation</li>
                    <li>Unstyled page elements for easy customization</li>
                    <li>17 HTML pages</li>
                </ul>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis, omnis doloremque non cum id reprehenderit, quisquam totam aspernatur tempora minima unde aliquid ea culpa sunt. Reiciendis quia dolorum ducimus unde.</p>
            </div>
            <div class="col-md-6">
                <img class="img-responsive" src="http://placehold.it/700x450" alt="">
            </div>
        </div>
        <!-- /.row -->

        <hr>

        <!-- Call to Action Section -->
        <div class="well">
            <div class="row">
                <div class="col-md-8">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias, expedita, saepe, vero rerum deleniti beatae veniam harum neque nemo praesentium cum alias asperiores commodi.</p>
                </div>
                <div class="col-md-4">
                    <a class="btn btn-lg btn-default btn-block" href="#">Call to Action</a>
                </div>
            </div>
        </div>
	</div>
    <!-- /.container -->




