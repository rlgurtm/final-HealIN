<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- <script>
	function getRatingList(page) {
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/getTrainerRating.do",
			data:"trainerId=${requestScope.trainerId}&pageNo="+page,
			dataType:"json",
			success:function(data){
				alert(data);
				var session="${mvo.id}";
		 	  	var info="";
				for(var i=0;i<data.lvo.length;i++){
					info+="<tr><td>"+data.lvo[i].no+"</td>";
					info+="<td>"+data.lvo[i].category+"</td><td>";
						if(session==null||session=="" ){
							info+=data.lvo[i].title;
							if(data.lvo[i].commentCount!="0")
							info+="("+data.lvo[i].commentCount+")";
						}else{
							info+="<a href='${pageContext.request.contextPath}/pt_qna/pt_qna_content.do?";
							info+="no="+data.lvo[i].no+"'>"+data.lvo[i].title+"</a>";
							if(data.lvo[i].commentCount!="0")
							info+="("+data.lvo[i].commentCount+")";
						} 
					
					info+="</td><td>"+data.lvo[i].memberVO.nickname+"</td>";
					info+="<td>"+data.lvo[i].postedDate+"</td>";
					info+="<td>"+data.lvo[i].hits+"</td></tr>";
				} 
				
				 $("#qnaBoardInfo").html(info); 
				 var pre=data.pb.startPageOfPageGroup-1;
				 var next=data.pb.endPageOfPageGroup+1; 
		 		 var paging="";
		 		 if(data.pb.previousPageGroup)
					 paging+="<li class='previous' value="+pre+"><a>previous</a><li>";
				 for(var k=data.pb.startPageOfPageGroup;k<=data.pb.endPageOfPageGroup;k++){
					 if(data.pb.nowPage==k){
						paging+="<li value="+k+" class='active'><a href='#'>"+k+"</a></li>";
					 }else{
						paging+="<li value="+k+"><a href='#'>"+k+"</a></li>";
					 }
				 }
				 if(data.pb.nextPageGroup)
					 paging+="<li class='next' value="+next+"><a>next</a><li>";
				 $(".pagination").html(paging);
				/* $("#reviewList").html("");
				if(data.list.length==0)
					$("#notExistReview").css("display","");
				$("#reviewList").append("<ul>");
				for(var i=0;i<data.list.length;i++){
					var innerHtml = "";
					innerHtml += "<div class='row'><div class='3u 12u(medium)'><br>";
					for(var j=0;j<data.list[i].star;j++)
						innerHtml += "<img style='width:30px' src='${pageContext.request.contextPath}/images/staron.png'> ";
					for(var j=data.list[i].star;j<5;j++)
						innerHtml += "<img style='width:30px' src='${pageContext.request.contextPath}/images/staroff.png'> ";
					innerHtml += "</div><div class='8u 12u(medium)'><ul><li>";
					innerHtml += "<a href=${pageContext.request.contextPath}/DispatcherServlet?command=mypage&id="+data.list[i].id+">"
					innerHtml += data.list[i].id+"</a> <br></li><li>"; // to do
					innerHtml += data.list[i].rvcontent+"<br></li><li>";
					innerHtml += data.list[i].rvdate+"</li><br></ul>";
					if(data.list[i].id == "${mvo.id}"){
						innerHtml += "</div><div id='deleteReview' style='float:right'><img style='width:20px;padding-top:20px;'"
						+" src='${pageContext.request.contextPath}/images/x.png'</div></div></li>";
					}
					$("#reviewList").append(innerHtml);					
				}
				$("#reviewList").append("</ul>");
				$("#reviewPaging").html("");
				var pb = data.pagingBean;
				if(pb.previousPageGroup ==true){
					$("#reviewPaging").append("<li><a class='pageMove' style='display: none;'>"
					+(pb.startPageOfPageGroup-1)+"</a><a class='movePage' href=#>◀</a></li>");
				}
				for(var i=pb.startPageOfPageGroup;i<=pb.endPageOfPageGroup;i++){
					$("#reviewPaging").append("<li><a class='movePage pageMove' href=#>"+i+"</a></li>");
				}
				if(pb.nextPageGroup ==true){
					$("#reviewPaging").append("<li><a class='pageMove' style='display: none;'>"
					+(pb.endPageOfPageGroup+1)+"</a><a class='movePage' href=#>▶</a></li>");
				} */
			}
		});
	}
</script> -->
<script type="text/javascript">
function existcheckMatching(userId,trainerId){
	$.ajax({
		type:"get",
		url:"${pageContext.request.contextPath}/countExistMatching.do",
		data:"userId="+userId+"&trainerId="+trainerId,
		success:function(data){
			if(data==0){
				var info="";	
				info+="<h2>Matching 신청</h2>";
				info+="<form action='${pageContext.request.contextPath}/userMatching.do' method='post'>";
				info+="<table  class='table table-bordered' style='width:30%;'>";
				info+="<thead><tr><th>기간(개월)</th><th>수락</th></tr></thead>";
				info+="<tbody><tr><td><select name='period'>";
				info+="<option value='1'>1</option>";
				info+="<option value='2'>2</option>";
				info+="<option value='3'>3</option>";
				info+="<option value='4'>4</option>";
				info+="<option value='5'>5</option>";
				info+="<option value='6'>6</option></select></td>";
				info+="<td><input type='submit' value='신청'>";
				info+="<input type='hidden' name='trainerId' value="+$("#trainerId").val()+"></td>";
				info+="</tr></tbody></table></form>";
				info+="	&nbsp;※ 모든 온라인 Pt 비용은 월 만원입니다";
				
				$("#matchingInfo").html(info);		
			}
			
		}
	});
}
$(document).ready(function(){
	getRatingList("1");
	$.ajax({
		type:"get",
		url:"${pageContext.request.contextPath}/selectfollowstate.do",
		data:"memId=${mvo.id}&trainerId="+$("#trainerId").val(),
		success:function(data){
			if(data=='Y'){
				$("#imgtd").html("<img class='img-responsive heartimg' src='${pageContext.request.contextPath}/resources/img/heart-red.png' width='50'>");
				existcheckMatching("${mvo.id}",$("#trainerId").val());
					
			}else{
				$("#imgtd").html("<img class='img-responsive heartimg' src='${pageContext.request.contextPath}/resources/img/heart-gray.png' width='50'>");
				$("#matchingInfo").html("");
			}
				
		}//success
	}); //ajax
	$("#imgtd").click(function(){
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/updatefollowState.do",
				data: "trainerId="+$("#trainerId").val(),
				success:function(data){
					if(data=='Y'){
						$("#imgtd").html("<img class='img-responsive heartimg' src='${pageContext.request.contextPath}/resources/img/heart-red.png' width='50'>");
						existcheckMatching("${mvo.id}",$("#trainerId").val());
					}else{
						$("#imgtd").html("<img class='img-responsive heartimg' src='${pageContext.request.contextPath}/resources/img/heart-gray.png' width='50'>");
						$("#matchingInfo").html("");	
					}
						
				}//function
			});//ajax
		});//click
	});//ready
	
</script>
<style>
	.headTitle {
		font-weight:bold;
	}
</style>
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
			<c:if test="${mvo.istrainer.equals('user')}">
			<tr>
			<th>팔로잉</th>
			<td id="imgtd"></td>
			</tr>
			</c:if>
			<tr>
			<th colspan="2">팔로워 :  ${tvo.count}</th></tr>
			
		</table><br>
		<c:if test="${sessionScope.mvo.istrainer == 'user' }">
		<div id="matchingInfo"></div></c:if>
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
		
		<br><br><br><br>
		<div class="col-lg-12">
			<h2 class="page-header">강사 후기</h2>
		</div>
		<div><h3 align="right">전체 평점 (5/10)</h3></div>
		<div>
			<c:set value="${requestScope.rateList.LVO}" var="rateList"/>
			<c:set value="${requestScope.rateList.LVO}" var="rateList"/>
			<table class="table table-condensed">
				<tbody id="" align="center">
					<tr><!-- style='font-weight:bold;' -->
						<td class="headTitle" style="width:15%;">평점</td>
						<td class="headTitle" style="width:15%;">회원 ID</td>
						<td class="headTitle" style="width:30%;">내용</td>
						<!-- <th style="width:15%;">닉네임</th> -->
						<td class="headTitle" style="width:20%;">평가일</td>
						<!-- <td class="headTitle" style="width:10%;">가격(원)</td>
						<td class="headTitle" style="width:10%;">결제상태</td>
						<td class="headTitle" style="width:10%;">강사평가</td> -->
						<td></td>
					</tr>
					<c:if test="${!empty rateList}">
						<c:forEach items="${rateList}" var="list">
							<tr>
								<td>
									<c:set value="${list.rate / 2}" var="shares"/>
									<c:set value="${list.rate % 2}" var="rest"/>
									<c:forEach begin="1" end="${shares}">
										<img src="${pageContext.request.contextPath}/resources/img/staron.png" width="20px" height="20px">
									</c:forEach>
									<c:if test="${rest != 0}">
										<img src="${pageContext.request.contextPath}/resources/img/staron(half).png" width="12px" height="20px">
									</c:if>
									&nbsp;(${list.rate})
								</td>
								<td>${list.userId}</td>
								<td>${list.content}</td>
								<td>${list.rateDate}</td>
								<td>
									<a href="#">수정</a>&nbsp;
									<a href="#">삭제</a>
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
		<%-- <div align="center">
			<ul class="pagination">
				<c:set var="pb" value="${requestScope.rateList.pb}"></c:set>
					<c:if test="${pb.previousPageGroup}">
						<li class="previous"><a href="${pageContext.request.contextPath}/trainerDetail.do?pageNo=${pb.startPageOfPageGroup-1}"> 
						 previous</a></li>	
					</c:if>
			
					<c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
						<c:choose>
							<c:when test="${pb.nowPage != i}">
								<li><a href="${pageContext.request.contextPath}/trainerDetail.do?pageNo=${i}&trainerId=">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li class="active"><a>${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>	    
			
					<c:if test="${pb.nextPageGroup}">
						<li class="next"><a href="${pageContext.request.contextPath}/trainerDetail.do?pageNo=${pb.endPageOfPageGroup+1}">
						next</a></li>
					</c:if>
			</ul>
		</div> --%>
		<div align="center">
			<ul class="pagination">
				<c:set var="pb" value="${requestScope.rateList.pb}"></c:set>
					<c:if test="${pb.previousPageGroup}">
						<li class="previous"><a href="${pageContext.request.contextPath}/trainerDetail.do?pageNo=${pb.startPageOfPageGroup-1}"> 
						 previous</a></li>	
					</c:if>
			
					<c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
						<c:choose>
							<c:when test="${pb.nowPage != i}">
								<li><a href="#" data-page="${i}">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li class="active"><a>${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>	    
			
					<c:if test="${pb.nextPageGroup}">
						<li class="next"><a href="${pageContext.request.contextPath}/trainerDetail.do?pageNo=${pb.endPageOfPageGroup+1}">
						next</a></li>
					</c:if>
			</ul>
		</div>
	</div>
</div>