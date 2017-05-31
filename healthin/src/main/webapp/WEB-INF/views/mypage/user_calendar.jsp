<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	$(document).ready(function() {
		$(":input[name=type]").change(function() {		// 입력부분 ajax ~ing
			alert($(this).val());
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/mypage/user_calendar.do",
				//data:"address="+addrValue,
				dataType:"json",
				success:function(jsonList){					
					var data = JSON.parse(jsonList);
					alert(data);
				}//function
			});//ajax
		});
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			defaultDate: '2017-05-12',
			navLinks: true, // can click day/week names to navigate views
			selectable: true,
			selectHelper: true,
			select: function(start, end) {
				/* var title = prompt('Event Title:'); */	// 기존 타이틀 입력하라는 alert 비슷한거였음
				var eventData;
				/* if (title) {
					eventData = {
						title: title,
						start: start,
						end: end
					};
					$('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
				} */
				$('#calendar').fullCalendar('unselect');
			},
			
			/* jsEvent : 클릭한 좌표에 접근 가능 */
			/* dayClick: function(date, jsEvent, view) {    
	            alert('Clicked on: ' + date.format());
	            alert('Coordinates: ' + jsEvent.pageX + ', ' + jsEvent.pageY);	// 좌표
	            alert('Current view: ' + view.name);
	        }, */
	        dayClick: function(date, jsEvent, view) {
	            $("#myModal").modal("show");
	        },
	        
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			
			/* eventRender: function (event, element) {
		        element.attr('href', 'javascript:void(0);');
		        element.click(function() {
		            $("#startTime").html(moment(event.start).format('MMM Do h:mm A'));
		            $("#endTime").html(moment(event.end).format('MMM Do h:mm A'));
		            $("#eventInfo").html(event.description);
		            $("#eventLink").attr('href', event.url);
		            $("#eventContent").dialog({ modal: true, title: event.title, width:350});
		        });
		    }, */
			
			events: [
				{
					title: 'All Day Event',
					start: '2017-05-01',
					url: 'http://google.com/'
				},
				{
					title: 'Long Event',
					start: '2017-05-07',
					end: '2017-05-10'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: '2017-05-09T16:00:00'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: '2017-05-16T16:00:00'
				},
				{
					title: 'Conference',
					start: '2017-05-11',
					end: '2017-05-13'
				},
				{
					title: 'Meeting',
					start: '2017-05-12T10:30:00',
					end: '2017-05-12T12:30:00'
				},
				{
					title: 'Lunch',
					start: '2017-05-12T12:00:00'
				},
				{
					title: 'Meeting',
					start: '2017-05-12T14:30:00'
				},
				{
					title: 'Happy Hour',
					start: '2017-05-12T17:30:00'
				},
				{
					title: 'Dinner',
					start: '2017-05-12T20:00:00'
				},
				{
					title: 'Birthday Party',
					start: '2017-05-13T07:00:00'
				},
				{
					title: 'Click for Google',
					url: 'http://google.com/',
					start: '2017-05-28'
				}
			],
			eventClick: function(event) {
		        if (event.url) {
		        	window.open("", "", "width=200,height=100");
		            return false;
		        }
		    }
		});
	});
</script>
<script>
  	$(document).ready(function(){
    	$(".menu").click(function(){
        	$(".active").removeClass("active");
        	$(this).addClass("active");
        });
    
    });
</script>
<style>
	/* body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	} */

	#calendar {
		max-width: 900px;
		margin: 0 auto;
	}
</style>

    <!-- Page Content -->
    <div class="container">

        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">My Page
                    <small>My Page</small>
                </h1>
            </div>
        </div>
        <!-- /.row -->
		
		<c:choose>
			<c:when test="${sessionScope.mvo.istrainer == 'user' }">
				<ul class="nav nav-tabs">
					<li class="menu active"><a href="${pageContext.request.contextPath}/mypage/user_calendar.do">캘린더</a></li>
					<li class="menu"><a href="${pageContext.request.contextPath}/mypage/user_health_check.do">기간 별 건강 변화 체크</a></li>
					<li class="menu"><a href="#">비만도 측정</a></li>
					<li class="menu"><a href="#">팔로우 한 강사 </a></li>
					<li class="menu"><a href="#">팔로우 한 강사 동영상</a></li>
					<li class="menu"><a href="#">PT 결제 현황</a></li>
					<li class="menu"><a href="#">나의 PT 강사</a></li>
				</ul>
			</c:when>
			<c:when test="${sessionScope.mvo.istrainer == 'trainer' }">
				<ul class="nav nav-tabs">
					<li class="menu active"><a href="#">팔로워 관리</a></li>
					<li class="menu"><a href="#">PT 결제 현황</a></li>
					<li class="menu"><a href="#">나의 PT 회원</a></li>
				</ul>
			</c:when>
		</c:choose>
		
		<br><br><br>
	
        <!-- <div>
            Content Column
            <div class="col-md-9">
                <h2>Section Heading</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Soluta, et temporibus, facere perferendis veniam beatae non debitis, numquam blanditiis necessitatibus vel mollitia dolorum laudantium, voluptate dolores iure maxime ducimus fugit.</p>
            </div>
        </div><br> -->
        <!-- /.row -->
        
        <div id="calendar"></div>
        <!-- <div id="eventContent" title="Event Details" style="display:none;">
		    Start: <span id="startTime"></span><br>
		    End: <span id="endTime"></span><br><br>
		    <p id="eventInfo"></p>
		    <p><strong><a id="eventLink" href="" target="_blank">Read More</a></strong></p>
		</div> -->
		
	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Modal Header</h4>
				</div>
				<div class="modal-body">
					<form id="calorieForm" action="${pageContext.request.contextPath}/mypage/update_calendar.do">
						<select name="type">
							<option>----</option>
							<option>섭취</option>
							<option>소비</option>
						</select>
					</form>
					<div id="typeInfo"></div>
				</div>
				<div class="modal-footer">
					<button type="button" id="testBtn">테스트</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>

	<br><br><br>
        <hr>
        

    </div>
    <!-- /.container -->
