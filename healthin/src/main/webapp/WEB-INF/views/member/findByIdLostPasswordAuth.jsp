<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<meta charset="utf-8">
<title>아이디/비밀번호 찾기</title>
<script src="//code.jquery.com/jquery.min.js"></script>
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- Custom Theme files -->
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--Google Fonts-->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/find.css" />
<meta charset="UTF-8">
</head>
<body>
	<div id="daumIndex">
		<!-- 웹접근성용 바로가기 링크 모음 -->
		<a href="#daumBody">본문 바로가기</a> <a href="#daumGnb">메뉴 바로가기</a>
	</div>
	<div id="daumWrap">
		<div id="daumHead">
			<h1>
				<a href="/find/password.do" id="daumServiceLogo" class="link_findpw"><span
					class="ir_wa">비밀번호찾기</span></a>
			</h1>
		</div>
		<!-- // daumHead -->
		<hr class="hide">

		<div id="daumContent" role="main">
			<div id="cMain">
				<div id="mArticle">
					<h2 id="daumBody" class="screen_out">비밀번호 재설정 본문</h2>
					<p class="desc_g">
						<em class="emph_g">${mvo.name}</em> 님, 이제 새로운 비밀번호로 재설정해 주세요.
					</p>
					<div class="cont_g cont_type3">
						<div class="info_detail">
							<div class="info_result">
								<form method="post"
									action="${pageContext.request.contextPath}/member/passwordSearchPasswordResult.do">
									<fieldset>
										<legend class="screen_out">비밀번호 재설정 폼</legend>
										<input type="password" id="id"
														name="id" class="tf_g" value="${mvo.id}"> 
										<div class="box_detail">
											<div class="bg_find bg_data">
												<div class="bg_find inner_bg" id="passwordDiv">
													<label for="newPassword" class="screen_out">새 비밀번호를
														입력해주세요.</label> <input type="password" id="newPassword"
														name="newPassword" class="tf_g"> <input
														type="text" title="입력한 비밀번호 보기" id="textNewPassword"
														name="textNewPassword" style="display: none;" class="tf_g">
													<button type="button" id="passwordShow"
														class="btn_find btn_view">
														<span class="screen_out">입력한 비밀번호 보기</span>
													</button>
												</div>
											</div>
											<p class="desc_add emph_notice" style="display: none"></p>
											<button type="submit" class="btn_find btn_done">완료</button>
										</div>
									</fieldset>
								</form>
							</div>
							<div class="info_rule">
								<strong class="screen_out">보안 주의사항 TIP 리스트</strong> <em
									class="ico_find ico_tip">TIP</em>
								<div class="info_tip info_tippw">
									<strong class="screen_out">보안에 취약한 비밀번호는 사용하지 마세요! </strong>
									<ul class="screen_out">
										<li>비밀번호는 8~32자의 영문 대/소문자, 숫자, 특수문자를 조합하여 사용하실 수 있어요!</li>
										<li>쉬운 비밀번호나 자주 쓰는 사이트의 비밀번호가 같을 경우,도용되기 쉬워 주기적으로 변경하여
											사용하는 것이 좋습니다.</li>
										<li>비밀번호에 특수문자를 추가하여 사용하시면 기억하기도 쉽고, 비밀번호 안전도가 높아져 도용의
											위험이 줄어듭니다.</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--// mArticle -->
			</div>
			<!-- // cMain -->
		</div>
		<!-- // daumContent -->

		<hr class="hide">
		<!-- // daumContent -->
		<hr class="hide">
		<div id="daumFoot" class="footer_comm" role="contentinfo">
			<h2 class="screen_out">서비스 이용정보</h2>
			<a href="#" class="link_info" target="_blank">서비스 약관/정책</a> | <a
				href="#" class="link_info" target="_blank">개인정보처리방침</a> | <a
				href="#" class="link_info" target="_blank">권리침해신고</a> | <a href="#"
				target="_blank" class="link_info">고객센터</a>
			<address class="txt_copyright">
				Copyright &#169; <a
					href="${pageContext.request.contextPath}/home.do" class="link_daum"
					style="font-weight: bold">OgigeMapGo Corp.</a> All rights reserved.
			</address>
		</div>
		<!-- // daumFoot -->
		<!-- // daumFoot -->
		<script type="text/javascript">
			var minidaum_options = {
				bgType : "white",
				enableLogoutRetun : false,
				returnUrl : '',
				disableHotissue : false,
				disableLogo : false,
				disableTracker : false,
				enableShield : false
			}
		</script>
		<script src="${pageContext.request.contextPath}/resources/js/ogigemapgo.js" charset="utf-8"
			type="text/javascript"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.min.js"></script>
	</div>


	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/jquery.form.member.init.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/jquery.form.validate.js"></script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {

							var validator = $("form")
									.validate(
											{
												rules : {
													newPassword : {
														required : true,
														minlength : 8,
														maxlength : 32,
														whitespace : true,
														isasciiprintable : true,
														onlydigits : true,
														consecutive : true
													}
												},
												messages : {
													newPassword : {
														required : "비밀번호를 입력해 주세요.",
														minlength : "조금 더! 비밀번호는 8자 이상이에요!",
														maxlength : "비밀번호는 32자까지 사용할 수 있어요!",
														whitespace : "비밀번호에 공백(space)을 넣을 수 없어요!",
														isasciiprintable : "영문자, 숫자, 특수문자만 비밀번호에 입력해 주세요!",
														onlydigits : "숫자로 된 비밀번호는 사용할 수 없어요! 영문자, 특수문자를 함께 입력해 주세요.",
														consecutive : "다른 사람이 추측하기 쉬운 비밀번호는 사용할 수 없어요!"
													}
												}
											});

							var form = $("form").getForm();
							form.initWebRow('.box_detail');
							form.bindPasswordEvent('newPassword');

							$('#passwordShow').keypress(function(event) {
								if (event.which == 32) {
									if ($("#newPassword").is(":visible")) {
										$("#newPassword").hide();
										$("#textNewPassword").show();
									}
								}
							}).keyup(function(event) {
								if (event.which == 32) {
									if ($("#textNewPassword").is(":visible")) {
										$("#textNewPassword").hide();
										$("#newPassword").show();
									}
								}
							});

							$('#passwordShow').mousedown(function() {
								$("#newPassword").hide();
								$("#textNewPassword").show();
							}).mouseup(function() {
								$("#textNewPassword").hide();
								$("#newPassword").show();
							}).mouseleave(function() {
								$("#textNewPassword").hide();
								$("#newPassword").show();
							});

							$('#passwordShow').focusout(function() {
								$("#textNewPassword").hide();
								$("#newPassword").show();
							});

							$("#newPassword, #textNewPassword")
									.keyup(
											function() {
												var errorList = validator
														.getElementErrorList(this);
												if (errorList.length > 0) {
													form
															.showError(
																	errorList[0].element.id,
																	errorList[0].message);
												} else {
													var message = "안전한 비밀번호입니다. 바로 사용하세요!";
													var password = $(this)
															.val();
													if (form
															.isStrongPassword(password)) {
														message = "완벽한 비밀번호입니다. 바로 사용하세요!";
													}
													form.showInfo(this.id,
															message);
												}
											});

							var submitted = false;
							$("form")
									.submit(
											function() {
												if (!submitted) {
													submitted = true;
													var errorList = validator
															.getFormErrorList();
													if (errorList.length !== 0) {
														for (var i = 0; errorList[i]; i++) {
															var error = errorList[i];
															form
																	.showError(
																			error.element.id,
																			error.message);
														}
														errorList[0].element
																.focus();
														submitted = false;
														return false;
													}
													return true;
												}
												return false;
											});

						});
	</script>
</body>


