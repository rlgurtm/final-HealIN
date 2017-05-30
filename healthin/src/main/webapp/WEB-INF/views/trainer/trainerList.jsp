<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
$(document).ready(function(){
	$("#order").change(function(){
		$.ajax({
 				type:"get",
 				url:"${pageContext.request.contextPath}/tipcategory.do",
 				data:"category="+$(this).text(),
 				dataType:"json",
 				success:function(data){
 			 	  	var info="";
					for(var i=0;i<data.lvo.length;i++){
 						info+="<tr><td>"+data.lvo[i].no+"</td>";
 						info+="<td>"+data.lvo[i].title+"</td>";
 						info+="<td>"+data.lvo[i].memberVO.name+"</td>";
 						info+="<td>"+data.lvo[i].posted_date+"</td>";
 						info+="<td>"+data.lvo[i].hits+"</td></tr>";
 					} 
	});
});
</script>
<div class="container">
	<h4>지역별 코치 찾기</h4>
	<div class="well" style="background-color: lightgray;">
		<div class="coachloc">
		<form>
		서울 > &nbsp;&nbsp;&nbsp;
		<input type="radio" value="강남구" name="local">강남구&nbsp; 
		<input type="radio" value="노원구" name="local">노원구&nbsp;
		<input type="radio" value="서초구" name="local">서초구&nbsp;
		<input type="radio" value="용산구" name="local">용산구&nbsp;
		<input type="radio" value="은평구" name="local">은평구
		<br>
		경기 > &nbsp;&nbsp;&nbsp;
		<input type="radio" value="성남시" name="local">성남시&nbsp;
		<input type="radio" value="안양시" name="local">안양시&nbsp;
		<input type="radio" value="양평시" name="local">양평시&nbsp;
		<input type="radio" value="용인시" name="local">용인시&nbsp;
		<input type="radio" value="의정부시" name="local">의정부시
		</form>
		<br>
		</div>
		 
	</div>

    <!-- Page Content -->

        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
       
            <div class="col-lg-12">
                <h1> Health人 코치진 소개</h1>
            <select name="job" class="sbox" id="order">
           	 	<option value="rank">정렬선택</option>
          		<option value="name">이름순</option>
   				<option value="rate">인기순</option>
			</select>
             
            </div>
          
        </div>
  <hr>
  <c:forEach items="${list}" var="t">
        <!-- 강사 리스트  -->
        <div class="row">
            <div class="col-sm-3 text-center">
                    <a href="#">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/트레이너1.jpg" width="750"  height="450">
                    </a>
                </div>
            <div class="col-md-9">
                <h3>${t.name}</h3>
                <h4>${t.location}</h4>
                <p>${t.career}</p>
                <a class="btn btn-primary" href="portfolio-item.html">정보 더보기</a>
            </div>
        </div>
        <hr>
</c:forEach>
        
        <p class="paging">
					<c:set var="pb" value="${requestScope.listVo.pagingBean}"></c:set>
					
					<c:if test="${pb.previousPageGroup}">
						<a href="DispatcherServlet?command=storeAllList&pageNo=${pb.startPageOfPageGroup-1}">◀&nbsp;
						</a>
					</c:if>
					<c:forEach var="pageNo" begin="${pb.startPageOfPageGroup}"
						end="${pb.endPageOfPageGroup}">
						<c:choose>
							<c:when test="${pb.nowPage!=pageNo}">
								<a href="DispatcherServlet?command=storeAllList&pageNo=${pageNo}">${pageNo}</a>
							</c:when>
							<c:otherwise>${pageNo}</c:otherwise>
						</c:choose>&nbsp;
						</c:forEach>
					<c:if test="${pb.nextPageGroup}">
						<a href="DispatcherServlet?command=storeAllList&pageNo=${pb.endPageOfPageGroup+1}">▶</a>
					</c:if>
				</p>
        
        </div>