<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	$(document).ready(function() {
		$(".menu").click(function(){
        	$(".active").removeClass("active");
        	$(this).addClass("active");
        });
		var mydate = "";
		$("#typeSendBtn").click(function() {
			if (document.getElementById("type").value == "") {
				alert("타입을 선택하세요!");
				$('#type').prop('selectedIndex', 0);
				$("#type").focus();
				return;
			}
			$("#inputTypeForm").submit();
    	});
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			//defaultDate: '2017-05-12',
			navLinks: true, // can click day/week names to navigate views
			selectable: true,
			selectHelper: true,
			select: function(start, end) {
				$('#calendar').fullCalendar('unselect');
			},
	        dayClick: function(date, jsEvent, view) {
	        	var date = date.format();
	        	document.getElementById("mydate").value = date;
	            $("#myModal").modal("show");
	        },
	        eventStartEditable: false,
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			events: '${pageContext.request.contextPath}/ajaxCalendar.do?id=${sessionScope.mvo.id}'
		});
	});
</script>
<style>
	#calendar {
		max-width: 900px;
		margin: 0 auto;
	}
	
	select {
		height: 25px;
	}
</style>

    <!-- Page Content -->
    <div class="container">
        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">My Page
                    <small>My Calendar</small>
                </h1>
            </div>
        </div>
        <!-- /.row -->
		
		<c:choose>
			<c:when test="${sessionScope.mvo.istrainer == 'user'}">
				<ul class="nav nav-tabs">
					<li class="menu active"><a href="${pageContext.request.contextPath}/userCalendar.do">Health 캘린더</a></li>
					<li class="menu"><a href="${pageContext.request.contextPath}/userHealthCheck.do">기간 별 칼로리 체크</a></li>
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
		
        <div id="calendar"></div>
		
		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header" align="center">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">섭취칼로리 or 소비칼로리 선택</h4>
					</div>
					<div class="modal-body" align="center">
						<form id="inputTypeForm" action="${pageContext.request.contextPath}/calorieType.do">
							<input type="hidden" id="id" name="id" value="${sessionScope.mvo.id}">
							<input type="hidden" id="mydate" name="mydate" value="">
							<div id="tmp"></div>
							<select id="type" name="type">
								<option value="">--타입선택--</option>
								<option value="intakeCalorie">섭취칼로리</option>
								<option value="consumptionCalorie">소비칼로리</option>
							</select>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" id="typeSendBtn">OK</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	
		<br><br><br>
	    <hr>
    </div>
    <!-- /.container -->