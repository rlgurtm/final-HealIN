<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <script>
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
							}else{
								info+="<a href='${pageContext.request.contextPath}/tip/tip_content.do?";
								info+="no="+data.lvo[i].no+"'>"+data.lvo[i].title+"</a>";
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
    	
   		$("#tipWrite").click(function(){
    		location.href="${pageContext.request.contextPath}/tip/tipWriteForm.do";
    	});//click
    	
    });//ready
  
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
	</ul>
	<br>
	<table class="table">
		<thead>
			<tr>
				<th style="width:5%;">번호</th>
				<th style="width:10%;">분류</th>
				<th style="width:30%;">제목</th>
				<th style="width:10%;">글쓴이</th>
				<th style="width:10%;">날짜</th>
				<th style="width:5%;">조회수</th>
			</tr>
		</thead>
		<tbody id="tipBoardInfo">
			<c:if test="${!empty list.LVO }">
				<c:forEach items="${list.LVO }" var="list">
					<tr>
						<td>${list.no}</td>
						<td>${list.category }</td>
						<td>
							<c:choose >
								<c:when test="${mvo!=null }">
									<a href="${pageContext.request.contextPath}/tip/tip_content.do?no=${list.no}">
									${list.title }</a>
								</c:when>
								<c:otherwise>
									${list.title }
								</c:otherwise>
							</c:choose>
						</td>
						<td>${list.memberVO.name }</td>
						<td>${list.postedDate }</td>
						<td>${list.hits}</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
	<c:if test="${mvo!=null }">
		<button type="button" class="btn btn-default write" id="tipWrite">글쓰기</button>
	</c:if>
 	
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
							<li class="active"><a>${i}</a></li>
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
	

