<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	var category=null;
	function getQnaCategoryList(page){
		$.ajax({
			type:"get",
			url:"${pageContext.request.contextPath}/ptQnaList.do",
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
			}//success
		});//ajax
	}//function
	$(document).ready(function(){
		getQnaCategoryList(1);
		$(".menu").click(function(){
        	$(".active").removeClass("active");
        	$(this).addClass("active");
        	category=$(this).text();
        	getQnaCategoryList(1);
        });//click
       
        $(".pagination").on("click", "li", function(){
			$(".pagination .active").removeClass("active");
   		 		$(this).addClass("active"); 
   				category=$(".nav-tabs .active").text();
   				getQnaCategoryList($(this).val());
   		});//on
   		
   		$("#ptQnaWrite").click(function(){
    		location.href="${pageContext.request.contextPath}/pt_qna/ptQnaWriteForm.do";
    	});//click
	});//ready
</script>
<div class="container">
	<h2>강사에게 묻는다</h2><br>
	<ul class="nav nav-tabs">
		<li class="menu active"><a href="#">Home</a></li>
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
				<tbody id="qnaBoardInfo"></tbody>
		</table>
		<c:if test="${mvo!=null }">
			<button type="button" class="btn btn-default write" id="ptQnaWrite">글쓰기</button>
		</c:if>
		<div align="center"><ul class="pagination"></ul></div>
</div>
