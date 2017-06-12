<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
var category=null;
	function getTipCategoryList(page){
		$.ajax({
			type:"get",
			url:"${pageContext.request.contextPath}/tipcategory.do",
			data:"category="+category+"&nowpage="+page,
			dataType:"json",
			success:function(data){
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
							info+="<a href='${pageContext.request.contextPath}/tip/tip_content.do?";
							info+="no="+data.lvo[i].no+"'>"+data.lvo[i].title+"</a>";
							if(data.lvo[i].commentCount!="0")
							info+="("+data.lvo[i].commentCount+")";
						} 
					
					info+="</td><td>"+data.lvo[i].memberVO.name+"</td>";
					info+="<td>"+data.lvo[i].postedDate+"</td>";
					info+="<td>"+data.lvo[i].hits+"</td></tr>";
				} 
				
				 $("#tipBoardInfo").html(info); 
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
    	category=$(this).text();
    	getTipCategoryList(1);
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

	<!-- Page Heading/Breadcrumbs -->
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header follo">
				<small>팔로워 :  ${follower}  / 팔로잉 : 0</small> 
			</h1>
			
		</div>
	</div>
	<ul class="nav nav-tabs follow">
		<li class="menu active">
			<a href="${pageContext.request.contextPath}/trainer/followingList.do">팔로우</a>
		</li>
		<li class="menu"><a href="#">팔로잉</a></li>
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
					<a href="#">
					<%-- <a href="updateAcceptState.do?userId=${list.id}"> --%>
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
					<li class="previous"><a href="${pageContext.request.contextPath}/trainer/followingList.do?pageNo=${pb.startPageOfPageGroup-1}"> 
					 previous</a></li>	
				</c:if>
		
				<c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
					<c:choose>
						<c:when test="${pb.nowPage!=i}">
							<li><a href="${pageContext.request.contextPath}/trainer/followingList.do?pageNo=${i}">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li class="active"><a>${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>	    
		
				<c:if test="${pb.nextPageGroup}">
					<li class="next"><a href="${pageContext.request.contextPath}/trainer/followingList.do?pageNo=${pb.endPageOfPageGroup+1}">
					next</a></li>
				</c:if>
		</ul>
	</div>
</div>
