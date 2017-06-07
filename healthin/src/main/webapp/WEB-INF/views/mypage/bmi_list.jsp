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
table, th, td {
    padding: 5px;
    text-align: center;    
}
.align-center { text-align: center; } 
	
</style>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Year', '체중(kg)', 'BMI지수'],
          ['data',	30,      30],
          ['180',  50,      50],
          ['data',  70,       70],
          ['180',  100,      100]
        ]);

        var options = {
          title: '체중&그래프 확인하기',
          hAxis: {title: '확인하기',  titleTextStyle: {color: '#333'}},
          vAxis: {minValue: 0}
        };

        var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
<hr>
<div class="container">
  <form id="bmi" action="${pageContext.request.contextPath }/insertUserPhysicalInfo.do" >
<table class="table" align="center" width="100">
    <thead>
      <tr>
        <th align="center"><h3>BMI 측정하기</h3>	</th>
      </tr>
      </thead>
      <tbody>
      <tr class="info">
        <td>&nbsp;&nbsp;신장<input type="text" id="height" name="height">(cm)</td>
      </tr>
      <tr class="active">
        <td>체중<input type="text" id="weight" name="weight">(kg)</td>
      </tr>
		<!-- <tr class="info">
		</tr> -->
		<tr class="">
      	<td><input type="submit" id="bmi_Test" value="측정하기"></td>
      </tr>
   </tbody>  
</table>
</form>

    <div id="chart_div" style="width: 100%; height: 500px;">
    </div>
    
</div>
<hr>
<div>
<form id="graphPb" action="${pageContext.request.contextPath }/graphPagingBean.do">
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
</form>
</div>
