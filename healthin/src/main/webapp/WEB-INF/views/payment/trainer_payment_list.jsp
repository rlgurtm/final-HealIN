<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	$(document).ready(function() {
		$(".rateFormBtn").click(function() {
			var trainerId = $(this).closest('tr').find('td:eq(1)').text(); 
			document.getElementById("trainerId").value = trainerId;
			
			/* $.ajax({ 
				type: "post",		// 넘겨주는 방식
				url: "${pageContext.request.contextPath}/ajaxForRating.do",	// 보낼 url
				data: "consumptionNo=" + targetExerciseConsumptionNo,	// 넘길 데이타 값
				success: function(exercise) {	// 성공했을 때 결과
					document.getElementById("updateExerciseConsumptionNo").value = exercise.consumptionNo;
					document.getElementById("updateExerciseExName").value = exercise.exName;
					document.getElementById("updateExerciseExHour").value = exercise.exHour;
					document.getElementById("updateExerciseCalorie").value = exercise.calorie; 
					$("#updateModal").modal("show");
				}
			}); */
  			$("#rateModal").modal("show");
  		});
		$("#rateBtn").click(function() {
			if (document.getElementById("rateContent").value == "") {
				alert("내용을 입력하세요!");
				//$('#type').prop('selectedIndex', 0);
				$("#rateContent").focus();
				return;
			}
			$("#ratingForm").submit();
		});
		$(".payStatus").change(function() {
			var status = $(this).val();
			var trainerId = $(this).closest('tr').find('td:eq(1)').text(); 
			if (status == '입금대기') {
				if (confirm("강사 계좌로 입금하셨습니까?")) {
					location.href = "${pageContext.request.contextPath}/updateUserPayStatus.do?userId=${sessionScope.mvo.id}&trainerId=" + trainerId;
				}
			} else if (status == '결제취소') {
				if (confirm("강사 계좌로 입금하셨습니까?")) {
					location.href = "";
				}
			}
		});
	});
</script>
<style>
	.headTitle {
		font-weight:bold;
	}
	.payStatus {
		height: 25px;
	}
	#rateBtn {
		height: 30px;
	}
</style>
<div class="container">
	<!-- Page Heading/Breadcrumbs -->
    <div class="row">
        <div class="col-lg-12">
            <h2 class="page-header">Payment Status
                <small>결제내역</small>
            </h2>
        </div>
    </div>
    

	<br>
	<c:set value="${requestScope.paymentList.LVO}" var="paymentList"/>
	<table class="table">
		<tbody id="paymentStatusInfo" align="center">
			<tr><!-- style='font-weight:bold;' -->
				<td class="headTitle" style="width:10%;">결제번호</td>
				<td class="headTitle" style="width:15%;">회원ID</td>
				<!-- <th style="width:15%;">닉네임</th> -->
				<td class="headTitle" style="width:20%;">수강기간</td>
				<td class="headTitle" style="width:10%;">가격(원)</td>
				<td class="headTitle" style="width:10%;">결제상태</td>
				<!-- <td class="headTitle" style="width:10%;">강사평점</td> -->
			</tr>
			<c:if test="${!empty paymentList}">
				<c:forEach items="${paymentList}" var="list">
					<tr>
						<td>${list.payNo}</td>
						<td>${list.userId}</td>
						<td>${list.period}개월</td>
						<td>${list.price}</td>
						<%-- <c:choose>
							<c:when test="${list.payState == '입금완료'}"> --%>
								<td style='font-weight:bold;'>${list.payState}</td>
							<%-- </c:when>
							<c:otherwise>
								<td>
									<select class="payStatus" name="payState">
										<option value="">결제현황</option>
										<option value="입금대기">입금대기</option>
										<option value="결제취소">결제취소</option>
									</select>
								</td>
							</c:otherwise>
						</c:choose> --%>
						<%-- <td>
							<c:if test="${list.payState == '입금완료'}">
								<a class="rateFormBtn btn btn-warning" data-target="#rateModal" href="#" data-id="${list.payNo}">평가하기</a>
							</c:if>
						</td> --%>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
 	<div align="right" style='font-weight:bold;'>※ 매칭 완료 후 7일 이내에 결제하지 않으면 결제가 취소됩니다.</div>
	<div align="center">
		<ul class="pagination">
			<c:set var="pb" value="${requestScope.paymentList.pb}"></c:set>
				<c:if test="${pb.previousPageGroup}">
					<li class="previous"><a href="${pageContext.request.contextPath}/paymentList.do?npageNo=${pb.startPageOfPageGroup-1}"> 
					 previous</a></li>	
				</c:if>
		
				<c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
					<c:choose>
						<c:when test="${pb.nowPage != i}">
							<li><a href="${pageContext.request.contextPath}/paymentList.do?pageNo=${i}">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li class="active"><a>${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>	    
		
				<c:if test="${pb.nextPageGroup}">
					<li class="next"><a href="${pageContext.request.contextPath}/paymentList.do?pageNo=${pb.endPageOfPageGroup+1}">
					next</a></li>
				</c:if>
		</ul>
	</div>
	
 </div>