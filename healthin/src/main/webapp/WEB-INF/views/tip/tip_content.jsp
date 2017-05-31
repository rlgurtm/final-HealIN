<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <style>
		.container{
			position: relative;
		}
		table.content {
		    border-collapse: separate;
		    border-spacing: 1px;
		    text-align: left;
		    line-height: 1.5;
		    border-top: 1px solid #ccc;
		    margin : 50px 10px;
		    width:500px;
		    
		}
		table.content th {
		    width: 150px;
		    padding: 10px;
		    font-weight: bold;
		    vertical-align: top;
		    border-bottom: 1px solid #ccc;
		}
		table.content td {
		    width: 350px;
		    padding: 10px;
		    vertical-align: top;
		    border-bottom: 1px solid #ccc;
		}
		 .content tbody pre {
		 	position:relative;
			background-color:#E6E6E6;
			height: 500px;
			padding: 30px;
			padding-top: 60px;
			width: 800px;
			margin-top: 10px;
			line-height:2em
		   
		}
		#attechedFile {
			position: absolute;
			top: 20px;
			right: 20px;
		   
		}
		#listBtn{
			position:absolute;
			right: 17%;
			bottom: 0px;
			
		}
		#deleteBtn{
			position:absolute;
			right: 25%;
			bottom: 0px;
			
		}
	</style>
	<script type="text/javascript">
	$(document).ready(function(){
		$("#listBtn").click(function(){
			location.href="${pageContext.request.contextPath}/tip/tip.do";
		});//click
		$("#deleteBtn").click(function(){
			location.href="${pageContext.request.contextPath}/tipBoardDelete.do?no=${tip.no }&id=${tip.memberVO.id}";
		});//click
	});//ready
	</script>
	
	
	<div class="container">
		<table class="content " style="margin-left: auto; margin-right: auto;">
			<thead>
				<tr>
					<th>제목</th><td colspan="5">${tip.title }</td>
				</tr>
				<tr>
					<th>글쓴이</th><td>${tip.memberVO.nickname }</td>
					<th>날짜</th><td>${tip.postedDate }</td>
					<th>조회수</th><td>${tip.hits }</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="6"><pre style="white-space: pre-wrap;">${tip.content }
						<span id="attechedFile"><a href="#">첨부파일</a></span></pre>
					</td>
				</tr>
			</tbody>
		</table>
			<c:if test="${mvo.id==tip.memberVO.id }">
				<button type="button" class="btn" id="deleteBtn">삭제하기</button>
			</c:if>
				<button type="button" class="btn" id="listBtn">목록가기</button>
	</div>
	<hr>
		<c:if test="${!empty mvo }">
		<div class="well" style="width:60%; margin-left: auto; margin-right: auto; " >
			<table style="width:100%;">
				<tr>
					<th><i class="glyphicon glyphicon-user"></i>근육맨</th><td align="right">2017-05-29 22:11</td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;여기는 뭐 얻어갈 정보가 별로 없네요....실망실망 개실망</td>
				</tr>
			</table>
			
			<hr>
			<form>
				<table style="width:100%;">
					<tr>
						<td colspan="2"><label>댓글</label></td>
					</tr>
					<tr>
						<td>
						<textarea class="form-control"  rows="3" id="comment" style="width:100%;"></textarea>
						</td>
						<td>
						<input type="submit" value="등록">
						</td>
					</tr>
				</table>
			</form>
		</div>
		</c:if>
		<br><br>
