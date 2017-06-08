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
    		var date1 = document.getElementById("datepicker1").value;
    		var date2 = document.getElementById("datepicker2").value;
    		date1 = date1.replace(/\-/g,''); 	//특정문자 제거
    		date2 = date2.replace(/\-/g,'');
    		date1 = Number(date1);
    		date2 = Number(date2);
    		if (date2 - date1 < 0) {
    			alert("시작일을 종료일 보다 작게 선택해주세요.");
    			return false;
    		}
    		location.href = "";
    	});
    });
</script>
<!-- <script type="text/javascript">
	$(function() {
	    var start = moment().subtract(29, 'days');
	    var end = moment();
	
	    function cb(start, end) {
	        $('#reportrange span').html(start.format('YYYY-MM-DD') + ' ~ ' + end.format('YYYY-MM-DD'));
	        //alert($("#reportrange").text()); 
	    }
	
	    $('#reportrange').daterangepicker({
	        startDate: start,
	        endDate: end,
	        ranges: {
	           'Today': [moment(), moment()],
	           'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
	           'Last 7 Days': [moment().subtract(6, 'days'), moment()],
	           'Last 30 Days': [moment().subtract(29, 'days'), moment()],
	           'This Month': [moment().startOf('month'), moment().endOf('month')],
	           'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
	        }
	    }, cb);
	    cb(start, end);
	});
</script> -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Date', '섭취량', '소모량'],
          ['2004',  1000,      400],
          ['2005',  1170,      460],
          ['2006',  660,       1120],
          ['2007',  1030,      540],
          ['2017',  1030,      540]
        ]);

        var options = {
          title: '기간 별 칼로리 섭취/소모량',
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
					<li class="menu active"><a href="${pageContext.request.contextPath}/userCalendar.do">Health 캘린더</a></li>
					<li class="menu"><a href="${pageContext.request.contextPath}/user_health_check.do">기간 별 칼로리 체크</a></li>
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
		    <input type="text" id="datepicker1"> ~
		    <input type="text" id="datepicker2">
		    <input type="button" id="sendBtn" class="btn btn-default" value="OK">
		</p>
		<br><br>
	
		<div id="curve_chart"></div>
	 </div>
	 <br><br><br>