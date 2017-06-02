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
});
	
	function trainerListOrder(page){
		 $.ajax({
 			type:"get",
 			url:"${pageContext.request.contextPath}/order.do",
 			data:"order="+order+"&pageNo="+page,
 			dataType:"json",
 			success:function(data){
 				  	var info="";
				for(var i=0;i<data.lvo.length;i++){
					info+="<div class='row'><div class='col-sm-3 text-center'>";
					info+="<img class='img-responsive' src='${pageContext.request.contextPath}/resources/trainerPic/";
					info+=data.lvo[i].trainerPhoto+"' ";
					info+=" width='750'  height='450'></div><div class='col-md-9'>";
 					info+="<h3>이름 : "+data.lvo[i].membervo.name+"</h3>";
 					info+="<h4>지역 : "+data.lvo[i].location+"</h4>";
 					info+="<p>경력사항 : "+data.lvo[i].career+"</p>";
 					info+="<form action='${pageContext.request.contextPath}/trainer/trainerDetail.do' method='post'>";
 					info+="<input type='hidden' value='"+data.lvo[i].membervo.id+"' name='trainerId'>";
 	               	info+="<input type='submit' value='강사정보 더보기'></form>";
 		               info+="</div></div><hr>";
 				}
				$("#trainerArea").html(info);
				var pre=data.pb.startPageOfPageGroup-1;
				 var next=data.pb.endPageOfPageGroup+1; 
				 var paging="";
				 if(data.pb.previousPageGroup)
					 paging+="<li class='previous' value="+pre+"><a>previous</a><li>";
				for(var k=data.pb.startPageOfPageGroup;k<=data.pb.endPageOfPageGroup;k++){
				 if(data.pb.nowPage==k){
					paging+="<li value="+k+" class='active'><a href='#'>"+k+"</a></li>";
				 }else{
					paging+="<li value="+k+"><a href='#'>"+k+"</a></li>";
					 }
				 }
				 if(data.pb.nextPageGroup)
					 paging+="<li class='next' value="+next+"><a>next</a><li>";
				 $(".pagination").html(paging);
 			}//success
		});//ajax
	}//function
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
                <form action="${pageContext.request.contextPath}/trainer/trainerDetail.do" method="post">
                	<input type="hidden" value="${t.membervo.id}" name="trainerId">
                	<input type="submit" value="강사정보 더보기">
                </form>
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