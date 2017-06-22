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
<script type="text/javascript">
function existcheckMatching(userId,trainerId){
	$.ajax({
		type:"get",
		url:"${pageContext.request.contextPath}/countExistMatching.do",
		data:"userId="+userId+"&trainerId="+trainerId,
		success:function(data){
			if(data==0){
				var info="";	
				info+="<h2>Matching 신청</h2>";
				info+="<form action='${pageContext.request.contextPath}/userMatching.do' method='post'>";
				info+="<table  class='table table-bordered' style='width:30%;'>";
				info+="<thead><tr><th>기간(개월)</th><th>수락</th></tr></thead>";
				info+="<tbody><tr><td><select name='period'>";
				info+="<option value='1'>1</option>";
				info+="<option value='2'>2</option>";
				info+="<option value='3'>3</option>";
				info+="<option value='4'>4</option>";
				info+="<option value='5'>5</option>";
				info+="<option value='6'>6</option></select></td>";
				info+="<td><input type='submit' value='신청'>";
				info+="<input type='hidden' name='trainerId' value="+$("#trainerId").val()+"></td>";
				info+="</tr></tbody></table></form>";
				info+="	&nbsp;※ 모든 온라인 Pt 비용은 월 만원입니다";
				
				$("#matchingInfo").html(info);		
			}
			
		}
	});
}
$(document).ready(function(){
	$.ajax({
		type:"get",
		url:"${pageContext.request.contextPath}/selectfollowstate.do",
		data:"memId=${mvo.id}&trainerId="+$("#trainerId").val(),
		success:function(data){
			if(data=='Y'){
                $("#imgtd").html("<img class='img-responsive heartimg' src='${pageContext.request.contextPath}/resources/img/heart-red.png' width='50'>");
                existcheckMatching("${mvo.id}",$("#trainerId").val());
             }else{
                $("#imgtd").html("<img class='img-responsive heartimg' src='${pageContext.request.contextPath}/resources/img/heart-gray.png' width='50'>");
                $("#matchingInfo").html("");   
             }
		}//success
	}); //ajax
	$(".rateFormBtn").click(function() {
		var rateNo = $(this).closest('tr').find('td:eq(0)').text(); 
		document.getElementById("rateNo").value = rateNo;
		$.ajax({
			type: "post",		// 넘겨주는 방식
			url: "${pageContext.request.contextPath}/getRatingByRateNo.do",	// 보낼 url
			data: "rateNo=" + rateNo,	// 넘길 데이타 값
			success: function(rate) {	// 성공했을 때 결과
				/* document.getElementById("rateNo").value = rate.rate; */
				document.getElementById("rateContent").value = rate.content;
				$("#p"+rate.rate).prop("checked", true)
				$("#updateModal").modal("show");
			}
		});
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
	$("#imgtd").click(function(){
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/updatefollowState.do",
				data: "trainerId="+$("#trainerId").val(),
				success:function(data){
					if(data=='Y'){
						$("#imgtd").html("<img class='img-responsive heartimg' 
								src='${pageContext.request.contextPath}/resources/img/heart-red.png' width='50'>");
						existcheckMatching("${mvo.id}",$("#trainerId").val());
					}else{
						$("#imgtd").html("<img class='img-responsive heartimg' 
								src='${pageContext.request.contextPath}/resources/img/heart-gray.png' width='50'>");
						$("#matchingInfo").html("");	
					}
				}//function
			});//ajax
		});//click
	});//ready
</script>
<style>
	.headTitle {
		font-weight:bold;
	}
	#staroffImgAvg {
		margin-left: -7px
	}
	#staroffImg {
		margin-left: -4px
	}
</style>
<div class="container">

	<!-- Page Heading/Breadcrumbs -->
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				강사 상세보기
			</h1>
			
		</div>
	</div>
	<!-- /.row -->

	<!-- Intro Content -->
	<div class="row">
		<div class="col-md-6">
			<img class="img-responsive" src="${pageContext.request.contextPath}/resources/trainerPic/${tvo.trainerPhoto}" width="750"  height="450">
		</div>
		<div class="col-md-6">
		<table >
			<tr>
			<td><h2>이름 : </h2></td><td><h2>${tvo.membervo.name}</h2></td>
			</tr>
			<tr>
			<td><h4>전화번호 : </h4></td><td><h4>${tvo.membervo.tel}</h4></td>
			</tr>
			<tr>
			<td><h4>메일 : </h4></td><td><h4>${tvo.membervo.email}</h4></td>
			</tr>
			<tr>
			<td><h4>지역 : </h4></td><td><h4>${tvo.location}</h4></td>
			</tr>
			<tr>
			<td><h4>경력사항 : </h4></td><td><h4>${tvo.career}</h4></td>
			</tr>
			<c:if test="${mvo.istrainer.equals('user')}">
			<tr>
			<th>팔로잉</th>
			<td id="imgtd"></td>
			</tr>
			</c:if>
			<tr>
			<th colspan="2">팔로워 :  ${tvo.count}</th></tr>
			
		</table><br>
		<c:if test="${sessionScope.mvo.istrainer == 'user' }">
		<div id="matchingInfo"></div></c:if>
		</div>
	</div>
<input type="hidden" id="trainerId" value="${tvo.membervo.id}">
	
<br><br>	

	<!-- Team Members -->
	<div class="row">
		<div class="col-lg-12">
			<h2 class="page-header">강사님의 동영상</h2>
		</div>
		<c:forEach items="${listVO.LVO}" var="lvo">
		<div class="col-md-4 text-center">
			<div class="thumbnail">
				<!-- <img class="img-responsive" src="http://placehold.it/750x450" alt=""> -->
				<div class="caption">
					<a href="${pageContext.request.contextPath}/trainerVideoShow.do?videoNo=${lvo.videoNo}#loca">
						<video width="270" height="200">
							<source
								src="${pageContext.request.contextPath}/resources/video/${lvo.videoFile}"
								type="video/mp4">
						</video>
					</a>
					<h3>
						${lvo.title}<br> <small></small>
					</h3>
					<p>
					작성자 : ${lvo.trainerId}<br>
					추천 : ${lvo.likeState}<br> 
					분류 : ${lvo.category}<br>
					조회수 : ${lvo.hits}<br> 
					등록일 : ${lvo.postedDate}<br>
					${lvo.content}<br>
					</p>
				</div>
			</div>
		</div>
		</c:forEach>
		
		<br><br><br><br>
		<div class="col-lg-12">
			<h2 class="page-header">강사 후기</h2>
		</div>
		<c:forEach begin="1" end="8">
			<br>
		</c:forEach>
		<div>
			<h3 align="right">
				<c:set value="${avgRate / 2}" var="shares"/>
				<c:set value="${avgRate % 2}" var="rest"/>
				<c:set value="${(10 - avgRate) / 2}" var="staroff"/>
				<c:forEach begin="1" end="${shares}">
					<img src="${pageContext.request.contextPath}/resources/img/staron.png" width="20px" height="20px">
				</c:forEach>
				<c:if test="${rest != 0}">
					<img src="${pageContext.request.contextPath}/resources/img/staron(half).png" width="10px" height="20px">
					<img id="staroffImgAvg" src="${pageContext.request.contextPath}/resources/img/staroff(half).png" width="10px" height="20px">
				</c:if>
				<c:forEach begin="1" end="${staroff}">
					<img src="${pageContext.request.contextPath}/resources/img/staroff.png" width="20px" height="20px">
				</c:forEach>
				<font color="black">${avgRate}</font> 
				<c:choose>
					<c:when test="${requestScope.totalRatingCount == null}">
						<font size="2px">(0명 참여)</font>
					</c:when>
					<c:otherwise>
						<font size="2px" >(${requestScope.totalRatingCount}명 참여)</font>
					</c:otherwise>
				</c:choose>
			</h3>
		</div>
		<br>
		<div>
			<c:set value="${requestScope.rateList.LVO}" var="rateList"/>
			<%-- <c:set value="${requestScope.rateList.LVO}" var="rateList"/> --%>
			<table class="table table-condensed">
				<tbody id="" align="center">
					<tr><!-- style='font-weight:bold;' -->
						<td style="width:2%;"></td>
						<td class="headTitle" style="width:15%;">평점</td>
						<td class="headTitle" style="width:10%;">회원 ID</td>
						<td class="headTitle" style="width:35%;">내용</td>
						<td class="headTitle" style="width:15%;">평가일</td>
						<td style="width:12%;"></td>
					</tr>
					<c:if test="${!empty rateList}">
						<c:forEach items="${rateList}" var="list">
							<tr>
								<td><font color="white">${list.rateNo}</font></td>
								<td align="left">
									<c:set value="${list.rate / 2}" var="shares"/>
									<c:set value="${list.rate % 2}" var="rest"/>
									<c:set value="${(10 - list.rate) / 2}" var="staroff"/>
									<c:forEach begin="1" end="${shares}">
										<img src="${pageContext.request.contextPath}/resources/img/staron.png" width="20px" height="20px">
									</c:forEach>
									<c:if test="${rest != 0}">
										<img src="${pageContext.request.contextPath}/resources/img/staron(half).png" width="10px" height="20px">
										<img id="staroffImg" src="${pageContext.request.contextPath}/resources/img/staroff(half).png" width="10px" height="20px">
									</c:if>
									<c:forEach begin="1" end="${staroff}">
										<img src="${pageContext.request.contextPath}/resources/img/staroff.png" width="20px" height="20px">
									</c:forEach>
									&nbsp;(${list.rate})
								</td>
								<td>${list.userId}</td>
								<td>${list.content}</td>
								<td>${list.rateDate}</td>
								<td>
									<c:if test="${sessionScope.mvo.id == list.userId}">
										<a class="rateFormBtn" href="#">수정</a>&nbsp;
										<a href="${pageContext.request.contextPath}/deleteRate.do?rateNo=${list.rateNo}&trainerId=${list.trainerId}">삭제</a>
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
		<div align="center">
			<ul class="pagination">
				<c:set var="pb" value="${requestScope.rateList.pb}"></c:set>
					<c:if test="${pb.previousPageGroup}">
						<li class="previous"><a href="${pageContext.request.contextPath}/trainerDetail.do?pageNo=${pb.startPageOfPageGroup-1}"> 
						 previous</a></li>	
					</c:if>
			
					<c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
						<c:choose>
							<c:when test="${pb.nowPage != i}">
								<li><a href="${pageContext.request.contextPath}/trainerDetail.do?pageNo=${i}&trainerId=${requestScope.trainerId}">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li class="active"><a>${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>	    
			
					<c:if test="${pb.nextPageGroup}">
						<li class="next"><a href="${pageContext.request.contextPath}/trainerDetail.do?pageNo=${pb.endPageOfPageGroup+1}">
						next</a></li>
					</c:if>
			</ul>
		</div>
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
					<form id="ratingForm" action="${pageContext.request.contextPath}/updateRate.do">
						<input type="hidden" id="userId" name="userId" value="${sessionScope.mvo.id}">
						<input type="hidden" id="trainerId" name="trainerId" value="${requestScope.trainerId}">
						<input type="hidden" id="rateNo" name="rateNo" value="">
						<!-- <input type="hidden" id="rate" name="mydate" value=""> -->
						<span class="star-input">
						  <span class="input">
						    <input type="radio" name="rate" id="p1" value="1"><label for="p1">1</label>
						    <input type="radio" name="rate" id="p2" value="2"><label for="p2">2</label>
						    <input type="radio" name="rate" id="p3" value="3"><label for="p3">3</label>
						    <input type="radio" name="rate" id="p4" value="4"><label for="p4">4</label>
						    <input type="radio" name="rate" id="p5" value="5" checked="checked"><label for="p5">5</label>
						    <input type="radio" name="rate" id="p6" value="6"><label for="p6">6</label>
						    <input type="radio" name="rate" id="p7" value="7"><label for="p7">7</label>
						    <input type="radio" name="rate" id="p8" value="8"><label for="p8">8</label>
						    <input type="radio" name="rate" id="p9" value="9"><label for="p9">9</label>
						    <input type="radio" name="rate" id="p10" value="10"><label for="p10">10</label>
						  </span>
						  <!-- <output id="result" for="star-input"><b>0</b>점</output> -->
						</span><br>
						<textarea id="rateContent" rows="3" cols="81" name="content"></textarea>
						<h5 align="right">(100자 이내 작성)</h5>
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