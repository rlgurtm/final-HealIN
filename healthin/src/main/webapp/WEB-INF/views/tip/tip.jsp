<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <script>
  	$(document).ready(function(){
    	$(".menu").click(function(){
        	$(".active").removeClass("active");
        	$(this).addClass("active");
        	 $.ajax({
 				type:"get",
 				url:"${pageContext.request.contextPath}/tipcategory.do",
 				data:"category="+$(this).text(),
 				dataType:"json",
 				success:function(data){
 			 	  	var info="";
					for(var i=0;i<data.lvo.length;i++){
 						info+="<tr><td>"+data.lvo[i].no+"</td>";
 						info+="<td>"+data.lvo[i].title+"</td>";
 						info+="<td>"+data.lvo[i].memberVO.name+"</td>";
 						info+="<td>"+data.lvo[i].posted_date+"</td>";
 						info+="<td>"+data.lvo[i].hits+"</td></tr>";
 					} 
 					
 					 $("#tipBoardInfo").html(info); 
 					   
 						 
 			/* 		 var paging="";
 					 for(var k=data.pagingBean.startPageOfPageGroup;k<=data.pagingBean.endPageOfPageGroup;k++){
 						 paging+="<li><a href='#'>"+k+"</a></li>";
 					 }
 					 $(".genregage .pagination").html(paging);
 					 $(".pagination").html("");
 					 $("#showBookList").html(info);	 */				
 				}//success
 			});
        });
    
    });
  </script>

<div class="container">
	<h2>나만의 tip</h2>
	<br>
	
	<ul class="nav nav-tabs">
		<li class="menu active">
			<a href="${pageContext.request.contextPath}/tip/tip.do">Home</a>
		</li>
		<li class="menu"><a href="#">운동</a></li>
		<li class="menu"><a href="#">다이어트</a></li>
		<li class="menu"><a href="#">식단</a></li>
		<li class="menu"><a href="#">헬스</a></li>
	</ul>
	<br>
	<table class="table">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${!empty list.LVO }">
				<c:forEach items="${list.LVO }" var="list">
					<tr>
						<td>${list.no}</td>
						<td>${list.title }</td>
						<td>${list.memberVO.name }</td>
						<td>${list.postedDate }</td>
						<td>${list.hits}</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
 
	<div align="center">
		<ul class="pagination">
			<c:set var="pb" value="${list.pb}"></c:set>
				<c:if test="${pb.previousPageGroup}">
					<li class="previous"><a href="${pageContext.request.contextPath}/tip/tip.do?nowpage=${pb.startPageOfPageGroup-1}"> 
					 previous</a></li>	
				</c:if>
		
				<c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
					<c:choose>
						<c:when test="${pb.nowPage!=i}">
							<li><a href="${pageContext.request.contextPath}/tip/tip.do?nowpage=${i}">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li><a>${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>	    
		
				<c:if test="${pb.nextPageGroup}">
					<li class="next"><a href="${pageContext.request.contextPath}/tip/tip.do?nowpage=${pb.endPageOfPageGroup+1}">
					next</a></li>
				</c:if>
		</ul>
	</div>
 </div>
	

