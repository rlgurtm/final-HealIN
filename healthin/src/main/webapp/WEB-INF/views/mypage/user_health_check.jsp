<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
  	$(document).ready(function(){
  		$("#test").click(function() {
  			$("#myModal").modal("show");
  		});
  		$("#typeSendBtn").click(function() {
  			var st = $(":input:radio[name=star-input]:checked").val();
  			//alert(st);
  		});
    	$(".menu").click(function(){
        	$(".active").removeClass("active");
        	$(this).addClass("active");
        });
    	$(function() {
            $("#datepicker1, #datepicker2").datepicker({
                dateFormat: 'yy-mm-dd'
            });
            var today = new Date();
            $("#datepicker1").datepicker("setDate", -7);
            $("#datepicker2").datepicker("setDate", today);
        });
    	function calDateRange(date1, date2) {
    		//alert(date1 + " " + date2);
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
    	    var day_gap = (end_date - start_date) / (1000*60*60*24);
    	  
    	    if (day_gap < 0) {
    	    	alert("시작일을 종료일 보다 작게 선택해주세요.");
    	    	return false;
    	    } else {
    	    	return day_gap;
    	    }
    	}
    	$("#selPeriod1").click(function() {
    		$("#datepicker1").datepicker("setDate", -7);
            $("#datepicker2").datepicker("setDate", new Date());
    	});
		$("#selPeriod2").click(function() {
			$("#datepicker1").datepicker("setDate", -31);
            $("#datepicker2").datepicker("setDate", new Date());
		});
		$("#selPeriod3").click(function() {
			$("#datepicker1").datepicker("setDate", -365);
            $("#datepicker2").datepicker("setDate", new Date());
		});
    	$("#sendBtn").click(function() {
    		var startDate = document.getElementById("datepicker1").value;
    		var endDate = document.getElementById("datepicker2").value;
    		var day_gap = calDateRange(startDate, endDate);
    		/* if (day_gap > 7 && day_gap <32) {
    			alert("선택한 기간이 7일 초과 50일 미만 : 주별로 6주차 보여줌(아마도 평균)");
    		} else if (day_gap > 7 && day_gap <32) { */
    		startDate = startDate.replace(/\-/g,''); 	//특정문자 제거
    		endDate = endDate.replace(/\-/g,'');
    		startDate = Number(startDate);
    		endDate = Number(endDate);
    		$.ajax({
				type: "post",		// 넘겨주는 방식
				url: "${pageContext.request.contextPath}/ajaxGraphData.do",	// 보낼 url
				data: "startDate=" + startDate + "&endDate=" + endDate + "&id=${sessionScope.mvo.id}",	// 넘길 데이타 값
				success: function(jsonData) {	// 성공했을 때 결과
					var data = new google.visualization.DataTable();
	        		data.addColumn('string', 'Date'); 
	        		data.addColumn('number', '섭취량', '');
	        		data.addColumn('number', '소모량', '');
	        		data.addRows(jsonData.length);	//data.addRows(7);
	        		
	        		for (var i=0; i<jsonData.length; i++) {
	        			data.setCell(i, 0, jsonData[i].date);
	        			data.setCell(i, 1, jsonData[i].totalIntakeCalorie);
	        			data.setCell(i, 2, jsonData[i].totalConsumptionCalorie);
	        		}
	        		
	                var options = {
	                  title: '기간 별 칼로리 섭취/소모량',
	                  legend: { position: 'bottom' }
	                };
	                var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
	                chart.draw(data, options);
				}
			});
    	});
    });
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
            	/* startDate = startDate.replace(/\-/g,''); 	//특정문자 제거
        		endDate = endDate.replace(/\-/g,'');
        		startDate = Number(startDate); */
        		
        		
            	var data = new google.visualization.DataTable();
        		data.addColumn('string', 'Date'); 
        		data.addColumn('number', '섭취량', '');
        		data.addColumn('number', '소모량', '');
        		data.addRows(jsonData.length);	//data.addRows(7);
        		
        		for (var i=0; i<jsonData.length; i++) {
        			data.setCell(i, 0, jsonData[i].date);
        			data.setCell(i, 1, jsonData[i].totalIntakeCalorie);
        			data.setCell(i, 2, jsonData[i].totalConsumptionCalorie);
        		}
        		
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
		<p align="center">
			<input type="button" id="selPeriod1" class="btn btn-success" value="Last 7 Days">&nbsp;&nbsp;
			<input type="button" id="selPeriod2" class="btn btn-success" value="Last 30 Days">&nbsp;&nbsp;
			<input type="button" id="selPeriod3" class="btn btn-success" value="Last 365 Days">
		</p>
		<br>
		<p align="center">조회기간: &nbsp;<i class="glyphicon glyphicon-calendar fa fa-calendar"></i> &nbsp;
		    <input type="text" id="datepicker1" value=""> ~
		    <input type="text" id="datepicker2" value="">
		    <input type="button" id="sendBtn" class="btn btn-default" value="OK">
		</p>
		<br><br>
	
		<div id="curve_chart"></div>
		
	 </div>
	 <br><br><br>