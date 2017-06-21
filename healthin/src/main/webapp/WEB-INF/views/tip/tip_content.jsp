<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style>
	
	.pagination > .active > a,
	.pagination > .active > a:hover{
    background-color: gray;
    color: white;
    border-radius: 5px;
    border-color:gray;
	}
	.pagination>li>a{
	color: black;
	}
    
</style>
	
	
	<script type="text/javascript">
		function getTipCommentList(page){
		 		$.ajax({
						type:"get",
						url:"${pageContext.request.contextPath}/tipComment.do",
						data:"no=${tip.no}&nowpage="+page,
						dataType:"json", 
						success:function(data){
								var info="";
								  for(var i=0;i<data.lvo.length;i++){
									info+="<table style='width:90%;margin:20px;'>";
									info+="<tr><th><i class='glyphicon glyphicon-user'></i>&nbsp;";
									info+=data.lvo[i].id+"</th>";
									info+="<td align='right'>"+data.lvo[i].date+"&nbsp;&nbsp;";
								if(data.lvo[i].id=="${mvo.id}"){
									info+="<a href='${pageContext.request.contextPath}/tipCommentDelete.do?no=";
									info+=data.lvo[i].commentNo+"&bno="+data.lvo[i].boardNo+"'>";
									info+="<span class='glyphicon glyphicon-trash'></span></a>";
								}
									info+="</td></tr><tr><td colspan='2'><pre style='white-space: pre-wrap;'>";
									info+=data.lvo[i].comment+"</pre></td></tr></table>";
								}  
								$("#commentInfo").html(info);
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
					});
			}//function
	
	$(document).ready(function(){
		getTipCommentList(1);
		
		 $(".pagination").on("click", "li", function(){
				$(".pagination .active").removeClass("active");
	   		 		$(this).addClass("active"); 
	   				category=$(".nav-tabs .active").text();
	   				getTipCommentList($(this).val());
	   		});//on
		
		$("#listBtn").click(function(){
			location.href="${pageContext.request.contextPath}/tip/tip.do";
		});//click
		
		$("#deleteBtn").click(function(){
			location.href="${pageContext.request.contextPath}/tipBoardDelete.do?no=${tip.no }&id=${tip.memberVO.id}";
		});//click
		
		$("#updateBtn").click(function(){
			location.href="${pageContext.request.contextPath}/tip/updateForm.do?no=${tip.no }";
		});//click
	});//ready
	</script>
	
	
	<div class="container">
		<table class="content ">
			<thead>
				<tr>
					<th>제목</th><td colspan="5">${tip.title }</td>
				</tr>
				<tr>
					<th>글쓴이</th><td>${tip.memberVO.nickname }</td>
					<th>날짜</th><td>${tip.postedDate }</td>
					<th>조회수</th><td>${tip.hits }</td>
				</tr>
			</thead>
			<tbody>
				<tr>
				
					<td colspan="6">
					<pre style="overflow-y:hidden;overflow-x:hidden;white-space: pre-wrap;height:100%;">
						<c:if test="${tip.attachedFile!=null}">
							<img src="${pageContext.request.contextPath }/resources/tipFile/${tip.attachedFile }"
								style="width: 60%; display:block;"></c:if><br>${tip.content }
						<c:if test="${tip.attachedFile!=null}">
							<a id="attechedFile" href="${pageContext.request.contextPath }/fileDownload.do?
							fileName=${tip.attachedFile }">첨부파일</a>
						</c:if>
						</pre>
					</td>
				</tr>
			</tbody>
		</table>
		<div id="AllBtn">
			<c:if test="${mvo.id==tip.memberVO.id }">
				<button type="button" class="btn" id="updateBtn">수정하기</button>
				<button type="button" class="btn" id="deleteBtn">삭제하기</button>
			</c:if>
				<button type="button" class="btn" id="listBtn">목록가기</button>
		</div>	
			
	</div>
	<hr>	
		<div class="well" style="width:60%; margin-left: auto; margin-right: auto; " >
			<div id="commentInfo"></div>
			<div align="center"><ul class="pagination"></ul></div><hr>
			<form action="${pageContext.request.contextPath}/tipCommentWrite.do" method="post">
				<table style="width:100%;">
					<tr>
						<td colspan="2"><label>댓글</label></td>
					</tr>
					<tr>
						<td style="width:100%;">
						<textarea class="form-control" id="comment" name="comment" required="required"></textarea>
						</td>
						<td align="left" style="padding: 5px;">
						<input type="submit" class="btn btn-lg" value="등록">
						<input type="hidden" name="boardNo" value="${tip.no }">
						<input type="hidden" name="id" value="${mvo.id }">
						</td>
					</tr>
				</table>
			</form>
		</div>
		<br><br>
