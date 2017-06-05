<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script>
	$(document).ready(function() {
		/* $("#backBtn").click(function() {
			location.href = "${pageContext.request.contextPath}/userCalendar.do";
		}); */
		$("#insertBtn").click(function() {
			if (document.getElementById("foodCategory").value == "") {
				alert("카테고리를 선택하세요!");
				$("#foodCategory").focus();
				return;
			}
			if (document.getElementById("foodName").value == "") {
				alert("음식을 선택하세요!");
				$("#foodName").focus();
				return;
			}
			if (document.getElementById("count").value == 0) {
				alert("수량을 입력하세요!");
				$("#count").focus();
				return;
			}
			$("#insertFoodForm").submit();
		});
		$("#updateFood").click(function() {
			$("#updateModal").modal("show");
		});
		$("#foodCategory").change(function() {
			$.ajax({
				type: "post",		// 넘겨주는 방식
				url: "${pageContext.request.contextPath}/getFoodsByCategory.do",	// 보낼 url
				data: "foodCategory=" + document.getElementById("foodCategory").value,	// 넘길 데이타 값
				success: function(foodList) {	// 성공했을 때 결과
					var foodNameInfo = "";
					foodNameInfo += "<option value=''>--음식명--</option>";
					for (var i=0; i<foodList.length; i++) {
						foodNameInfo += "<option value=" + foodList[i] + ">" + foodList[i] + "</option>";
					}
					$("#foodName").html(foodNameInfo); 
				}
			});
		});
	});
</script>
<style>
  /* Icon when the collapsible content is shown */
  .btn-default:after {
    font-family: "Glyphicons Halflings";
    content: "\e114";
    float: right;
    margin-left: 15px;
  }

  /* Icon when the collapsible content is hidden */
  .btn-default.collapsed:after {
    content: "\e080";
  }
  input[type=number]{
    width: 50px;
    height: 25px;
  }
  select {
    height: 25px;
  }     
</style>

    <!-- Page Heading/Breadcrumbs -->
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">My Page
                    <small>Intake Calorie &nbsp;&nbsp;&nbsp;</small>
                    <!-- <input type="button" id="backBtn" value="<< Back to Calendar" style='font-size:15px;'> -->
                </h1>
            </div>
        </div>
        <!-- /.row -->
		
		<c:choose>
			<c:when test="${sessionScope.mvo.istrainer == 'user' }">
				<ul class="nav nav-tabs">
					<li class="menu active"><a href="${pageContext.request.contextPath}/userCalendar.do">캘린더</a></li>
					<li class="menu"><a href="${pageContext.request.contextPath}/user_health_check.do">기간 별 건강 변화 체크</a></li>
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
		
		<br><br>
		<!-- 먹은 음식 입력 -->
		<br>
		<button type="button" class="btn btn-sm btn-default collapsed" data-toggle="collapse" data-target="#demo">먹은 음식 추가</button>
		<div id="demo" class="collapse">
			<br>
			<form id="insertFoodForm" action="${pageContext.request.contextPath}/insertFood.do">
				카테고리 : 
				<%-- jstl로 select option을 생성한다. --%>
				<select id="foodCategory" name="foodCategory" required="required">
					<option value="">--카테고리--</option>
					<c:forEach items="${requestScope.foodCategory}" var="category" >
						<option value="${category}">${category}</option>
					</c:forEach>
				</select>&nbsp;&nbsp;&nbsp;
				음식명 : 
				<select id="foodName" name="foodName" required="required">
					<option value="">--음식명--</option>
				</select>&nbsp;&nbsp;&nbsp;
				수량 : <input type="number" required="required" id="count" name="count">개
				<c:forEach begin="0" end="4">
					&nbsp;
				</c:forEach>
				<a href="#" id="insertBtn"><span class='glyphicon glyphicon-plus'></span></a>
				<input type="hidden" name="id" value="${sessionScope.mvo.id}">
				<input type="hidden" name="date" value="${requestScope.date}">
			</form>
		</div>
		<br><br><br>
		<div align="left"><h5>▶ 섭취한 음식 [${requestScope.date}]</h5></div>
		
		<table class="table table-hover">
			<tbody align="center">
				<tr class="info" style='font-weight:bold;'>
					<td>음식명</td><td>칼로리</td><td>수량</td>
					<td>
						총 칼로리
					</td>
					<td></td>
				</tr>
				<c:forEach items="${requestScope.foodList}" var="food">
					<tr>
						<td>${food.foodName}</td>
						<td>${food.calorie}</td>
						<td>${food.count}</td>
						<td>${food.totalCalorie}</td>
						<td>
							<a href="#" id="updateFood"><span class='glyphicon glyphicon-pencil'></span>&nbsp;&nbsp;</a>
							<a href="${pageContext.request.contextPath}/deleteFood.do?intakeNo=${food.intakeNo}&id=${sessionScope.mvo.id}&date=${requestScope.date}"><span class='glyphicon glyphicon-trash'></span></a>
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="5" align="right" style='font-weight:bold; font-size: 20px;'>총 섭취 칼로리 : ${requestScope.totalCalorie} Kcal</td>
				</tr>
			</tbody>
		</table>
		
		<!-- Modal -->
		<div class="modal fade" id="updateModal" role="dialog">
			<div class="modal-dialog">
	
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header" align="center">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">먹은 음식 수정</h4>
					</div>
					<div class="modal-body">
						<form id="calorieForm" action="${pageContext.request.contextPath}/mypage/updateCalendar.do">
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
	</div>
<!-- 
<script type="text/javascript">
	$(document).ready(function() {
		$("#name").change(function() {
			if (document.getElementById("name").value == "") {
				$("#addressView").text("");	// or $("#addressView").empty();
				alert("이름을 선택하세요!");
				return;
			}
			$.ajax({
				type: "post",		// 넘겨주는 방식
				url: "AddressServlet",	// 보낼 url
				data: "name=" + document.getElementById("name").value,	// 넘길 데이타 값
				success: function(result) {	// 성공했을 때 결과
					$("#addressView").html(result).css("background", "yellow");
				},
				timeout: 1000,
				error: function() {
					alert("timeout error!");
				}
			});
		});
	});
</script>
</head>
<body>
	<select id="name">
		<option value="">-주소검색-</option>
		<option value="기성용">기성용</option>
		<option value="이청용">이청용</option>
		<option value="손흥민">손흥민</option>
	</select>
	<span id="addressView"></span>
</body>
</html>

 -->