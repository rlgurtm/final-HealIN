<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#tipWriteForm{
		padding: 10px 30%;
	}
</style>


	<form id="tipWriteForm" method ="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/tip/tipWrite.do">
			<div class="col-sm-5">
			<label for="comment">카테고리</label>	
			<select name="category" required="required">
				<option value="">---</option>
				<option value="헬스">헬스</option>
				<option value="식단">식단</option>
				<option value="운동">운동</option>
				<option value="다이어트">다이어트</option>
			</select>
			</div>
			 <input type="file" name="attachedFile">
			<br>
			
		<label for="comment">제목:</label>
		<input type="text" name="title" class="form-control" required="required"><br>
		<div class="form-group">
	      <label for="comment">내용:</label>
	      <textarea class="form-control" rows="5" name="content" required="required"></textarea>
	    </div>
	    <input type="hidden" name="memberVO.id" value="${mvo.id }">
	    <input type="submit" value="글쓰기" class="btn btn-default"><br><br>
	</form>

	