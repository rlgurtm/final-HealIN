<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
		<c:if test="${!empty mvo }">
		<div class="box container" >
			<form>
			<label>댓글</label>
				<textarea class="form-control" cols="30" rows="3" id="comment"></textarea>
			</form>
		</div>
		</c:if>
		<br><br>
