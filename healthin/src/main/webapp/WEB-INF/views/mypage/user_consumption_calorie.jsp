<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script>
	$(document).ready(function() {
		/* $("#backBtn").click(function() {
			location.href = "${pageContext.request.contextPath}/userCalendar.do";
		}); */
		$("#deleteBtn").click(function() {
			return confirm("정말 삭제하시겠습니까?");
		});
		$("#insertBtn").click(function() {
			if (document.getElementById("exCategory").value == "") {
				alert("카테고리를 선택하세요!");
				$("#exCategory").focus();
				return;
			}
			if (document.getElementById("exName").value == "") {
				alert("운동을 선택하세요!");
				$("#exName").focus();
				return;
			}
			if (document.getElementById("insertCount").value == 0) {
				alert("시간(분)을 입력하세요!");
				$("#insertCount").focus();
				return;
			}
			$("#insertExerciseForm").submit();
		});
		$(".updateFormBtn").click(function() {
			var targetExerciseConsumptionNo = $(this).data("id");
			$.ajax({
				type: "post",		// 넘겨주는 방식
				url: "${pageContext.request.contextPath}/getExerciseByConsumptionNo.do",	// 보낼 url
				data: "consumptionNo=" + targetExerciseConsumptionNo,	// 넘길 데이타 값
				success: function(exercise) {	// 성공했을 때 결과
					document.getElementById("updateExerciseConsumptionNo").value = exercise.consumptionNo;
					document.getElementById("updateExerciseExName").value = exercise.exName;
					document.getElementById("updateExerciseExHour").value = exercise.exHour;
					document.getElementById("updateExerciseCalorie").value = exercise.calorie; 
					$("#updateModal").modal("show");
				}
			});
		});
		$("#updateBtn").click(function() {
			if (document.getElementById("updateExerciseExHour").value <= 0) {
				alert("수량을 0 이상으로 입력하세요!");
				$("#updateExerciseCount").focus();
				return;
			}
			$("#updateExerciseForm").submit();
		});
		$("#exCategory").change(function() {
			$.ajax({
				type: "post",		// 넘겨주는 방식
				url: "${pageContext.request.contextPath}/getExercisesByCategory.do",	// 보낼 url
				data: "exCategory=" + document.getElementById("exCategory").value,	// 넘길 데이타 값
				dataType: "json",
				success: function(exList) {	// 성공했을 때 결과
					var exNameInfo = "";
					exNameInfo += "<option value=''>--운동명--</option>";
					for (var i=0; i<exList.length; i++) {
						exNameInfo += "<option value=" + exList[i] + ">" + exList[i] + "</option>";
					}
					$("#exName").html(exNameInfo); 
				}
			});
		});
	});
</script>
<style>
  /* Icon when the collapsible content is shown */
  #toggleBtn:after {
    font-family: "Glyphicons Halflings";
    content: "\e114";
    float: right;
    margin-left: 15px;
  }

  /* Icon when the collapsible content is hidden */
  #toggleBtn.collapsed:after {
    content: "\e080";
  }
  input[type=number]{
    width: 40px;
    height: 25px;
  }
  select {
    height: 25px;
  }     
  #updateExerciseCalorie {
 	 width:50px;
  }
  #updateExerciseExHour {
 	 width:50px;
  }
  #updateExerciseExName {
  	 width:100px;
  }
</style>

    <!-- Page Heading/Breadcrumbs -->
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">My Page
                    <small>Consumption Calorie &nbsp;&nbsp;&nbsp;</small>
                    <!-- <input type="button" id="backBtn" value="<< Back to Calendar" style='font-size:15px;'> -->
                </h1>
            </div>
        </div>
        <!-- /.row -->
		
		<c:choose>
			<c:when test="${sessionScope.mvo.istrainer == 'user'}">
				<ul class="nav nav-tabs">
					<li class="menu active"><a href="${pageContext.request.contextPath}/userCalendar.do">Health 캘린더</a></li>
					<li class="menu"><a href="${pageContext.request.contextPath}/user_health_check.do">기간 별 칼로리 체크</a></li>
					<li class="menu"><a href="#">비만도 측정(BMI)</a></li>
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
		
		<br><br>
		<!-- 먹은 음식 입력 -->
		<br>
		<button id="toggleBtn" type="button" class="btn btn-sm btn-default collapsed" data-toggle="collapse" data-target="#demo">한 운동 추가</button>
		<div id="demo" class="collapse">
			<br>
			<form id="insertExerciseForm" action="${pageContext.request.contextPath}/insertExercise.do">
				카테고리 : 
				<%-- jstl로 select option을 생성한다. --%>
				<select id="exCategory" name="exCategory" required="required">
					<option value="">--카테고리--</option>
					<c:forEach items="${requestScope.exCategory}" var="category" >
						<option value="${category}">${category}</option>
					</c:forEach>
				</select>&nbsp;&nbsp;&nbsp;
				운동명 : 
				<select id="exName" name="exName" required="required">
					<option value="">--운동명--</option>
				</select>&nbsp;&nbsp;&nbsp;
				시간(분) : <input type="number" required="required" id="insertCount" name="exHour">분
				<c:forEach begin="0" end="4">
					&nbsp;
				</c:forEach>
				<a href="#" id="insertBtn"><span class='glyphicon glyphicon-plus'></span></a>
				<input type="hidden" name="id" value="${sessionScope.mvo.id}">
				<input type="hidden" name="date" value="${requestScope.date}">
			</form>
		</div>
		<br><br><br>
		<div align="left"><h5>▶ 한 운동 [${requestScope.date}]</h5></div>
		
		<table class="table table-hover">
			<tbody align="center" id="doneFoodTable">
				<tr class="info" style='font-weight:bold;'>
					<td>운동명</td><td>칼로리(분)</td><td>시간(분)</td>
					<td>
						총 칼로리
					</td>
					<td></td>
				</tr>
				<c:forEach items="${requestScope.exList}" var="exercise">
					<tr>
						<td>${exercise.exName}</td>
						<td>${exercise.calorie}</td>
						<td>${exercise.exHour}</td>
						<td>${exercise.totalCalorie}</td>
						<td>
							<a id="updateForm" class="updateFormBtn" data-target="#updateModal" href="#" data-id="${exercise.consumptionNo}"><span class='glyphicon glyphicon-pencil'></span>&nbsp;&nbsp;</a>
							<a id="deleteBtn" href="${pageContext.request.contextPath}/deleteExercise.do?consumptionNo=${exercise.consumptionNo}&id=${sessionScope.mvo.id}&date=${requestScope.date}"><span class='glyphicon glyphicon-trash'></span></a>
						</td>
					</tr>
				</c:forEach>
				<c:choose>
					<c:when test="${requestScope.exList == null}">
						<tr>
							<td colspan="5" align="right" style='font-weight:bold; font-size: 20px;'>총 섭취 칼로리 : 0 Kcal</td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5" align="right" style='font-weight:bold; font-size: 20px;'>총 섭취 칼로리 : ${requestScope.totalCalorie} Kcal</td>
						</tr>
					</c:otherwise>
				</c:choose>
				
			</tbody>
		</table>
		<br><br><br>
		<div align="right">[ ※총 칼로리 = 칼로리(분) x 시간(분) x 몸무게 ]</div>
		
		<!-- Modal -->
		<div class="modal fade" id="updateModal" role="dialog">
			<div class="modal-dialog">
	
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header" align="center">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">한 운동 수정</h4>
					</div>
					<div class="modal-body">
						<form id="updateExerciseForm" action="${pageContext.request.contextPath}/updateExercise.do">
							<input type="hidden" name="consumptionNo" id="updateExerciseConsumptionNo" value="">
							<input type="hidden" name="id" id="id" value="${sessionScope.mvo.id}">
							<input type="hidden" name="date" id="date" value="${requestScope.date}">
							운동명 : <input type="text" name="exName" id="updateExerciseExName" value="" readonly="readonly">&nbsp;&nbsp;&nbsp;&nbsp;
							시간(분) : <input type="number" name="exHour" id="updateExerciseExHour"  value="" required="required"> 분 &nbsp;&nbsp;
							(1분 기준 칼로리 : <input type="text" name="calorie" id="updateExerciseCalorie" value="" readonly="readonly"> Kcal)
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" id="updateBtn">Update</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		
		<br><br><br>
	</div>