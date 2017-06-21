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
<style>
	.btn {
    border: none;
    color: white;
    padding: 10px 22px;
    font-size: 12px;
    cursor: pointer;
	}
	.info {background-color: #2196F3;} /* Blue */
	.info:hover {background: #0b7dda;}
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
          ['Date', '측정일자'],
          ['2017-06-05',  0],
          ['2017-06-08',  18.6],
          ['2017-06-10',  22.9],
          ['2017-06-11',  24.9],
          ['2017-06-13',  44]
          
        /*   ['Date', '측정일자','BMI'],
          ['2017-06-05',  22.9,   0 ],
          ['2017-06-08',  1170,    0],
          ['2017-06-10',  660,     0],
          ['2017-06-11',  1030,   0],
          ['2017-06-13',  1030,    0] */
       
        ]);

        var options = {
          title: '측정일자 & BMI LIST',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
        chart.draw(data, options);
      }
      /* var startDate = document.getElementById("datepicker1").value;
		var endDate = document.getElementById("datepicker2").value;
		var jsonData = $.ajax({
          url: "${pageContext.request.contextPath}/ajaxGraphData.do",
          dataType: "json",
          data: "startDate=" + startDate + "&endDate=" + endDate + "&id=${sessionScope.mvo.id}",
          async: false,
          success: function(jsonData) {
          	//alert(jsonData[1].consumptionDate);
          	var data = new google.visualization.DataTable();
      		data.addColumn('string', 'Date'); 
      		data.addColumn('number', '섭취량', '');
      		data.addColumn('number', '소모량', '');
      		data.addRows(7);
      		//alert(jsonData[5].totalIntakeDate);
      		data.setCell(0, 0, '2017-06-01');
      		data.setCell(0, 1, 2000);
      		data.setCell(0, 2, 500);
      		data.setCell(1, 0, '2017-06-03');
      		data.setCell(1, 1, 3000);
      		data.setCell(1, 2, 2500);
      		data.setCell(2, 0, '2017-06-05');
      		data.setCell(2, 1, 1000);
      		data.setCell(2, 2, 3000);
      		data.setCell(3, 0, '2017-06-07');
      		data.setCell(3, 1, 1000);
      		data.setCell(3, 2, 3000);
      		data.setCell(4, 0, '2017-06-08');
      		data.setCell(4, 1, 1000);
      		data.setCell(4, 2, 3000);
      		data.setCell(5, 0, '2017-06-09');
      		data.setCell(5, 1, 1000);
      		data.setCell(5, 2, 3000);
      		data.setCell(6, 0, '2017-06-10');
      		data.setCell(6, 1, 1000);
      		data.setCell(6, 2, 3000);
              var options = {
                title: '기간 별 칼로리 섭취/소모량',
                legend: { position: 'bottom' }
              };
              var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
              chart.draw(data, options);
          }
		});
	} */
</script>
<script>
    $(function() {
        $("#datepicker1, #datepicker2").datepicker({
            dateFormat: 'yy-mm-dd'
        });
    });
</script>
<script type="text/javascript">
/* function Test(){
alert("측정되었습니다!");
} */
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
					<li class="menu"><a href="${pageContext.request.contextPath}/userHealthCheck.do">기간 별 칼로리 체크</a></li>
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
					<td>&nbsp;&nbsp;신장<input type="text" id="height" name="height"  
						  						   required="required">(cm)
					</td>
				</tr>
				<tr class="active">
					<td>&nbsp;체중<input type="text" id="weight" name="weight"  
						  		 required="required">(kg)
					</td>
				</tr>
				<!-- <tr class="info">
		</tr> -->
				<tr class="">
					<td><input type="submit" class="btn info" value="측정하기" 
							onclick="Test()"></td>
				</tr>
			</tbody>
		</table>
	</form>
<hr>
<div>
	<form id="graphPb"
		action="${pageContext.request.contextPath }/graphPagingBean.do">
		<table class="bmiTable">
			<caption>BMI측정지수( * BMI측정지수는 1일 지수만 기록되고 보여지며 이후 추가로 측정 할 경우 
					최종 측정한 값으로 수정되어 보여집니다.)</caption> 
			<caption align="right"> 
		</caption>
			<%-- <c:choose> --%>
			<%-- <c:when test="${empty sessionScope.listVO }==false"> --%>
			<tr align="center">
				<th>글 번호</th>
				<th>측정일자</th>
				<th>신장</th>
				<th>체중</th>
				<th>측정지수</th>
				<th>  </th>
			</tr>
			<c:forEach items="${listVO.LVO}" var="bmiList">
				<tr>
					<td align="center">${bmiList.physical_no}</td>
					<td align="center">${bmiList.today}</td>
					<td align="center">${bmiList.height}</td>
					<td align="center">${bmiList.weight}</td>
					<td align="center">${bmiList.bmiValue}</td>
					<td align="center">
					<button type="button" class="btn info"  onclick="location.href='bmiListDelete.do?physical_no=${bmiList.physical_no}'">삭제하기</button>
					</td>
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
	<div id="curve_chart"></div><br>
	<br>
	<table class="table">
			<tr>
				<td align="center"><br><img
					src="${pageContext.request.contextPath}/resources/img/bmi.png"
					width="500" height="200"></td>
			</tr>
		</table>
</div>