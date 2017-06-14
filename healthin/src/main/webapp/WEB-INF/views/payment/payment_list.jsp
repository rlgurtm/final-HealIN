<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	//star rating
	var starRating = function() {
		var $star = $(".star-input"), $result = $star.find("output>b");
		$(document).on("focusin", ".star-input>.input", function() {
			$(this).addClass("focus");
		}).on("focusout", ".star-input>.input", function() {
			var $this = $(this);
			setTimeout(function() {
				if ($this.find(":focus").length === 0) {
					$this.removeClass("focus");
				}
			}, 100);
		}).on("change", ".star-input :radio", function() {
			$result.text($(this).next().text());
		}).on("mouseover", ".star-input label", function() {
			$result.text($(this).text());
		}).on("mouseleave", ".star-input>.input", function() {
			var $checked = $star.find(":checked");
			if ($checked.length === 0) {
				$result.text("0");
			} else {
				$result.text($checked.next().text());
			}
		});
	};
	starRating();
</script>
<script>
	$(document).ready(function() {
		$(".rateFormBtn").click(function() {
  			$("#rateModal").modal("show");
  		});
		$(".payStatus").change(function() {
			var status = $(this).val();
			if (status == '입금대기') {
				if (confirm("강사 계좌로 입금하셨습니까?")) {
					location.href = "";
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
				<td class="headTitle" style="width:15%;">강사ID</td>
				<!-- <th style="width:15%;">닉네임</th> -->
				<td class="headTitle" style="width:20%;">수강기간</td>
				<td class="headTitle" style="width:10%;">가격(원)</td>
				<td class="headTitle" style="width:10%;">결제상태</td>
				<td class="headTitle" style="width:10%;">강사평가</td>
			</tr>
			<c:if test="${!empty paymentList}">
				<c:forEach items="${paymentList}" var="list">
					<tr>
						<td>${list.payNo}</td>
						<td>${list.trainerId}</td>
						<td>${list.period}개월</td>
						<td>${list.price}</td>
						<c:choose>
							<c:when test="${list.payState == '입금완료'}">
								<td style='font-weight:bold;'>${list.payState}</td>
							</c:when>
							<c:otherwise>
								<td>
									<select class="payStatus" name="payState">
										<option value="">결제현황</option>
										<option value="입금대기">입금대기</option>
										<option value="결제취소">결제취소</option>
									</select>
								</td>
							</c:otherwise>
						</c:choose>
						<td>
							<c:if test="${list.payState == '입금완료'}">
								<a class="rateFormBtn btn btn-warning" data-target="#rateModal" href="#" data-id="${list.payNo}">평가하기</a>
							</c:if>
						</td>
						<%-- <td>${list.memberVO.nickname}</td>
						<td>${list.postedDate}</td>
						<td>${list.hits}</td> --%>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
 	
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
	
	<!-- Modal -->
	<div class="modal fade" id="rateModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" align="center">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">PT 강사 평가</h4>
				</div>
				<div class="modal-body" align="left">
					<form id="inputTypeForm" action="${pageContext.request.contextPath}/calorieType.do">
						<input type="hidden" id="userId" name="userId" value="${list.userId}">
						<input type="hidden" id="trainerId" name="trainerId" value="${list.trainerId}">
						<input type="hidden" id="rate" name="mydate" value="">
						<span class="star-input">
						  <span class="input">
						    <input type="radio" name="star-input" id="p1" value="1"><label for="p1">1</label>
						    <input type="radio" name="star-input" id="p2" value="2"><label for="p2">2</label>
						    <input type="radio" name="star-input" id="p3" value="3"><label for="p3">3</label>
						    <input type="radio" name="star-input" id="p4" value="4"><label for="p4">4</label>
						    <input type="radio" name="star-input" id="p5" value="5"><label for="p5">5</label>
						    <input type="radio" name="star-input" id="p6" value="6"><label for="p6">6</label>
						    <input type="radio" name="star-input" id="p7" value="7"><label for="p7">7</label>
						    <input type="radio" name="star-input" id="p8" value="8"><label for="p8">8</label>
						    <input type="radio" name="star-input" id="p9" value="9"><label for="p9">9</label>
						    <input type="radio" name="star-input" id="p10" value="10" checked="checked"><label for="p10">10</label>
						  </span>
						  <!-- <output id="result" for="star-input"><b>0</b>점</output> -->
						</span><br>
						<textarea rows="3" cols="81" name="content"></textarea>
						<h5 align="right">(80자 이내 작성)</h5>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="rateBtn">OK</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div> <!-- Modal -->
 </div>