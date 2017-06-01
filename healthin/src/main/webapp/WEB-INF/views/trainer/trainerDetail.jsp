<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">

	<!-- Page Heading/Breadcrumbs -->
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				강사 상세보기
			</h1>
			
		</div>
	</div>
	<!-- /.row -->

	<!-- Intro Content -->
	<div class="row">
		<div class="col-md-6">
			<img class="img-responsive" src="${pageContext.request.contextPath}/resources/trainerPic/${list.trainerPhoto}" width="750"  height="450">
		</div>
		<div class="col-md-6">
		<table >
			<tr>
			<td><h2>이름 : </h2></td><td><h2>${list.membervo.name}</h2></td>
			</tr>
			<tr>
			<td><h4>전화번호 : </h4></td><td><h4>${list.membervo.tel}</h4></td>
			</tr>
			<tr>
			<td><h4>메일 : </h4></td><td><h4>${list.membervo.email}</h4></td>
			</tr>
			<tr>
			<td><h4>지역 : </h4></td><td><h4>${list.location}</h4></td>
			</tr>
			<tr>
			<td><h4>경력사항 : </h4></td><td><h4>${list.career}</h4></td>
			</tr>
			
			<tr>
			<th>팔로잉</th><td><div class="hearty"></div></td>
			</tr>
			<tr>
			<th colspan="2">팔로워 :  06</th><th></tr>
			
		</table>
			
		</div>
	</div>

	
<br><br>	

	<!-- Team Members -->
	<div class="row">
		<div class="col-lg-12">
			<h2 class="page-header">Our Team</h2>
		</div>
		<div class="col-md-4 text-center">
			<div class="thumbnail">
				<img class="img-responsive" src="http://placehold.it/750x450" alt="">
				<div class="caption">
					<h3>
						John Smith<br> <small>Job Title</small>
					</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Iste saepe et quisquam nesciunt maxime.</p>
					<ul class="list-inline">
						<li><a href="#"><i class="fa fa-2x fa-facebook-square"></i></a>
						</li>
						<li><a href="#"><i class="fa fa-2x fa-linkedin-square"></i></a>
						</li>
						<li><a href="#"><i class="fa fa-2x fa-twitter-square"></i></a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-md-4 text-center">
			<div class="thumbnail">
				<img class="img-responsive" src="http://placehold.it/750x450" alt="">
				<div class="caption">
					<h3>
						John Smith<br> <small>Job Title</small>
					</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Iste saepe et quisquam nesciunt maxime.</p>
					<ul class="list-inline">
						<li><a href="#"><i class="fa fa-2x fa-facebook-square"></i></a>
						</li>
						<li><a href="#"><i class="fa fa-2x fa-linkedin-square"></i></a>
						</li>
						<li><a href="#"><i class="fa fa-2x fa-twitter-square"></i></a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-md-4 text-center">
			<div class="thumbnail">
				<img class="img-responsive" src="http://placehold.it/750x450" alt="">
				<div class="caption">
					<h3>
						John Smith<br> <small>Job Title</small>
					</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Iste saepe et quisquam nesciunt maxime.</p>
					<ul class="list-inline">
						<li><a href="#"><i class="fa fa-2x fa-facebook-square"></i></a>
						</li>
						<li><a href="#"><i class="fa fa-2x fa-linkedin-square"></i></a>
						</li>
						<li><a href="#"><i class="fa fa-2x fa-twitter-square"></i></a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>