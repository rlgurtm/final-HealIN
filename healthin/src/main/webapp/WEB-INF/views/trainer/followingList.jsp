<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">


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
			<a href="${pageContext.request.contextPath}/trainer/followingList.do">follower</a>
		</li>
		<li class="menu"><a href="#">following</a></li>
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
