<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://unpkg.com/purecss@0.6.2/build/pure-min.css"
	integrity="sha384-UQiGfs9ICog+LwheBSRCt1o5cbyKIHbwjWscjemyBMT9YCUMZffs6UqUTd0hObXD"
	crossorigin="anonymous">
<style>
#videoFormSelect{
	height: 40px;
	font-size: 15px;
	padding: 2px;
}
#videoForm{
	height: 50px;
	font-size: 15px;
	padding: 10px;
}
textarea {
	height: 150px;
	font-size: 15px;
	padding: 10px;
}
</style>

<div class="container" align="center">
	<form class="pure-g pure-form" method="post" action="${pageContext.request.contextPath}/trainerVideoWrite.do" enctype="multipart/form-data">
		<div class="pure-u-1">
			<div class="pure-u-1-8">
				<select name="openrank" class="pure-u-1" id="videoFormSelect">
					<option value="0">전체공개</option>
					<option value="1">회원공개</option>
					<option value="2">팔로워회원공개</option>
					<option value="3">PT회원공개</option>
					<option value="5">전체비공개</option>
				</select>
			</div>
			<div class="pure-u-1-8">
				<select name="category" class="pure-u-1" id="videoFormSelect" required="required">
					<option value="">운동부위</option>
					<option value="어깨">어깨</option>
					<option value="팔">팔</option>
					<option value="등">등</option>
					<option value="가슴">가슴</option>
					<option value="하체">하체</option>
					<option value="유산소and코어">유산소&코어</option>
				</select>
			</div>
			<div class="pure-u-3-8">
				<input name="uploadFile" type="file" class="pure-u-1" id="videoForm" required="required">
			</div>
			<div class="pure-u-1-8">
				<input name="trainerId" type="text" class="pure-u-1" value="${mvo.id}" readonly="readonly" id="videoForm">
			</div>
		</div>
		<br> <br>
		<div class="pure-u-1">
			<div class="pure-u-4-5">
				<input name="title" type="text" class="pure-u-1" placeholder="Title" id="videoForm" required="required">
			</div>
		</div>
		<br><br>
		<div class="pure-u-1">
			<div class="pure-u-4-5">
				<textarea name="content" class="pure-u-1" placeholder="Content" required="required"></textarea>
			</div>
		</div>
		<br><br><br>
		<div class="pure-u-1">
			<input type="submit" value="등록하기" class="pure-u-1-8" id="videoForm">
		</div>
	</form>
</div>
<br>
<br>


