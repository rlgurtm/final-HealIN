<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var order=null;
$(document).ready(function(){
	$("#order").change(function(){
		order=$(this).val();
		trainerListOrder(1);
    });//order change
   
    $(".pagination").on("click", "li", function(){
		$(".pagination .active").removeClass("active");
		 		$(this).addClass("active"); 
		 		order=$("#order").val();
		 		trainerListOrder($(this).val());
		});//on
		$(document).on("click",".more",function(){ 
			alert("로그인한 사용자만 확인할수 있는 정보입니다.");
			});//on	
});
	
</script>
<div class="container">
	<h4> 코치 찾기</h4>

    <!-- Page Content -->

        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
        </div>
  <hr>
  <div id="trainerArea">
   <c:forEach items="${list.LVO}" var="t">
        <!-- 강사 리스트  -->
        <div class="row">
            <div class="col-sm-3 text-center">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/resources/trainerPic/${t.trainerPhoto}" width="750"  height="450">
            </div>
            <div class="col-md-9">
                <h3>이름 : ${t.membervo.name}</h3>
                <h4>지역 : ${t.location}</h4>
                <p>경력사항 : ${t.career}</p>
                <c:choose>
                <c:when test="${mvo.id!=null}">
                <form action="${pageContext.request.contextPath}/trainer/trainerDetail.do" method="post">
                	<input type="hidden" value="${t.membervo.id}" name="trainerId">
                	<input type="submit" value="강사정보 더보기">
                </form>
                </c:when>
                <c:otherwise>
                	<input type="button" value="강사정보 더보기" class="more">
                </c:otherwise>
                </c:choose>
            </div>
        </div>
        <hr>
</c:forEach>
</div>
<div align="center">
		<ul class="pagination">
			<c:set var="pb" value="${list.pb}"></c:set>
				<c:if test="${pb.previousPageGroup}">
					<li class="previous"><a href="${pageContext.request.contextPath}/trainer/trainerList.do?pageNo=${pb.startPageOfPageGroup-1}"> 
					 previous</a></li>	
				</c:if>
		
				<c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
					<c:choose>
						<c:when test="${pb.nowPage!=i}">
							<li><a href="${pageContext.request.contextPath}/trainer/trainerList.do?pageNo=${i}">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li class="active"><a>${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>	    
		
				<c:if test="${pb.nextPageGroup}">
					<li class="next"><a href="${pageContext.request.contextPath}/trainer/trainerList.do?pageNo=${pb.endPageOfPageGroup+1}">
					next</a></li>
				</c:if>
		</ul>
	</div>
        

        
        </div>