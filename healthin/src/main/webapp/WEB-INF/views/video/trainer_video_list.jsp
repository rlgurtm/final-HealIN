<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="http://vjs.zencdn.net/c/video-js.css" rel="stylesheet" />
<script src="http://vjs.zencdn.net/c/video.js"></script>
<link rel="stylesheet"
	href="https://unpkg.com/purecss@0.6.2/build/pure-min.css"
	integrity="sha384-UQiGfs9ICog+LwheBSRCt1o5cbyKIHbwjWscjemyBMT9YCUMZffs6UqUTd0hObXD"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(document).ready(function() {
		$("#filterToggle").click(function() {
			$("#showFilter").toggle("fast");
			$("#showFilter1").toggle("fast");
			$("#showFilter2").toggle("fast");
			$("#showFilter3").toggle("fast");
			$("#showFilter4").toggle("fast");
		});
		/* $("#trainerNameKeyword").keyup(function(){
			var trainerNameKeyword = $("#trainerNameKeyword").val();
			// alert(trainerNameKeyword);
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/trainerNameKeywordSelect.do",
				data: "trainerNameKeyword="+trainerNameKeyword,
				dataType:"json",
				success:function(data){
					var trainerList = "";
					for(var i=0; i < data.length; i++){
						trainerList = trainerList+"<li>"+data[i]+"</li>";
					}
					document.getElementById("trainerNameList").innerHTML
					=trainerList;
				}//function
			});//ajax 
		}); */
	});
	//$("#trainerNameKeyword").keyup(function(){
	$(function(){
		$("#trainerNameKeyword").autocomplete({
			source : function(request, response) {
				$.ajax({
					type : 'post',
					url : "${pageContext.request.contextPath}/trainerNameKeywordSelect.do",
					dataType : "json",
					data : {
						keyword : request.term
					},
					success : function(data) {
						//서버에서 json 데이터 response 후 목록에 뿌려주기 위함
						var trainerNameAutoCompleteList = [];
                        var temp = JSON.parse(JSON.stringify(data));

                         for (var i = 0; i < temp.length; i++) {
                        	 trainerNameAutoCompleteList.push(temp[i]);
                         }
						return response(trainerNameAutoCompleteList);		
					}
				});
			}
		});
	});
</script>
<div class="container">
	<!-- Page Heading/Breadcrumbs -->
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				Trainer Video <small></small>
			</h1>
			<div class="col-lg-2" align="center">
				<ol class="breadcrumb">
					<li id="filterToggle"><a class="btn"><strong>FILTER</strong></a></li>
				</ol>
			</div>
			<div class="col-lg-10" align="center">
				<ol id="showFilter" style="display: none" class="breadcrumb">
					<li class="active"></li>
					<li><a class="btn"
						href="${pageContext.request.contextPath}/filterVideoList.do?filter=hits">
							<strong>조회수순</strong>
					</a></li>
					<li><a class="btn"
						href="${pageContext.request.contextPath}/filterVideoList.do?filter=likeState">
							<strong>추천순</strong>
					</a></li>
					<li><a class="btn"
						href="${pageContext.request.contextPath}/filterVideoList.do?filter=postedDate">
							<strong>최신순</strong>
					</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"><strong>공개범위별</strong><b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a class="btn"
								href="${pageContext.request.contextPath}/filterVideoList.do?filter=openrank&rank=0">
									<strong>전체공개</strong>
							</a></li>
							<li><a class="btn"
								href="${pageContext.request.contextPath}/filterVideoList.do?filter=openrank&rank=1">
									<strong>회원공개</strong>
							</a></li>
							<li><a class="btn"
								href="${pageContext.request.contextPath}/filterVideoList.do?filter=openrank&rank=2">
									<strong>팔로잉회원공개</strong>
							</a></li>
							<li><a class="btn"
								href="${pageContext.request.contextPath}/filterVideoList.do?filter=openrank&rank=3">
									<strong>PT회원공개</strong>
							</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"><strong>운동부위별</strong><b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a class="btn"
								href="${pageContext.request.contextPath}/filterVideoList.do?filter=category&cate=어깨">
									<strong>어깨</strong>
							</a></li>
							<li><a class="btn"
								href="${pageContext.request.contextPath}/filterVideoList.do?filter=category&cate=팔">
									<strong>팔</strong>
							</a></li>
							<li><a class="btn"
								href="${pageContext.request.contextPath}/filterVideoList.do?filter=category&cate=등">
									<strong>등</strong>
							</a></li>
							<li><a class="btn"
								href="${pageContext.request.contextPath}/filterVideoList.do?filter=category&cate=가슴">
									<strong>가슴</strong>
							</a></li>
							<li><a class="btn"
								href="${pageContext.request.contextPath}/filterVideoList.do?filter=category&cate=하체">
									<strong>하체</strong>
							</a></li>
							<li><a class="btn"
								href="${pageContext.request.contextPath}/filterVideoList.do?filter=category&cate=유산소and코어">
									<strong>유산소&코어</strong>
							</a></li>
						</ul></li>
					<li class="active"></li>
				</ol>
			</div>
		</div>
	</div>
	<!-- /.row -->
	<%-- ${listVO} --%>

	<!-- Projects Row -->
	<div class="row">
		<c:forEach items="${listVO.LVO}" var="lvo">
			<div class="col-md-3 img-portfolio">
				<div class="videoList">
					<a href="${pageContext.request.contextPath}/trainerVideoShow.do?videoNo=${lvo.videoNo}#loca">
						<video width="270" height="200">
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
					${lvo.content}<br>
					<!-- </div> -->
				</div>
			</div>
		</c:forEach>
	</div>

	<hr>
	<div class="col-lg-12" align="right">
		<form class="pure-form" method="post" action="${pageContext.request.contextPath}/filterVideoList.do?filter=findByTrainerId">
			<h4>PT 강사별 조회</h4>
			<input name="trainerId" id="trainerNameKeyword" type="text" class="pure-input-rounded">
			<button type="submit" class="pure-button">Search</button>
		</form>
	</div>

	<!-- Pagination -->
	<div class="row text-center">
		<div class="col-lg-12">
			<ul class="pagination">
				<c:choose>
					<c:when test="${listVO.pb.previousPageGroup}">
						<li><a
							href="${ pageContext.request.contextPath }/filterVideoList.do?filter=${filter}&nowPage=${listVO.pb.startPageOfPageGroup-1}">&laquo;</a></li>
					</c:when>
				</c:choose>
				<li class="active"><c:forEach var="pg"
						begin="${listVO.pb.startPageOfPageGroup}"
						end="${listVO.pb.endPageOfPageGroup}">
						<li><a
							href="${ pageContext.request.contextPath }/filterVideoList.do?filter=${filter}&nowPage=${ pg }">${ pg }</a></li>
					</c:forEach>
				<li class="active"><c:choose>
						<c:when test="${listVO.pb.nextPageGroup}">
							<li><a
								href="${ pageContext.request.contextPath }/filterVideoList.do?filter=${filter}&nowPage=${listVO.pb.endPageOfPageGroup+1}">&raquo;</a></li>
						</c:when>
					</c:choose>
			</ul>
		</div>
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12" align="center">
			<ol class="breadcrumb">
				<li class="active"></li>
				<li><a
					href="${pageContext.request.contextPath}/filterVideoList.do?filter=no"
					class="btn"> <strong>List</strong></a></li>
				<c:if test="${mvo.istrainer=='trainer'&&mvo.withdrawal=='N'&&tvo.rank>0}">
					<li><a
						href="${pageContext.request.contextPath}/trainerVideoWriteForm.do"
						class="btn"> <strong>Write</strong></a></li>
				</c:if>
				<li class="active"></li>
			</ol>
		</div>
	</div>
</div>
<br>
${tvo.rank}


