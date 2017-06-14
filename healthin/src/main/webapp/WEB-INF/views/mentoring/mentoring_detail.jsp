<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.chat-box {
    display: inline;
    color: #34495e;
    margin: 0 0 15px 0;
}
 
.chat-box li {
    display: inline;
    padding: 10px;
    margin: 7px 10px;
    font-size: 15px;
    line-height: 10px;
 
    -webkit-border-top-left-radius: 6px;
    -webkit-border-top-right-radius: 6px;
    -webkit-border-bottom-right-radius: 6px;
    -webkit-border-bottom-left-radius: 6px;
    -moz-border-radius-topleft: 6px;
    -moz-border-radius-topright: 6px;
    -moz-border-radius-bottomright: 6px;
    -moz-border-radius-bottomleft: 6px;
    border-top-left-radius: 6px;
    border-top-right-radius: 6px;
    border-bottom-right-radius: 6px;
    border-bottom-left-radius: 6px;
}
 
.chat-box .odd {
    background-color: #ecf0f1;
    max-width: 60%;
    clear: both;
    float: left;
}
 
.chat-box .odd:after {
    content: '';
    position: relative;
    top: auto;
    bottom: auto;
    border: 12px solid;
    border-color: transparent transparent #ecf0f1 transparent;
    margin: -25px 0 0 -24px;
    float: left;
}
 
 
.chat-box .even {
    background-color: #C1E4EC;
    max-width: 60%;
    height: auto;
    clear: both;
    float: right;
}
 
.chat-box .even:after {
    content: '';
    position: relative;
    bottom: auto;
    border: 12px solid;
    border-color: transparent transparent #C1E4EC transparent;
    margin: -25px -24px 0 0;
    float: right;
}
 
.chat-box li span {
    padding: 15px 0 5px;
    color: #7f8c8d;
    display: block;
    font-size: 5px;
    text-align: right;
}
/* Rounded Corners */
.ta5 {
	border: 2px solid #765942;
	border-radius: 10px;
	height: 50px;
	width: 500px;
}
.myButton {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #d0451b), color-stop(1, #bc3315));
	background:-moz-linear-gradient(top, #d0451b 5%, #bc3315 100%);
	background:-webkit-linear-gradient(top, #d0451b 5%, #bc3315 100%);
	background:-o-linear-gradient(top, #d0451b 5%, #bc3315 100%);
	background:-ms-linear-gradient(top, #d0451b 5%, #bc3315 100%);
	background:linear-gradient(to bottom, #d0451b 5%, #bc3315 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#d0451b', endColorstr='#bc3315',GradientType=0);
	background-color:#d0451b;
	-moz-border-radius:10px;
	-webkit-border-radius:10px;
	border-radius:10px;
	border:1px solid #942911;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:5px 200px;
	text-decoration:none;
}
.myButton:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #bc3315), color-stop(1, #d0451b));
	background:-moz-linear-gradient(top, #bc3315 5%, #d0451b 100%);
	background:-webkit-linear-gradient(top, #bc3315 5%, #d0451b 100%);
	background:-o-linear-gradient(top, #bc3315 5%, #d0451b 100%);
	background:-ms-linear-gradient(top, #bc3315 5%, #d0451b 100%);
	background:linear-gradient(to bottom, #bc3315 5%, #d0451b 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#bc3315', endColorstr='#d0451b',GradientType=0);
	background-color:#bc3315;
}
.myButton:active {
	position:relative;
	top:1px;
}

</style>
<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				MENTORING
				<small>
				상대 ID : ${mentoringId}
				</small>
			</h1>
		</div>
		<div class="col-lg-12" align="center">
		<form action="insertMentoring.do" method="post">
			<textarea class="ta5" rows="2" name="content" required="required"></textarea><br>
			<button type="submit" class="myButton btn">메시지 전송</button>
			<input type="hidden" name="receiveId" value="${mentoringId}">
		</form>
		<br>
			<div style="width: 40%">
			<ul class="chat-box">
			<c:forEach items="${listVO.LVO}" var="mentoring">
				<c:choose>
					<c:when test="${mentoring.sendId==mvo.id}">
						<li class="even">
						${mentoring.content}
						<span>${mentoring.postedDate}</span>
						</li>
					</c:when>
					<c:otherwise>
						<li class="odd">
						${mentoring.content}
						<span>${mentoring.postedDate}</span>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			</ul>
			</div>
		</div>
	</div>
	
	<!-- Pagination -->
	<div class="row text-center">
		<div class="col-lg-12">
			<ul class="pagination">
				<c:choose>
					<c:when test="${listVO.pb.previousPageGroup}">
						<li><a
							href="${ pageContext.request.contextPath }/mentoringDetail.do?sendId=${mentoringId}&nowPage=${listVO.pb.startPageOfPageGroup-1}">&laquo;</a></li>
					</c:when>
				</c:choose>
				<li class="active">
				<c:forEach var="pg" begin="${listVO.pb.startPageOfPageGroup}"
					end="${listVO.pb.endPageOfPageGroup}">
					<li><a href="${ pageContext.request.contextPath }/mentoringDetail.do?sendId=${mentoringId}&nowPage=${ pg }">${ pg }</a></li>
					</c:forEach>
				<li class="active">
				<c:choose>
					<c:when test="${listVO.pb.nextPageGroup}">
						<li><a href="${ pageContext.request.contextPath }/mentoringDetail.do?sendId=${mentoringId}&nowPage=${listVO.pb.endPageOfPageGroup+1}">&raquo;</a></li>
					</c:when>
				</c:choose>
			</ul>
		</div>
	</div>
</div>