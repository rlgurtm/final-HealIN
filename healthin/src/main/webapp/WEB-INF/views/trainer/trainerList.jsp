<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
$(document).ready(function(){
	$("#order").change(function(){
		 $.ajax({
 				type:"get",
 				url:"${pageContext.request.contextPath}/order.do",
 				data:"order="+$(this).val(),
 				dataType:"json",
 				success:function(data){
 			 	  	var info="";
					for(var i=0;i<data.lvo.length;i++){
 						info+="<h3>이름 : "+data.lvo[i].name+"</h3>";
 						info+="<h4>지역 : "+data.lvo[i].location+"</h4>";
 						info+="<p>경력사항 : "+data.lvo[i].career+"</p>";
 						info+="<a class='btn btn-primary' href='portfolio-item.html'>정보 더보기</a>";
 		                
 					}
					$("#trainerArea").html(info); 
 				}
		});
	});
});
</script>
<div class="container">
	<h4>지역별 코치 찾기</h4>
	<div class="well" style="background-color: lightgray;">
		<div class="coachloc">
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
		<input type="radio" value="양평군" name="local">양평군&nbsp;
		<input type="radio" value="용인시" name="local">용인시&nbsp;
		<input type="radio" value="의정부시" name="local">의정부시
		<br>
		</div>
	</div>

    <!-- Page Content -->

        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
       
            <div class="col-lg-12">
                <h1> Health人 코치진 소개</h1>
            <select name="job" class="sbox" id="order">
           	 	<option value="">정렬선택</option>
          		<option value="name">이름순</option>
   				<option value="rate">인기순</option>
			</select>
             
            </div>
          
        </div>
  <hr>
   <c:forEach items="${list.LVO}" var="t">
        <!-- 강사 리스트  -->
        <div class="row">
            <div class="col-sm-3 text-center">
                    <a href="#">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/${t.trainerPhoto}" width="750"  height="450">
                    </a>
                </div>
            <div class="col-md-9">
            <div id="trainerArea">
                <h3>이름 : ${t.membervo.name}</h3>
                <h4>지역 : ${t.location}</h4>
                <p>경력사항 : ${t.career}</p>
                <a class="btn btn-primary" href="portfolio-item.html">정보 더보기</a>
              </div>  
            </div>
        </div>
        <hr>
</c:forEach>
        
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
							<li><a>${i}</a></li>
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