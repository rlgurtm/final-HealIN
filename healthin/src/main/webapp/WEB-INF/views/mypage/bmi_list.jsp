<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<style>
table.bmiTable {
    border-collapse: collapse;
    text-align: center;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-left: 3px solid #369;
  margin : 20px 10px;
}
table.bmiTable th {
    width: 147px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #153d73;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;

}
table.bmiTable td {
    width: 349px;
    padding: 10px;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}
/* 	table {
		width : 200px;
	}
	table, tr, td {
		border : 1px solid gray;
		border-collapse : collapse; 
	}
	tr, td {
		padding : 5px;
		weigth : 20px;
	} */
	
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"></script>
<table class="bmiTable">
	<caption>BMI측정지수</caption>
	<%-- <c:choose> --%>
	<%-- <c:when test="${empty sessionScope.listVO }==false"> --%>
	<tr align="center">
		<th>측정일자</th>
		<th>신장</th>
		<th>체중</th>
		<th>사용자 ID</th>
		<th>측정지수</th>
	</tr>
		<c:forEach items="${listVO.LVO}" var="bmiList">
			<tr>
				<td align="center">${bmiList.today}</td>
				<td align="center">${bmiList.height}</td>
				<td align="center">${bmiList.weight}</td>
				<td align="center">${bmiList.user_Id}</td>
				<td align="center">${bmiList.bmiValue}</td>
			</tr>
		</c:forEach>
		</table>
		<table class="table">
		<tr>
			<td align="center">
			<img src="${pageContext.request.contextPath}/resources/img/bmi.png" 
			 width="500" height="200">
			</td>
		</tr>
</table>
