<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	var category=null;
	function getQnaCategoryList(page){
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
	<h2>강사에게 묻고싶다</h2><br>
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
				<tbody id="qnaBoardInfo">
			<c:if test="${!empty qnalist.LVO }">
				<c:forEach items="${qnalist.LVO }" var="list">
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
			<button type="button" class="btn btn-default write" id="ptQnaWrite">글쓰기</button>
		</c:if>
		<div align="center"><ul class="pagination"></ul></div>
</div>
