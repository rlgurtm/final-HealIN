<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">

	<!-- Page Heading/Breadcrumbs -->
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				Following List
			</h1>
			
		</div>
	</div>
<table class="table table-bordered">
		<thead>
		
			<tr>
				<td><span class="followingidnick">아이디 닉네임&emsp;&emsp;</span>
				<img class='img-responsive heartimg' src='${pageContext.request.contextPath}/resources/img/heart-red.png' width='50'>
				</td>
				<td><span class="followingidnick">아이디 닉네임&emsp;&emsp;</span>
				<img class='img-responsive heartimg' src='${pageContext.request.contextPath}/resources/img/heart-red.png' width='50'>
				</td>
				<td><span class="followingidnick">아이디 닉네임&emsp;&emsp;</span>
				<img class='img-responsive heartimg' src='${pageContext.request.contextPath}/resources/img/heart-red.png' width='50'>
				</td>
			
			</tr>
			<tr>
			<td><span class="followingidnick">아이디 닉네임&emsp;&emsp;</span>
				<img class='img-responsive heartimg' src='${pageContext.request.contextPath}/resources/img/heart-red.png' width='50'>
				</td>
				<td><span class="followingidnick">아이디 닉네임&emsp;&emsp;</span>
				<img class='img-responsive heartimg' src='${pageContext.request.contextPath}/resources/img/heart-red.png' width='50'>
				</td>
				<td><span class="followingidnick">아이디 닉네임&emsp;&emsp;</span>
				<img class='img-responsive heartimg' src='${pageContext.request.contextPath}/resources/img/heart-red.png' width='50'>
				</td>
				
			</tr>
			<tr>
				<td><span class="followingidnick">아이디 닉네임&emsp;&emsp;</span>
				<img class='img-responsive heartimg' src='${pageContext.request.contextPath}/resources/img/heart-red.png' width='50'>
				</td>
				<td><span class="followingidnick">아이디 닉네임&emsp;&emsp;</span>
				<img class='img-responsive heartimg' src='${pageContext.request.contextPath}/resources/img/heart-red.png' width='50'>
				</td>
				<td><span class="followingidnick">아이디 닉네임&emsp;&emsp;</span>
				<img class='img-responsive heartimg' src='${pageContext.request.contextPath}/resources/img/heart-red.png' width='50'>
				</td>
			
			</tr>
			<tr>
			<td><span class="followingidnick">아이디 닉네임&emsp;&emsp;</span>
				<img class='img-responsive heartimg' src='${pageContext.request.contextPath}/resources/img/heart-red.png' width='50'>
				</td>
				<td><span class="followingidnick">아이디 닉네임&emsp;&emsp;</span>
				<img class='img-responsive heartimg' src='${pageContext.request.contextPath}/resources/img/heart-red.png' width='50'>
				</td>
				<td><span class="followingidnick">아이디 닉네임&emsp;&emsp;</span>
				<img class='img-responsive heartimg' src='${pageContext.request.contextPath}/resources/img/heart-red.png' width='50'>
				</td>
				
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
</div>