<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<style>
table.bmiTable {
    border-collapse: collapse;
    text-align: left;
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
<div class="container">
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
	<th></th>
</tr>
<tr>
</tr>
<!-- bmi_height = bmi_height.value / 100
		  Square = bmi_height * bmi_height
	      var bmi_num= bmi_weight.value/Square
		  var strBmi = Math.round(bmi_num*100)/100 -->
<tr>
<td>※계산식※신체질량지수(BMI)=
체중(kg)/[신장(m)]2</td>
</tr>
<tr>
<td>판정기준</td>
</tr>
<tr>
<td>저체중=20 미만</td>
</tr>
<tr>
<td>		
정상=20 - 24
</td>
</tr>
<tr>
<td>		
과체중=25 - 29
</td>
</tr>
<tr>
<td>		
비만=30 이상
</td>
</tr>

<td>
장단점 : 표준체중보다는 체지방을 비교적 정확하게 반영할 수 있으면서도 매우 간단히 계산하여 판정할 수 있다.
</td>

	<%-- </c:when> --%>
	<%-- </c:choose> --%>
</table>
</div>
