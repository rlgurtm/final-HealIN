<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
function popupOpen(id){
	alert(id);
	var popUrl = "${pageContext.request.contextPath}/trainer/ptListPopup.do?id="+id;	

	var popOption = "width=500, height=200, top=200 ,left=400, resizable=no, scrollbars=no, status=no;";   

		window.open(popUrl,"popupname",popOption);

	}
</script>
<div class="container">
	<h1 class="page-header">강사 매칭 신청</h1>
	<c:choose>
		<c:when test="${!empty ptList.LVO }">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th style="width:10%;">아이디</th>
						<th style="width:10%;">이름</th>
						<th style="width:15%;">닉네임</th>
						<th>주소</th>
						<th>pt현황</th>
					</tr>
				</thead>
				<tbody id="tipBoardInfo">
					<c:forEach items="${ptList.LVO }" var="list">
						<tr>
							<td>${list.id}</td><td>${list.name }</td><td>${list.nickname }</td>
							<td>${list.address }</td><td><a href="javascript:popupOpen('${list.id }');">현황보기</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div align="center">
		<ul class="pagination">
			<c:set var="pb" value="${ptList.pb}"></c:set>
				<c:if test="${pb.previousPageGroup}">
					<li class="previous"><a href="${pageContext.request.contextPath}/ptList.do?id=${mvo.id }&nowpage=${pb.startPageOfPageGroup-1}"> 
					 previous</a></li>	
				</c:if>
		
				<c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
					<c:choose>
						<c:when test="${pb.nowPage!=i}">
							<li><a href="${pageContext.request.contextPath}/ptList.do?id=${mvo.id }&nowpage=${i}">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li class="active"><a>${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>	    
		
				<c:if test="${pb.nextPageGroup}">
					<li class="next"><a href="${pageContext.request.contextPath}/ptList.do?id=${mvo.id }&nowpage=${pb.endPageOfPageGroup+1}">
					next</a></li>
				</c:if>
		</ul>
	</div>
		</c:when>
		<c:otherwise>
		매칭 정보가 없습니다
		</c:otherwise> 
	</c:choose>
	<br><br>
	<h1 class="page-header">강사 매칭 수락</h1>
	<c:choose>
		<c:when test="${!empty ptList.LVO }">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th style="width:10%;">아이디</th>
						<th style="width:10%;">이름</th>
						<th style="width:15%;">닉네임</th>
						<th>주소</th>
						<th>pt현황</th>
					</tr>
				</thead>
				<tbody id="tipBoardInfo">
					<c:forEach items="${mList.LVO }" var="list">
						<tr>
							<td>${list.id}</td><td>${list.name }</td><td>${list.nickname }</td>
							<td>${list.address }</td><td><a href="javascript:popupOpen();">현황보기</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
				<div align="center">
		<ul class="pagination">
			<c:set var="pb" value="${mList.pb}"></c:set>
				<c:if test="${pb.previousPageGroup}">
					<li class="previous"><a href="${pageContext.request.contextPath}/ptList.do?id=${mvo.id }&pageNo=${pb.startPageOfPageGroup-1}"> 
					 previous</a></li>	
				</c:if>
		
				<c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
					<c:choose>
						<c:when test="${pb.nowPage!=i}">
							<li><a href="${pageContext.request.contextPath}/ptList.do?id=${mvo.id }&pageNo=${i}">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li class="active"><a>${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>	    
		
				<c:if test="${pb.nextPageGroup}">
					<li class="next"><a href="${pageContext.request.contextPath}/ptList.do?id=${mvo.id }&pageNo=${pb.endPageOfPageGroup+1}">
					next</a></li>
				</c:if>
		</ul>
	</div>
		</c:when>
		<c:otherwise>
		매칭 정보가 없습니다
		</c:otherwise> 
	</c:choose>
	
</div>