<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
  	$(document).ready(function(){
    	$(".menu").click(function(){
        	$(".active").removeClass("active");
        	$(this).addClass("active");
        });
    	$("#sendBtn").click(function() {
    		var startDate = document.getElementById("datepicker1").value;
    		var endDate = document.getElementById("datepicker2").value;
    		calDateRange(startDate, endDate);
    		startDate = startDate.replace(/\-/g,''); 	//특정문자 제거
    		endDate = endDate.replace(/\-/g,'');
    		startDate = Number(startDate);
    		endDate = Number(endDate);
    		if (endDate - startDate < 0) {
    			alert("시작일을 종료일 보다 작게 선택해주세요.");
    			return false;
    		} else if ((endDate - startDate > 7) && (endDate - startDate < 50)) {
    			alert("선택한 기간이 7일 초과 50일 미만 : 주별로 6주차 보여줌(아마도 평균)");
    			return false;
    		} else if ((endDate - startDate >= 50) && (endDate - startDate < 367)) {
    			alert("선택한 기간이 50일 초과 367일 미만 : 월별로 12개 보여줌(아마도 평균)");
    		} else if (endDate - startDate > 367) {
    			alert("선택할 수 있는 범위를 초과하였습니다. (1년까지)");
    		}
    		$.ajax({
				type: "post",		// 넘겨주는 방식
				url: "${pageContext.request.contextPath}/ajaxGraphData.do",	// 보낼 url
				data: "startDate=" + startDate + "&endDate=" + endDate + "&id=${sessionScope.mvo.id}",	// 넘길 데이타 값
				success: function(graphInfo) {	// 성공했을 때 결과
					alert(graphInfo);
				}
			});
    	});
    });
</script>
<script>
	function calDateRange(date1, date2) {
	    var format = "-";
	
	    // FORMAT을 포함한 길이 체크
	    if (date1.length != 10 || date2.length != 10)
	        return null;
	
	    // FORMAT이 있는지 체크
	    if (date1.indexOf(format) < 0 || date2.indexOf(format) < 0)
	        return null;
	
	    // 년도, 월, 일로 분리
	    var date1_arr = date1.split(format);
	    var date2_arr = date2.split(format);
	    
	    var start_date = new Date(date1_arr[0], date1_arr[1], date1_arr[2]);
	    var end_date = new Date(date2_arr[0], date2_arr[1], date2_arr[2]);
	    var day_gap = end_date - start_date;
	    
	    //if (date1%4 == 0 && ( year%100!=0 || year%400==0 ) 
	    var day = 1000 * 60 * 60 * 24;		// 밀리세컨 * 세컨 * 분 * 시간
	    var month = day * 30;
	    var year = month * 12;
	    
	    alert("start_dt : " + start_dt);
	    alert("end_dt : " + end_dt);
	
	    /* // 월 - 1(자바스크립트는 월이 0부터 시작하기 때문에...)
	    // Number()를 이용하여 08, 09월을 10진수로 인식하게 함.
	    start_dt[1] = (Number(start_dt[1]) - 1) + "";
	    end_dt[1] = (Number(end_dt[1]) - 1) + "";
	    var from_dt = new Date(start_dt[0], start_dt[1], start_dt[2]);
	    var to_dt = new Date(end_dt[0], end_dt[1], end_dt[2]);
	    
	    alert("from_dt : " + from_dt);
	    alert("to_dt : " + to_dt);
	
	    return (to_dt.getTime() - from_dt.getTime()) / 1000 / 60 / 60 / 24; */
	}
</script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		var startDate = document.getElementById("datepicker1").value;
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
	}
</script>
<script>
    $(function() {
        $("#datepicker1, #datepicker2").datepicker({
            dateFormat: 'yy-mm-dd'
        });
        var today = new Date();
        //$("#datepicker1").datepicker(); //initialise
        $("#datepicker1").datepicker("setDate", -7);
        //$("#datepicker2").datepicker(); //initialise
        $("#datepicker2").datepicker("setDate", today);
    });
</script>
<style>
	#sendBtn {
		height: 30px;
	}
</style>
<div class="container">
	
	<!-- Page Heading/Breadcrumbs -->
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">My Page
                <small>Health Check</small>
            </h1>
        </div>
    </div>
    <!-- /.row -->
	<c:choose>
			<c:when test="${sessionScope.mvo.istrainer == 'user'}">
				<ul class="nav nav-tabs">
					<li class="menu"><a href="${pageContext.request.contextPath}/userCalendar.do">Health 캘린더</a></li>
					<li class="menu active"><a href="${pageContext.request.contextPath}/userHealthCheck.do">기간 별 칼로리 체크</a></li>
					<li class="menu"><a href="${pageContext.request.contextPath}/bmi_list.do">비만도 측정(BMI)</a></li>
					<li class="menu"><a href="#">팔로우 한 강사 </a></li>
					<li class="menu"><a href="#">1:1 매칭 현황 </a></li>
					<li class="menu"><a href="#">나의 PT 강사</a></li>
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
		<br><br><br>
		<!-- <div id="reportrange" class="pull-right" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc; width: 21%">
		    <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>&nbsp;
		    <span></span> <b class="caret"></b>
		</div> -->

		<p align="center">조회기간: &nbsp;<i class="glyphicon glyphicon-calendar fa fa-calendar"></i> &nbsp;
		    <input type="text" id="datepicker1" value=""> ~
		    <input type="text" id="datepicker2" value="">
		    <input type="button" id="sendBtn" class="btn btn-default" value="OK">
		</p>
		<br><br>
	
		<div id="curve_chart"></div>
	 </div>
	 <br><br><br>