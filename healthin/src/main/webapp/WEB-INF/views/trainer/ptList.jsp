<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
 table.type03 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-left: 3px solid #369;
  	margin : 20px 10px;
  	width: 70%;
}
table.type03 th {
    width: 147px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #153d73;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;

}
table.type03 td {
    width: 349px;
    padding: 10px;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}
</style>
<script>
function popupOpen(){

	var popUrl = "${pageContext.request.contextPath}/WEB-INF/views/trainer/ptListPopup.jsp";	

	var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";   

		window.open(popUrl,"popupname",popOption);

	}
</script>
<div class="container">
	강사 pt 회원 리스트 보기
	
	<table class="type03">
		<tr>
			<th>아이디</th><th>이름</th><th>닉네임</th><th>주소</th><th>pt현황</th>
		</tr>
		<c:forEach items="${ptList }" var="list">
			<tr>
				<td>${list.id}</td><td>${list.name }</td><td>${list.nickname }</td>
				<td>${list.address }</td><td><a href="javascript:popupOpen();">현황보기</a></td>
			</tr>
		</c:forEach>
	</table>
</div>