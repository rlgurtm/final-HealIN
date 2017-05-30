<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
.btn{
	position:absolute;
	right: 17%;
	bottom: 0px;
	
}
	</style>
	<script type="text/javascript">
	$(document).ready(function(){
		$("#listBtn").click(function(){
			location.href="${pageContext.request.contextPath}/tip/tip.do";
		});
	});
	</script>
	
	<div class="container">
	<table class="content " style="margin-left: auto; margin-right: auto;">
	<thead>
		<tr>
			<th>제목</th><td colspan="5">${tip.title }</td>
		</tr>
		<tr>
			<th>글쓴이</th><td>${tip.memberVO.nickname }</td><th>날짜</th><td>${tip.postedDate }</td><th>조회수</th><td>${tip.hits }</td>
		</tr>
	</thead>
		<tbody>
		<tr><td colspan="6"><pre style="white-space: pre-wrap;">${tip.content }
		<span id="attechedFile"><a href="#">첨부파일</a></span></pre></td></tr>
		</tbody>
	</table>
	<button type="button" class="btn" id="listBtn">목록가기</button>
	</div>
	<br><br>
