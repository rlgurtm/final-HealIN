<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		type:"get",
		url:"${pageContext.request.contextPath}/selectfollowstate.do",
		data:"memId=${mvo.id}&trainerId="+$("#trainerId").val(),
		success:function(data){
			if(data=='Y')
				$("#imgtd").html("<img class='img-responsive heartimg' src='${pageContext.request.contextPath}/resources/img/heart-red.png' width='50'>");
			else
				$("#imgtd").html("<img class='img-responsive heartimg' src='${pageContext.request.contextPath}/resources/img/heart-gray.png' width='50'>");
	
		}
	}); //ajax
	$("#imgtd").click(function(){
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/updatefollowState.do",
				data: "trainerId="+$("#trainerId").val(),
				success:function(data){
					if(data=='Y')
						$("#imgtd").html("<img class='img-responsive heartimg' src='${pageContext.request.contextPath}/resources/img/heart-red.png' width='50'>");
					else
						$("#imgtd").html("<img class='img-responsive heartimg' src='${pageContext.request.contextPath}/resources/img/heart-gray.png' width='50'>");
				}//function
			});//ajax
		});//click
	});//ready
	
</script>
<div class="container">

	<!-- Page Heading/Breadcrumbs -->
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				강사 상세보기
			</h1>
			
		</div>
	</div>
	<!-- /.row -->

	<!-- Intro Content -->
	<div class="row">
		<div class="col-md-6">
			<img class="img-responsive" src="${pageContext.request.contextPath}/resources/trainerPic/${tvo.trainerPhoto}" width="750"  height="450">
		</div>
		<div class="col-md-6">
		<table >
			<tr>
			<td><h2>이름 : </h2></td><td><h2>${tvo.membervo.name}</h2></td>
			</tr>
			<tr>
			<td><h4>전화번호 : </h4></td><td><h4>${tvo.membervo.tel}</h4></td>
			</tr>
			<tr>
			<td><h4>메일 : </h4></td><td><h4>${tvo.membervo.email}</h4></td>
			</tr>
			<tr>
			<td><h4>지역 : </h4></td><td><h4>${tvo.location}</h4></td>
			</tr>
			<tr>
			<td><h4>경력사항 : </h4></td><td><h4>${tvo.career}</h4></td>
			</tr>
			
			<tr>
			<th>팔로잉</th>
			<td id="imgtd"></td>
			</tr>
			<tr>
			<th colspan="2">팔로워 :  ${tvo.count}</th></tr>
			
		</table><br>
			<div class="container">
				<table  class="table table-bordered">
					<thead>
						<tr>
							<th>기간</th>
							<th>가격</th>
							<th>강사명</th>
							<th>수락</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
							<select>
								<option value="">기간</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select>
							</td>
							<td>월 만원</td>
							<td>healthboy</td>
							<td>
								<input type="submit" value="신청">
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
<input type="hidden" id="trainerId" value="${tvo.membervo.id}">
	
<br><br>	

	<!-- Team Members -->
	<div class="row">
		<div class="col-lg-12">
			<h2 class="page-header">강사님의 동영상</h2>
		</div>
		<c:forEach items="${listVO.LVO}" var="lvo">
		<div class="col-md-4 text-center">
			<div class="thumbnail">
				<!-- <img class="img-responsive" src="http://placehold.it/750x450" alt=""> -->
				<div class="caption">
					<a href="${pageContext.request.contextPath}/trainerVideoShow.do?videoNo=${lvo.videoNo}#loca">
						<video width="270" height="200">
							<source
								src="${pageContext.request.contextPath}/resources/video/${lvo.videoFile}"
								type="video/mp4">
						</video>
					</a>
					<h3>
						${lvo.title}<br> <small></small>
					</h3>
					<p>
					작성자 : ${lvo.trainerId}<br>
					추천 : ${lvo.likeState}<br> 
					분류 : ${lvo.category}<br>
					조회수 : ${lvo.hits}<br> 
					등록일 : ${lvo.postedDate}<br>
					${lvo.content}<br>
					</p>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>
</div>