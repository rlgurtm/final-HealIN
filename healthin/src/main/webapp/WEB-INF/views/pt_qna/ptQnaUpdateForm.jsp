<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<form action="${pageContext.request.contextPath}/ptQnaUpdate.do" method="post">
	<table class="content">
				<tr>
					<td>
					제목:<input type=text id=title name=title value=${tip.title } required="required" size="65%"></input>					
					</td>
				<tr>
					<td>						
	<textarea rows="15" cols="75" id="content" name="content" required="required">${tip.content }</textarea>
					</td>
				</tr>
				<tr>
					<td align="center">	
					<input type="hidden" name="no" value="${tip.no }">					
						<button type="submit" class="btn" id="updateBtn">수정하기</button>		
					</td>				
				</tr>
			</table>
</form>