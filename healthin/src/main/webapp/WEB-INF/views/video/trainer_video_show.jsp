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
					document.getElementById("video_like").innerHTML="<hr>안함";
				} else if(data=="1"){
					document.getElementById("video_like").innerHTML="<hr>좋아요";
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
						document.getElementById("video_like").innerHTML="<hr>안함";
					} else if(data=="1"){
						document.getElementById("video_like").innerHTML="<hr>좋아요";
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
			<p>${videoVO.content}</p>
			<h3>동영상 정보</h3>
			<ul>
				<li>조회수 : ${videoVO.hits}</li>
				<li>좋아요 : ${videoVO.likeState}</li>
				<li>작성자 : ${videoVO.trainerId}</li>
				<li>작성일자 : ${videoVO.postedDate}</li>
			</ul>
			<c:if test="${mvo!=null}">
				<div id="video_like">기본</div>
			</c:if>
		</div>
	</div>
	<hr>
	<!-- 댓글 -->
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				댓글부분<small></small>
			</h1>
			
		</div>
	</div>
	
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12" align="center">
			<ol class="breadcrumb">
				<li class="active"></li>
				<li><a href="${pageContext.request.contextPath}/trainerVideoList.do" class="btn">
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







