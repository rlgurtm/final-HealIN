<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
	<h2>Basic Table</h2>
	<p>The .table class adds basic styling (light padding and only
		horizontal dividers) to a table:</p>
	<ul class="nav nav-tabs">
		<li class="menu active"><a href="#">Home</a></li>
		<li class="menu"><a href="#">운동</a></li>
		<li class="menu"><a href="#">다이어트</a></li>
		<li class="menu"><a href="#">식단</a></li>
	</ul>
	<br>
	<table class="table">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>

			<tr>
				<td>1</td>
				<td>다이어트 개꿀팁! 나도 이참에 살 좀 빼보자!! 3탄</td>
				<td>장기혁</td>
				<td>2017-05-19</td>
				<td>1</td>
			</tr>
			<tr>
				<td>2</td>
				<td>다이어트 개꿀팁! 나도 이참에 살 좀 빼보자!! 2탄</td>
				<td>장기혁</td>
				<td>2017-05-19</td>
				<td>1</td>
			</tr>
			<tr>
				<td>3</td>
				<td>다이어트 개꿀팁! 나도 이참에 살 좀 빼보자!! 1탄</td>
				<td>장기혁</td>
				<td>2017-05-19</td>
				<td>1</td>
			</tr>
		</tbody>
	</table>
	${list }
</div>
 <script>
  	$(document).ready(function(){
    	$(".menu").click(function(){
        	$(".active").removeClass("active");
        	$(this).addClass("active");
        });
    
    });
  </script>