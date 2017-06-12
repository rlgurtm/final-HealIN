<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	/* 테이블에서 제목의 길이가 길어지는 경우 테이블 깨짐 방지 */
	.title {	
		width:100%;
	    overflow: hidden; white-space: nowrap;
	    text-overflow: ellipsis;
	    -o-text-overflow: ellipsis;
	    -ms-text-overflow: ellipsis;
	}
	#test {
		background-color: f5f5f5;
	}
</style>
<script>
  	$(document).ready(function(){
    	$(".menu").click(function(){
        	$(".active").removeClass("active");
        	$(this).addClass("active");
        });
    	//동영상 부분
  		$(".regular").slick({
	        dots: true,
	        infinite: true,
	        slidesToShow: 4,
	        slidesToScroll: 3
		});
  		 //트레이너 부분
   		$('.slider-for').slick({
  		  slidesToShow: 1,
  		  slidesToScroll: 1,
  		  arrows: false,
  		  fade: true,
  		  asNavFor: '.slider-nav'
  		});
  		$('.slider-nav').slick({
  		  slidesToShow: 5,
  		  slidesToScroll: 1,
  		  asNavFor: '.slider-for',
  		  dots: true,
  		  centerMode: true,
  		  focusOnSelect: true
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
		<c:set value="${requestScope.allContentList.tipBoardList}" var="tipBoardList"/>
		<c:set value="${requestScope.allContentList.qnaBoardList}" var="qnaBoardList"/>
		<c:set value="${requestScope.allContentList.videoList}" var="videoList"/>
		<c:set value="${requestScope.allContentList.trainerList}" var="trainerList"/>
    	<!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">Tip and QnA Board
                    <small>Ask Whatever</small>
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
                    	<table class="table table-condensed" style="TABLE-layout:fixed">
                    		<tr id="tableHead" style='font-weight:bold;' align="center">
                    			<td style="width:70%;">제목</td>
                    			<td style="width:10%;">작성자</td>
                    			<td style="width:20%;">작성일</td>
                    		</tr>
                   			<c:if test="${!empty tipBoardList }">
                   				<c:forEach items="${tipBoardList.LVO}" var="tip">
                   					<tr>
                   						<c:choose>
											<c:when test="${sessionScope.mvo.id != null}">
												<td class="title"><a href="${pageContext.request.contextPath}/tip/tip_content.do?no=${tip.no}">${tip.title}  [${tip.commentCount}]</a></td>
		                    				</c:when>
		                    				<c:otherwise>
		                    					<td class="title">${tip.title} [${tip.commentCount}]</td>
		                    				</c:otherwise>
		                    			</c:choose>
		                    			<td align="center">${tip.memberVO.name}</td>
		                   				<td align="center">${tip.postedDate}</td>
                   					</tr>
                   				</c:forEach>
                   			</c:if>
                    	</table>
                    	<div align="center">
                    		<a href="${pageContext.request.contextPath}/tip/tip.do" class="btn btn-default">View More</a>
                    	</div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i> PT 강사에게 묻는다!</h4>
                    </div>
                    <div class="panel-body">
                       <table class="table table-condensed" style="TABLE-layout:fixed">
                    		<tr id="tableHead" style='font-weight:bold;' align="center">
                    			<td style="width:70%;">제목</td>
                    			<td style="width:10%;">작성자</td>
                    			<td style="width:20%;">작성일</td>
                    		</tr>
                   			<c:if test="${!empty qnaBoardList }">
                   				<c:forEach items="${qnaBoardList.LVO}" var="qna">
                   					<tr>
                   						<c:choose>
                   							<c:when test="${sessionScope.mvo.id != null}">
                   								<td class="title"><a href="${pageContext.request.contextPath}/pt_qna/pt_qna_content.do?no=${qna.no}">${qna.title}  [${qna.commentCount}]</a></td>
                   							</c:when>
                   							<c:otherwise>
                   								<td  class="title">${qna.title} [${qna.commentCount}]</td>
                   							</c:otherwise>
                   						</c:choose>
                   						<td align="center">${qna.memberVO.name}</td>
                   						<td align="center">${qna.postedDate}</td>
                   					</tr>
                   				</c:forEach>
                   			</c:if>
                    	</table>
                        <div align="center">
                    		<a href="${pageContext.request.contextPath}/pt_qna/qna.do" class="btn btn-default">View More</a>
                    	</div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.row -->
        
        <br><br><br>
        
<!-- 강사진 보기 section -->
        <div class="row" >
            <div class="col-lg-12">
                <div class="col-lg-12" align="left">
	                <h2 class="page-header">PT Trainer
	                    <small>popular trainer</small>
	                </h2>
	            <div class="slider-for">
	            	<c:forEach items="${trainerList.LVO}" var="trainer">
	            	<div style="height: 410px" align="right">
	            		<div class="col-lg-7">
	            		<a href="${pageContext.request.contextPath}/trainer/trainerDetail.do?trainerId=${trainer.membervo.id}">
	            		<img src="${pageContext.request.contextPath}/resources/trainerPic/${trainer.trainerPhoto}" height="400px">
						</a>
						</div>
						<div class="col-lg-4" align="left">
						<table class="table">
						<tr>
							<th>ID</th><td>${trainer.membervo.id}</td>
						</tr>
						<tr>
							<th>이름</th><td>${trainer.membervo.name}</td>
						</tr>
						<tr>
							<th>지역</th><td>${trainer.location}</td>
						</tr>
						<tr>
							<th>경력</th><td>${trainer.career}</td>
						</tr>
						</table>
						</div>
	            	</div>
					</c:forEach>
	            </div>
	            <div class="slider-nav" class="col-lg-12">
	            	<c:forEach items="${trainerList.LVO}" var="trainer">
	            	<div style="width: 100px; height: 100px">
	            		<img src="${pageContext.request.contextPath}/resources/trainerPic/${trainer.trainerPhoto}" height="100px">
	            	</div>
					</c:forEach>
	            </div>
	            </div>
            </div>
        </div>
        <!-- /.row -->
        
        <br><br><br>
        
        <!-- 인기 동영상 section -->
        <div class="row" >
            <div class="col-lg-12">
                <div class="col-lg-12">
	                <h2 class="page-header">Video
	                    <small>popular video</small>
	                </h2>
				<section class="regular slider">
					<c:forEach items="${videoList.LVO}" var="lvo">
						<div class="videoList" align="center">
						<div>
							<a href="${pageContext.request.contextPath}/trainerVideoShow.do?videoNo=${lvo.videoNo}#loca">
							<video width="250" height="180">
								<source
									src="${pageContext.request.contextPath}/resources/video/${lvo.videoFile}"
										type="video/mp4">
								</video>
							</a>
							<!-- <div style="background:#F2F2F2"> -->
							<h3>
								<a>${lvo.title}</a>
							</h3>
							작성자 : ${lvo.trainerId}<br>
							추천 : ${lvo.likeState}<br> 
							분류 : ${lvo.category}<br>
							조회수 : ${lvo.hits}<br> 
							등록일 : ${lvo.postedDate}<br>
							<%-- ${lvo.content} --%><br>
							<!-- </div> -->
						</div>
						</div>
					</c:forEach>
				</section>
	            </div>
            </div>
        </div>
        <!-- /.row -->
        
        <br><br><br>
		
	</div>
    <!-- /.container -->




