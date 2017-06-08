<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="http://vjs.zencdn.net/c/video-js.css" rel="stylesheet" />
<script src="http://vjs.zencdn.net/c/video.js"></script>
<!-- Bootstrap Core CSS -->
<!-- <link href="css/bootstrap.min.css" rel="stylesheet"> -->
<!-- Custom CSS -->
<!-- <link href="css/modern-business.css" rel="stylesheet"> -->
<!-- Custom Fonts -->
<!-- <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script>
	$(document).ready(function(){
		//alert("1");
		/* $(".container").animate({scrollTop : offset.top}, 400); */
		var videoNo = ${videoVO.videoNo};
		//alert(videoNo);
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/selectVideoLikeState.do",
			data: "videoNo="+videoNo,
			dataType:"json",
			success:function(data){
				if(data=="0"){
					document.getElementById("video_like").innerHTML="<img class='img-responsive' src='${pageContext.request.contextPath}/resources/img/heart-gray.png' width='50'>";
				} else if(data=="1"){
					document.getElementById("video_like").innerHTML="<img class='img-responsive' src='${pageContext.request.contextPath}/resources/img/heart-red.png' width='50'>";
				} 
			}//function
		});//ajax
		//alert("2");
		$("#video_like").click(function() {
			alert("클릭");
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/updateVideoLikeState.do",
				data: "videoNo="+videoNo,
				dataType:"json",
				success:function(data){
					if(data=="0"){
						document.getElementById("video_like").innerHTML="<img class='img-responsive' src='${pageContext.request.contextPath}/resources/img/heart-gray.png' width='50'>";
					} else if(data=="1"){
						document.getElementById("video_like").innerHTML="<img class='img-responsive' src='${pageContext.request.contextPath}/resources/img/heart-red.png' width='50'>";
					} 
				}//function
			});//ajax
		});
	});
</script>
<div class="container">
	<!-- Page Heading/Breadcrumbs -->
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				Trainer Video Show <small id="loca">${videoVO.trainerId}</small>
			</h1>
		</div>
	</div>
	<!-- /.row -->
	
	<!-- Portfolio Item Row -->
	<div class="row">

		<div class="col-md-8">
		
			<video width="680" height="510" controls="controls"
				autoplay="autoplay">
				<source
					src="${pageContext.request.contextPath}/resources/video/${videoVO.videoFile}"
					type="video/mp4">
			</video>
		</div>

		<div class="col-md-4">
			<h3>${videoVO.title}</h3>
			<hr>
			<p>${videoVO.content}</p>
			<hr>
			<h3>동영상 정보</h3>
			<ul>
				<li>조회수 : ${videoVO.hits}</li>
				<li>추천 : ${videoVO.likeState}</li>
				<li>작성자 : ${videoVO.trainerId}</li>
				<li>작성일자 : ${videoVO.postedDate}</li>
			</ul>
			<c:if test="${mvo!=null}">
				<div align="center">
				<hr>
				추천을 원하시면 눌러주세요~
				</div>
				<div id="video_like" align="center"></div>
			</c:if>
		</div>
	</div>
	<hr>
	${commentVO[0] }
	<!-- 댓글 -->
	<div class="well" style="width:80%; margin-left: auto; margin-right: auto; " >
		<c:choose>
			<c:when test="${commentVO[0]==null}">
				<div align="center">
					등록된 댓글이 없습니다.
				</div>
			</c:when>
			<c:otherwise>
				<div align="center" style="padding-bottom: 30px">
				<table style="width:90%;margin:20px;">
				<c:forEach items="${commentVO}" var="cvo">
					<tr>
					<th><i class="glyphicon glyphicon-user"></i>${cvo.videoCommentId}&nbsp;</th>
						<td align="right">${cvo.videoCommentDate}&nbsp;&nbsp;
						<c:if test="${cvo.videoCommentId==mvo.id}">
							<a href="${pageContext.request.contextPath}/">삭제
							<span class="glyphicon glyphicon-trash"></span></a>
						</c:if>
						</td>
					</tr>
					<tr>
						<td colspan="2"><pre>${cvo.videoComment}</pre></td>
					</tr>
				</c:forEach>
				</table>
				</div>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${mvo.id==null||mvo.id==''}">
				<div align="center">
				<h3>
					댓글작성은 로그인 하셔야 이용가능합니다.
				</h3>
				</div>
			</c:when>
			<c:otherwise>
				<div align="center">
				<form action="${pageContext.request.contextPath}/" method="post">
					<table style="width:90%;">
						<tr>
							<td colspan="2"><label>댓글</label></td>
						</tr>
						<tr>
							<td style="width:100%;">
							<textarea class="form-control"  rows="2" name="comment" required="required"></textarea>
							</td>
							<td align="left" style="padding: 5px;">
							<input type="hidden" name="videoNo" value="${videoVO.videoNo}">
							<input type="hidden" name="videoCommentId" value="${mvo.id}">
							<input type="submit" class="btn btn-lg" value="등록">
							</td>
						</tr>
					</table>
				</form>
				</div>
			</c:otherwise>
		</c:choose>
		
	</div>
	
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12" align="center">
			<ol class="breadcrumb">
				<li class="active"></li>
				<li><a href="${pageContext.request.contextPath}/filterVideoList.do?filter=no" class="btn">
				<strong>List</strong></a></li>
			<c:if test="${mvo.istrainer=='trainer'}">
				<li><a href="${pageContext.request.contextPath}/trainerVideoWriteForm.do" class="btn">
				<strong>Write</strong></a></li>
			</c:if>
			<c:if test="${mvo.id==videoVO.trainerId}">
				<li><a href="${pageContext.request.contextPath}/trainerVideoUpdateForm.do?videoNo=${videoVO.videoNo}" class="btn">
				<strong>Edit</strong></a></li>
				<li><a href="${pageContext.request.contextPath}/trainerVideoDelete.do?videoNo=${videoVO.videoNo}" class="btn">
				<strong>Delete</strong></a></li>
			</c:if>
				<li class="active"></li>
			</ol>
		</div>
	</div>
</div>








