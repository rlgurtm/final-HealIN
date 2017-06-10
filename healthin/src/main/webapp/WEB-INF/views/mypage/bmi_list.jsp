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
	margin: 20px 10px;
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

.align-center {
	text-align: center;
}
</style>
<style>
	#sendBtn {
		height: 30px;
	}
</style>
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Date', '체중', 'BMI지수'],
          ['2014',  1000,      400],
          ['2015',  1170,      460],
          ['2016',  660,       1120],
          ['2017',  1030,      540],
          ['2018',  1030,      540]
        ]);

        var options = {
          title: '기간 별 BMI & 체중 LIST',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
        chart.draw(data, options);
      }
</script>
<script>
    $(function() {
        $("#datepicker1, #datepicker2").datepicker({
            dateFormat: 'yy-mm-dd'
        });
    });
</script>
<hr>
<div class="container">
	<!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">My Page
                    <small>BMI</small>
                </h1>
            </div>
        </div>
	<c:choose>
			<c:when test="${sessionScope.mvo.istrainer == 'user'}">
				<ul class="nav nav-tabs">
					<li class="menu"><a href="${pageContext.request.contextPath}/userCalendar.do">Health 캘린더</a></li>
					<li class="menu"><a href="${pageContext.request.contextPath}/user_health_check.do">기간 별 칼로리 체크</a></li>
					<li class="menu active"><a href="${pageContext.request.contextPath}/bmi_list.do">비만도 측정(BMI)</a></li>
				</ul>
			</c:when>
			<c:when test="${sessionScope.mvo.istrainer == 'trainer'}">
				<ul class="nav nav-tabs">
					<li class="menu active"><a href="#">팔로워 관리</a></li>
					<li class="menu"><a href="#">1:1 매칭 관리</a></li>
					<li class="menu"><a href="#">나의 PT 회원</a></li>
				</ul>
			</c:when>
		</c:choose>
	<form id="bmi"
		action="${pageContext.request.contextPath }/insertUserPhysicalInfo.do">
		<table class="table" align="center" width="100">
			<thead>
				<tr>
					<th align="center"><h3>BMI 측정하기</h3></th>
				</tr>
			</thead>
			<tbody>
				<tr class="info">
					<td>&nbsp;&nbsp;신장<input type="text" id="height" name="height">(cm)
					</td>
				</tr>
				<tr class="active">
					<td>체중<input type="text" id="weight" name="weight">(kg)
					</td>
				</tr>
				<!-- <tr class="info">
		</tr> -->
				<tr class="">
					<td><input type="submit" id="bmi_Test" value="측정하기"></td>
				</tr>
			</tbody>
		</table>
	</form>
<hr>
<div>
	<form id="graphPb"
		action="${pageContext.request.contextPath }/graphPagingBean.do">
		<table class="bmiTable">
			<caption>BMI측정지수</caption>
			<%-- <c:choose> --%>
			<%-- <c:when test="${empty sessionScope.listVO }==false"> --%>
			<tr align="center">
				<th>글 번호</th>
				<th>측정일자</th>
				<th>신장</th>
				<th>체중</th>
				<th>사용자 ID</th>
				<th>측정지수</th>
			</tr>
			<c:forEach items="${listVO.LVO}" var="bmiList">
				<tr>
					<td align="center">${bmiList.physical_no}</td>
					<td align="center">${bmiList.today}</td>
					<td align="center">${bmiList.height}</td>
					<td align="center">${bmiList.weight}</td>
					<td align="center">${bmiList.user_Id}</td>
					<td align="center">${bmiList.bmiValue}</td>
				</tr>
			</c:forEach>
		</table>
	</form>

</div>
<!-- Pagination -->
	<div class="row text-center">
		<div class="col-lg-12">
			<ul class="pagination">
	<c:set var="pb" value="${listVO.pb}" />
	<c:choose>
		<c:when test="${pb.previousPageGroup}">
			<li><a
				href="${ pageContext.request.contextPath }/bmi_list.do?nowPage=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
		</c:when>
	</c:choose>
<li class="active"><c:forEach var="pg"
		begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
		<li><a
			href="${ pageContext.request.contextPath }/bmi_list.do?nowPage=${ pg }">${ pg }</a></li>
	</c:forEach>
<li class="active"><c:choose>
		<c:when test="${pb.nextPageGroup}">
			<li><a
				href="${ pageContext.request.contextPath }/bmi_list.do?nowPage=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
		</c:when>
	</c:choose>
			</ul>
		</div>
	</div>
	<!-- <div id="curve_chart" style="width: 100%; height: 500px;"></div> -->
	<table class="table">
			<tr>
				<td align="center"><img
					src="${pageContext.request.contextPath}/resources/img/bmi.png"
					width="500" height="200"></td>
			</tr>
		</table>
</div>