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
<meta charset="UTF-8">
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/find.css" />
</head>
<body>
	<div id="daumWrap">
		<div id="daumHead">
			<h1>
				<a
					href="${pageContext.request.contextPath}/findByIdLostPasswordAuth.do"
					id="daumServiceLogo" class="link_findpw"><span class="ir_wa">비밀번호찾기</span></a>
			</h1>
			${sessionScope.msg }
		</div>
		<!-- // daumHead -->
		<hr class="hide">
		<div id="daumContent" role="main">
			<div id="cMain">
				<div id="mArticle">
					<div class="dimmed_layer" style="display: none"></div>
					<h2 id="daumBody" class="screen_out">개인비밀번호 찾기 본문</h2>
					<p class="desc_g">
						<em class="emph_g">${mvo.id}</em> 님, 인증 가능한 연락처를 선택한 후, 연락처를 입력해
						주세요.<br>
					</p>

					<div class="cont_g">
						<div class="info_detail">
							<form method="post"
								action="${pageContext.request.contextPath}/findByIdLostPasswordAuth.do"
								id="checkForm">
								<input type="hidden" id="contact" name="contact" /> <input
									type="hidden" id="name" name="name" /> <input type="hidden"
									id="mobileNational" name="mobileNational" /> <input
									type="hidden" id="mobileNationalCode" name="mobileNationalCode" />
								<fieldset>
									<legend class="screen_out">비밀번호찾기 방법 개인아이디 폼</legend>
									<ul class="list_certify">
										<li><span class="choice_comm"> <input type="radio"
												id="inpSearch1" name="contactType" class="inp_comm"
												value="smsNum"> <label for="inpSearch1"
												class="lab_comm"> <span class="ico_find"></span>내
													정보에 등록된 휴대폰 인증 <span class="txt_date"></span>
											</label>
										</span>
											<div class="desc_involve">
												<div class="box_detail">
													<div class="bg_find bg_data">
														<div class="bg_find inner_bg">
															<label for="smsNumName" class="screen_out">이름을
																입력해주세요.</label> <input type="text" id="smsNumName"
																name="smsNumName" class="tf_g" value=""> <input
																type="hidden" id="hiddenMvoName" value="${mvo.name}">
														</div>


													</div>
													<p class="desc_add emph_notice" style="display: none"></p>
												</div>
												<div class="box_detail">
													<div class="bg_find bg_nation input_none"></div>
													<div class="bg_find bg_data">
														<div class="bg_find inner_bg">
															<label for="smsNum" class="screen_out">휴대폰 번호를
																입력해주세요.</label> <input type="text" id="smsNum" name="smsNum"
																class="tf_g " value=""> <input type="hidden"
																id="hiddenMvoSmsNum" value="${mvo.tel}">
														</div>
													</div>
													<p class="desc_add emph_notice" style="display: none"></p>
													<input type="hidden" id="hiddenAuthType" value="tel">
													<button type="submit" class="btn_find btn_next"
														id="nextStepBtn">다음단계</button>

												</div>
											</div></li>
										<li><span class="choice_comm"> <input type="radio"
												id="inpSearch2" name="contactType" class="inp_comm"
												value="otherMail"> <label for="inpSearch2"
												class="lab_comm"> <span class="ico_find"></span>내
													정보에 등록된 이메일 인증 <span class="txt_date"></span>
											</label>
										</span>
											<div class="desc_involve">
												<div class="box_detail">
													<div class="bg_find bg_data">
														<div class="bg_find inner_bg">
															<label for="otherMailName" class="screen_out"> 이름
																을 입력해 주세요.</label> <input type="text" id="otherMailName"
																name="otherMailName" class="tf_g" value="">
														</div>
													</div>
													<p class="desc_add emph_notice" style="display: none"></p>
												</div>
												<div class="box_detail">
													<div class="bg_find bg_data">
														<div class="bg_find inner_bg">
															<label for="otherMail" class="screen_out">이메일 주소를
																입력해주세요.</label> <input type="text" id="otherMail"
																name="otherMail" class="tf_g " value="">
														</div>
													</div>
													<p class="desc_add emph_notice" style="display: none"></p>
													<input type="hidden" id="hiddenAuthType" value="email">
													<button type="submit" class="btn_find btn_next"
														id="nextBtn">다음단계</button>
												</div>
											</div></li>
									</ul>
								</fieldset>
							</form>
						</div>
					</div>

					<div id="collectionLayer" class="userinfo_layer"
						style="display: none; top: 100px; margin-left: -300px">
						<!-- 임시스타일 -->
					</div>
				</div>
				<!--// mArticle -->
			</div>
			<!-- // cMain -->
		</div>
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
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/resources/js/ogigemapgo.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.min.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.min.js"></script>
	</div>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/jquery.form.member.init.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/jquery.form.validate.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/namecheck-support.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/messages.js"></script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {

							var require_name_or_regnum = messages.require_name;
							var validator = $("form")
									.validate(
											{
												rules : {
													phoneId : {
														required : true,
														mobile : true
													},
													phoneIdName : {
														required : true
													},
													emailId : {
														required : true,
														findemail : true
													},
													emailIdName : {
														required : true
													},
													tsvPhone : {
														required : true,
														mobile : true
													},
													tsvPhoneName : {
														required : true
													},
													smsNum : {
														required : true,
														mobile : true
													},
													smsNumName : {
														required : true
													},
													otherMail : {
														required : true,
														findemail : true
													},
													otherMailName : {
														required : true
													}
												},
												messages : {
													phoneId : {
														required : "폰번호 아이디를 입력해 주세요.",
														mobile : "폰번호 아이디를 정확히 입력해 주세요."
													},
													phoneIdName : {
														required : require_name_or_regnum
													},
													emailId : {
														required : "이메일 아이디를 입력해 주세요.",
														findemail : "이메일 아이디를 정확히 입력해 주세요."
													},
													emailIdName : {
														required : require_name_or_regnum
													},
													tsvPhone : {
														required : "휴대폰 번호를 입력해 주세요.",
														mobile : "잘못된 휴대폰 번호 입니다. 휴대폰 번호를 확인한 후 다시 입력해 주세요."
													},
													tsvPhoneName : {
														required : require_name_or_regnum
													},
													smsNum : {
														required : "휴대폰 번호를 입력해 주세요.",
														mobile : "잘못된 휴대폰 번호 입니다. 휴대폰 번호를 확인한 후 다시 입력해 주세요."
													},
													smsNumName : {
														required : require_name_or_regnum
													},
													otherMail : {
														required : "이메일 주소를 입력해 주세요.",
														findemail : "잘못된 이메일 주소 입니다. 이메일 주소를 확인한 다음 다시 입력해 주세요."
													},
													otherMailName : {
														required : require_name_or_regnum
													}
												}
											});

							var form = $("#checkForm").getForm();
							form.initWebRow('.box_detail');
							form.initWebRadioRow('.list_certify');
							form.bindCheckBoxEvent();
							form.initTabFocusWeb('.choice_comm');

							var submitted = false;
							$("#checkForm")
									.submit(
											function() {
												if (!submitted) {
													submitted = true;
													var contactType = $(
															"input[name=contactType]:checked")
															.val();

													var errorList = validator
															.getElementErrorList("input[name^='"
																	+ contactType
																	+ "']");
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

													var contact = $(
															"#" + contactType)
															.val();
													var name = $(
															"#" + contactType
																	+ "Name")
															.val();

													return true;
												}
												return false;
											});

							var nameChecker = new SirenRealNameCheck("findpw");
							$('#SmsCertButton').click(function(event) {
								nameChecker.openSMS();
							});

						});

		function goNextStep(authType, code) {

			$("#nextStepBtn")
					.click(
							function() {
								var mvoName = document
										.getElementById("hiddenMvoName").value;
								var smsName = document
										.getElementById("smsNumName").value;
								var mvoSmsNum = document
										.getElementById("hiddenMvoSmsNum").value;
								var smsNum = document.getElementById("smsNum").value;

								if (mvoName.equals(smsName)
										&& mvoSmsNum.equals(smsNum)) {
									$("#checkForm").submit();
									return false;
								} else {
									return true;
								}
							});

		}
	</script>

</body>


