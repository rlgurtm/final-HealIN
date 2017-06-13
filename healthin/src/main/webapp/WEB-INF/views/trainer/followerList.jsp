<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
var category=null;
	function getFollowingList(page){
		$.ajax({
			type:"get",
			url:"${pageContext.request.contextPath}/trainerfollowing.do",
			data:"pageNo="+page,
			dataType:"json",
			success:function(data){
		 	  	var info="";
			for(var i=0;i<data.lvo.length;i++){
				info+="<tr><td><span class='followingidnick'>"+data.lvo[i].id+" / ";
				info+=data.lvo[i].nickname+"&emsp;&emsp;";
				info+="</span></td><td>";
				info+="<a href='updateAcceptState.do?userId="+data.lvo[i].id+"'>";
				info+="<img class='img-responsive heartimg' src='${pageContext.request.contextPath}/resources/img/heart-red.png' width='50'>";
				info+="</a></td></tr>";
				} 
			
			 $("#following").html(info);
			 
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
			}//success
		});//ajax
	}//function

$(document).ready(function(){
$(".menu").click(function(){
   	$(".active").removeClass("active");
   	$(this).addClass("active");
   	getFollowingList(1);
   });//click
   
$(".pagination").on("click", "li", function(){
$(".pagination .active").removeClass("active");
 		$(this).addClass("active"); 
		category=$(".nav-tabs .active").text();
		getTipCategoryList($(this).val());
});//on
});//ready

</script>
<div class="container">

<c:choose >
<c:when test="${tvo.rank==0}">
<h2>지금은 사용할 수 없습니다.</h2>
</c:when>
<c:otherwise>
<!-- Page Heading/Breadcrumbs -->
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header follo">
			<small>팔로워 :  ${follower}</small> 
		</h1>
		
	</div>
</div>
<ul class="nav nav-tabs follow">
	<li class="menu active">
		<a href="${pageContext.request.contextPath}/followerList.do">팔로우</a>
	</li>
	<li class="menu"><a href="#">맞팔</a></li>
</ul>
<table class="table table-bordered follow">
	<tbody id="following">
		<c:if test="${!empty list.LVO }">
			<c:forEach items="${list.LVO }" var="list">	
			<tr>
				<td><span class="followingidnick">${list.id} / ${list.nickname}&emsp;&emsp;
				</span></td>
				<td>
				<a href="updateAcceptState.do?userId=${list.id}">
				<img class='img-responsive heartimg' src='${pageContext.request.contextPath}/resources/img/heart-gray.png' width='50'>
				</a>
				</td>
			</tr>
			</c:forEach>
		</c:if>
	</tbody>
</table>
<div align="center">
	<ul class="pagination">
		<c:set var="pb" value="${list.pb}"></c:set>
			<c:if test="${pb.previousPageGroup}">
				<li class="previous"><a href="${pageContext.request.contextPath}/followingList.do?pageNo=${pb.startPageOfPageGroup-1}"> 
				 previous</a></li>	
			</c:if>
	
			<c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
				<c:choose>
					<c:when test="${pb.nowPage!=i}">
						<li><a href="${pageContext.request.contextPath}/followingList.do?pageNo=${i}">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li class="active"><a>${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>	    
	
			<c:if test="${pb.nextPageGroup}">
				<li class="next"><a href="${pageContext.request.contextPath}/followingList.do?pageNo=${pb.endPageOfPageGroup+1}">
				next</a></li>
			</c:if>
	</ul>
</div>
</c:otherwise>
</c:choose>
	
</div>
