<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
$(document).ready(function(){
	$("#fileUp").click(function(){
		if(confirm("새로운 파일 선택시 기존의 파일은 삭제됩니다.\n계속하시겠습니까?")){
			
		}else{
			return false;
		}
	});
});
</script>

<form action="${pageContext.request.contextPath}/ptQnaUpdate.do" method ="post" enctype="multipart/form-data" >
	<table class="content">
				<tr>
					<td>
					제목:<input type=text id=title name=title value=${tip.title } required="required" size="65%"></input>					
					</td>
				</tr>
				<tr>
					<td><input type="file" name="uploadFile" id="fileUp" accept="image/*">기존파일:${tip.attachedFile }</td>
				</tr>
				<tr>
					<td>						
	<textarea rows="15" cols="75" id="content" name="content" required="required">${tip.content }</textarea>
					</td>
				</tr>
				<tr>
					<td align="center">	
					<input type="hidden" name="no" value="${tip.no }">		
					<input type="hidden" name="attachedFile" value="${tip.attachedFile }">					
						<button type="submit" class="btn" id="updateBtn">수정하기</button>		
					</td>				
				</tr>
			</table>
</form>