<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<meta charset="utf-8">
<title>아이디 찾기</title>
<script src="//code.jquery.com/jquery.min.js"></script>
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- Custom Theme files -->
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta property="og:title" content="아이디 찾기 홈 | Health 아이디 찾기">
<meta property="og:type" content="website">
<meta property="og:description" content="여기를 눌러 링크를 확인하세요.">
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
				<a href="${pageContext.request.contextPath}/idSearchform.do" id="daumServiceLogo"><span class="ir_wa">아이디찾기</span></a>
			</h1>
		</div>
		<hr class="hide">
		<div id="daumContent" role="main">
			<div id="cMain">
				<div id="mArticle">
					<div class="dimmed_layer" style="display: none"></div>
					<h2 id="daumBody" class="screen_out">아이디찾기 홈 본문</h2>
					<p class="desc_g">
						<strong>아이디를 모르시나요?</strong><br>아이디 찾기 방법 중 가능한 방법을 선택해 주세요.
					</p>
					<div class="cont_g">
						<div class="info_detail" id="findIdHome">
							<fieldset>
								<legend class="screen_out">아이디찾기 인증 목록 폼</legend>
								<ul class="list_certify">
									<li><span class="choice_comm"> <input type="radio"
											id="inpCertify2" name="searchType" class="inp_comm"
											value="mobile"> <label for="inpCertify2"
											class="lab_comm"> <span class="ico_find"></span>내 정보에
												등록된 휴대폰으로 찾기
										</label>
									</span>
										<form id="findIdMobileForm"
											action="/find/id.do?action=search&searchType=mobile"
											method="post">
											<div class="desc_involve">
												<div class="box_detail">
													<div class="bg_find bg_data">
														<div class="bg_find inner_bg">
															<label for="searchMobileName" class="lab_g"
																id="searchMobileNameLabel">이름 또는 닉네임을 입력해 주세요.</label> <input
																type="text" id="searchMobileName" name="searchName"
																class="tf_g">
														</div>
													</div>
													<p class="desc_add emph_notice" style="display: none">이름을
														정확히 입력해 주세요.</p>
												</div>
												<div class="box_detail">
													<div class="bg_find bg_data">
														<div class="bg_find inner_bg">
															<label for="searchMobile" class="lab_g"
																id="searchMobileLabel">휴대폰 번호를 입력해 주세요.</label> <input
																type="text" id="searchMobile" name="searchMobile"
																class="tf_g"> <input type="hidden"
																id="searchMobileNational" name="searchMobileNational">
															<input type="hidden" id="searchMobileNationalCode"
																name="searchMobileNationalCode">
														</div>
													</div>
													<p class="desc_add emph_notice" style="display: none">휴대폰
														또는 이메일 주소를 정확히 입력해 주세요.</p>
													<button type="submit" class="btn_find btn_next">다음단계</button>
												</div>
											</div>
										</form></li>
									<li><span class="choice_comm"> <input type="radio"
											id="inpCertify3" name="searchType" class="inp_comm"
											value="email"> <label for="inpCertify3"
											class="lab_comm"> <span class="ico_find"></span>내 정보에
												등록된 이메일로 찾기
										</label>
									</span>
										<form id="findIdEmailForm"
											action="/find/id.do?action=search&searchType=email"
											method="post">
											<div class="desc_involve">
												<div class="box_detail">
													<div class="bg_find bg_data">
														<div class="bg_find inner_bg">
															<label for="searchEmailName" class="lab_g"
																id="searchEmailNameLabel">이름 또는 닉네임을 입력해 주세요.</label> <input
																type="text" id="searchEmailName" name="searchName"
																class="tf_g">
														</div>
													</div>
													<p class="desc_add emph_notice" style="display: none">이름
														또는 닉네임을 입력해 주세요.</p>
												</div>
												<div class="box_detail">
													<div class="bg_find bg_data">
														<div class="bg_find inner_bg">
															<label for="searchEmail" class="lab_g"
																id="searchEmailLabel">이메일 주소 전체를 입력해 주세요.</label> <input
																type="text" id="searchEmail" name="searchEmail"
																class="tf_g" value="">
														</div>
													</div>
													<p class="desc_add emph_notice" style="display: none;">이메일
														주소를 정확하게 입력해 주세요</p>
													<button type="submit" class="btn_find btn_next">다음단계</button>
												</div>
											</div>
										</form></li>
									<li class="info_person"><span class="choice_comm">
											<input type="radio" id="inpCertify5" name="searchType"
											class="inp_comm" value="birth"> <label
											for="inpCertify5" class="lab_comm"> <span
												class="ico_find"></span>이름 / 생년월일 / 성별로 찾기
										</label>
									</span>
										<form id="findIdNameBirhGenderForm"
											action="/find/id.do?action=search&searchType=birth"
											method="post">
											<div class="desc_involve">
												<div class="area_person">
													<div class="bg_find bg_data">
														<div class="bg_find inner_bg">
															<label for="searchBirthName" class="lab_g"
																id="searchBirthNameLabel">이름을 입력해 주세요.</label> <input
																type="text" id="searchBirthName" name="searchName"
																class="tf_g">
														</div>
													</div>
													<div class="bg_find opt_comm" id="innerGender">
														<!-- class 'opt_open' 추가시 메뉴 펼쳐짐 -->
														<div class="bg_find inner_bg">
															<strong class="screen_out">성별 선택상자</strong> <span
																class="screen_out">선택내용 : </span> <a href="javascript:;"
																class="link_date" id="selectGender">남자<span
																class="ico_find ico_arr"></span></a> <input type="hidden"
																value="남자">

															<div class="box_keyword">
																<ul class="list_keyword" id="listGender">
																	<li><a href="javascript:;" class="link_txt">남자</a></li>
																	<li><a href="javascript:;" class="link_txt">여자</a></li>
																</ul>
															</div>
															<input type="hidden" id="searchGender"
																name="searchGender" value="M" />
														</div>
													</div>
													<div class="select_birth">
														<div class="bg_find bg_data">
															<div class="bg_find inner_bg">
																<label for="searchBirthYear" class="lab_g">생년</label> <input
																	type="text" id="searchBirthYear" name="searchBirthYear"
																	class="tf_g">
															</div>
														</div>
														<div class="bg_find opt_comm" id="innerBirthMonth">
															<div class="bg_find inner_bg">
																<strong class="screen_out">월 선택상자</strong> <span
																	class="screen_out">선택내용 : </span> <a
																	href="javascript:;" class="link_date"
																	id="selectBirthMonth">월 선택<span
																	class="ico_find ico_arr"></span></a> <input type="hidden"
																	value="월 선택">

																<div class="box_keyword">
																	<ul class="list_keyword" id="listMonth">
																		<li><a href="javascript:;" class="link_txt">01월</a></li>
																		<li><a href="javascript:;" class="link_txt">02월</a></li>
																		<li><a href="javascript:;" class="link_txt">03월</a></li>
																		<li><a href="javascript:;" class="link_txt">04월</a></li>
																		<li><a href="javascript:;" class="link_txt">05월</a></li>
																		<li><a href="javascript:;" class="link_txt">06월</a></li>
																		<li><a href="javascript:;" class="link_txt">07월</a></li>
																		<li><a href="javascript:;" class="link_txt">08월</a></li>
																		<li><a href="javascript:;" class="link_txt">09월</a></li>
																		<li><a href="javascript:;" class="link_txt">10월</a></li>
																		<li><a href="javascript:;" class="link_txt">11월</a></li>
																		<li><a href="javascript:;" class="link_txt">12월</a></li>
																	</ul>
																</div>
																<input type="hidden" id="searchBirthMonth"
																	name="searchBirthMonth" value="" />
															</div>
														</div>
														<div class="bg_find opt_comm" id="innerBirthDay">
															<div class="bg_find inner_bg">
																<strong class="screen_out">일 선택상자</strong> <span
																	class="screen_out">선택내용 : </span> <a
																	href="javascript:;" class="link_date"
																	id="selectBirthDay">일 선택<span
																	class="ico_find ico_arr"></span></a> <input type="hidden"
																	value="일 선택">

																<div class="box_keyword">
																	<ul class="list_keyword" id="listDay">
																		<li><a href="javascript:;" class="link_txt">01일</a></li>
																		<li><a href="javascript:;" class="link_txt">02일</a></li>
																		<li><a href="javascript:;" class="link_txt">03일</a></li>
																		<li><a href="javascript:;" class="link_txt">04일</a></li>
																		<li><a href="javascript:;" class="link_txt">05일</a></li>
																		<li><a href="javascript:;" class="link_txt">06일</a></li>
																		<li><a href="javascript:;" class="link_txt">07일</a></li>
																		<li><a href="javascript:;" class="link_txt">08일</a></li>
																		<li><a href="javascript:;" class="link_txt">09일</a></li>
																		<li><a href="javascript:;" class="link_txt">10일</a></li>
																		<li><a href="javascript:;" class="link_txt">11일</a></li>
																		<li><a href="javascript:;" class="link_txt">12일</a></li>
																		<li><a href="javascript:;" class="link_txt">13일</a></li>
																		<li><a href="javascript:;" class="link_txt">14일</a></li>
																		<li><a href="javascript:;" class="link_txt">15일</a></li>
																		<li><a href="javascript:;" class="link_txt">16일</a></li>
																		<li><a href="javascript:;" class="link_txt">17일</a></li>
																		<li><a href="javascript:;" class="link_txt">18일</a></li>
																		<li><a href="javascript:;" class="link_txt">19일</a></li>
																		<li><a href="javascript:;" class="link_txt">20일</a></li>
																		<li><a href="javascript:;" class="link_txt">21일</a></li>
																		<li><a href="javascript:;" class="link_txt">22일</a></li>
																		<li><a href="javascript:;" class="link_txt">23일</a></li>
																		<li><a href="javascript:;" class="link_txt">24일</a></li>
																		<li><a href="javascript:;" class="link_txt">25일</a></li>
																		<li><a href="javascript:;" class="link_txt">26일</a></li>
																		<li><a href="javascript:;" class="link_txt">27일</a></li>
																		<li><a href="javascript:;" class="link_txt">28일</a></li>
																		<li><a href="javascript:;" class="link_txt">29일</a></li>
																		<li><a href="javascript:;" class="link_txt">30일</a></li>
																		<li><a href="javascript:;" class="link_txt">31일</a></li>
																	</ul>
																</div>
																<input type="hidden" id="searchBirthDay"
																	name="searchBirthDay" value="" />
															</div>
														</div>
														<p class="desc_add emph_notice" style="display: none">이름을
															정확히 입력해 주세요.</p>
													</div>
												</div>

												<button type="submit" class="btn_find btn_next">다음단계</button>
											</div>
										</form></li>
									<li><span class="choice_comm"> <input type="radio"
											id="inpCertify6" name="searchType" class="inp_comm"
											value="corp"> <label for="inpCertify6"
											class="lab_comm"> <span class="ico_find"></span>사업자/단체회원
												아이디 찾기
										</label>
									</span>
										<form id="findIdCorpForm"
											action="/find/id.do?action=search&searchType=corp"
											method="post">
											<div class="desc_involve">


												<div class="box_detail">
													<div class="bg_find bg_data">
														<div class="bg_find inner_bg">
															<label for="searchContact" class="lab_g">휴대폰 또는
																이메일 주소를 입력해 주세요.</label> <input type="text" id="searchContact"
																name="searchContact" class="tf_g">
														</div>
													</div>
													<p class="desc_add emph_notice" style="display: none"></p>
													<button type="submit" class="btn_find btn_next">다음단계</button>
												</div>
											</div>
										</form></li>
								</ul>
							</fieldset>
						</div>
					</div>
					<ul class="list_method">
						<li>비밀번호를 찾으시나요?<a href="/find/password.do" class="link_tip">비밀번호
								찾기</a><span class="ico_find ico_more"></span>
						</li>
						<li>카카오계정 비밀번호 찾기를 원하시나요?<a href="javascript:;"
							onclick="gotoKakaoFindPw()" class="link_tip">바로가기</a><span
							class="ico_find ico_more"></span>
						</li>
					</ul>
				</div>
				<!--// mArticle -->
			</div>
			<!-- // cMain -->
			<div id="userNotFoundLayer" class="userinfo_layer"
				style="top: 300px; margin-left: -188px; display: none;">
				<div class="inner_myinfo_layer">
					<div class="layer_head">
						<strong class="screen_out">아이디 찾기 안내 레이어</strong>
					</div>
					<div class="layer_body">

						<div class="btn_process">
							<button type="button" id="userNotFoundOkBtn"
								class="btn_find btn_ok">
								<span class="screen_out">확인</span>
							</button>
						</div>
					</div>
					<div class="layer_foot">
						<button type="button" class="btn_find btn_close">닫기</button>
					</div>
				</div>
			</div>
			<div id="maxCountOverLayer" class="userinfo_layer"
				style="top: 300px; margin-left: -188px; display: none;">
				<!-- 임시스타일 -->
				<div class="inner_myinfo_layer">
					<div class="layer_head">
						<strong class="screen_out">아이디 찾기 안내 레이어</strong>
					</div>
					<div class="layer_body">

						<div class="btn_process">
							<button type="button" id="maxCountOverOkBtn"
								class="btn_find btn_ok">
								<span class="screen_out">확인</span>
							</button>
						</div>
					</div>
					<div class="layer_foot">
						<button type="button" class="btn_find btn_close">닫기</button>
					</div>
				</div>
			</div>
			<div id="errorLayer" class="userinfo_layer"
				style="top: 300px; margin-left: -188px; display: none;">
				<div class="inner_myinfo_layer">
					<div class="layer_head">
						<strong class="screen_out">아이디 찾기 안내 레이어</strong>
					</div>
					<div class="layer_body">
						<strong class="tit_layer">입력해주신 정보로 아이디찾기가 불가능합니다.</strong>
						<p class="desc_info">다른 방법으로 찾으시거나, 고객센터로 문의해 주시기 바랍니다.</p>
						<div class="btn_process">
							<button type="button" id="errorOkBtn" class="btn_find btn_ok">
								<span class="screen_out">확인</span>
							</button>
						</div>
					</div>
					<div class="layer_foot">
						<button type="button" class="btn_find btn_close">닫기</button>
					</div>
				</div>
			</div>
		</div>
		<!-- // daumContent -->
		<form id="nameCheckResultForm" action="/find/id.do?action=ids"
			method="post">
			<input type="hidden" id="nameCheckResultSearchType" name="searchType"
				value="" />
		</form>
		<hr class="hide">
	  <div id="daumFoot" class="footer_comm" role="contentinfo">
  <h2 class="screen_out">서비스 이용정보</h2>
  <a href="http://policy.daum.net/info/info" class="link_info" target="_blank">서비스 약관/정책</a> |
  <a href="http://policy.daum.net/info_protection/info_protection" class="link_info" target="_blank">개인정보처리방침</a> |
  <a href="https://cs.daum.net/redbell/top.html" class="link_info" target="_blank">권리침해신고</a> | 
  <a href="http://cs.daum.net/faq/59.html" target="_blank" class="link_info">고객센터</a> 
  <address class="txt_copyright">Copyright &#169; <a href="http://www.kakaocorp.com" class="link_daum" style="font-weight: bold">OgigeMapGo Corp.</a> All rights reserved.</address>
</div>
		<script type="text/javascript">
			var minidaum_options = {
				// background 타입 지정 관련 옵션. default: white.
				bgType : "white", // white, dark, custom(no background)
				// logout 시 return url 변경 여부 flag : default: false - 다음탑으로 이동
				enableLogoutRetun : false, // false - 다음탑으로 이동, true - 현재페이지 혹은 returnUrl 값으로 이동
				returnUrl : '', // default - 현재페이지(window.location.href)
				// 실시간 이슈 사용 여부, default: false
				disableHotissue : false, // false일 경우 사용, true일 경우 미사용
				// 로고 사용 여부, default: false
				disableLogo : false, // false일 경우 사용, true일 경우 미사용
				// 티아라 사용 여부, default: false
				disableTracker : false, // false일 경우 사용, true일 경우 미사용
				// 플래시에 의한 레이어 가림 현상 방지 사용 여부, default: false
				enableShield : false
			// false일 경우 미사용, true일 경우 사용
			}
		</script>
		<script src="https://go.daum.net/jsa_minidaum_pc.daum" charset="utf-8"
			type="text/javascript"></script>
		<script type="text/javascript"
			src="https://s1.daumcdn.net/svc/original/U03/cssjs/jquery/jquery-1.10.2.min.js"></script>
	</div>
	<!-- daumWrap -->

	<script type="text/javascript"
		src="/content/js/jquery.form.validate.js?v=170601010314"></script>
	<script type="text/javascript"
		src="/content/js/jquery.form.member.init.js?v=170601010314"></script>
	<script type="text/javascript"
		src="/content/js/namecheck-support.js?v=170601010314"></script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							var validatorMobile = $("#findIdMobileForm")
									.validate({
										rules : {
											searchName : {
												required : true
											},
											searchMobile : {
												required : true,
											}

										},
										messages : {
											searchName : "이름 또는 닉네임을 입력해 주세요.",
											searchMobile : "휴대폰 번호를 입력해 주세요."
										}
									});

							var validatorContact = $("#findIdEmailForm")
									.validate(
											{
												rules : {
													searchName : {
														required : true
													},
													searchEmail : {
														required : true,
														contact : true
													}

												},
												messages : {
													searchName : "이름 또는 닉네임을 입력해 주세요.",
													searchEmail : {
														required : "이메일 주소를 입력해 주세요.",
														contact : "이메일 주소를 정확히 입력해 주세요."
													}
												}
											});
							var validatorNameBirthGender = $(
									"#findIdNameBirhGenderForm").validate({
								rules : {
									searchName : {
										required : true
									},
									searchBirthYear : {
										required : true
									}

								}
							});
							var validatorCorp = $("#findIdCorpForm").validate({
								rules : {
									searchRegnum : {
										required : true,
										regnum : true
									},
									searchContact : {
										required : true
									}

								},
								messages : {
									searchContact : "휴대폰 또는 이메일 주소를 입력해 주세요."
								}
							});

							var form = $("#findIdHome").getForm();
							form.initWebRow('.bg_find');
							form.initWebRadioRow('.list_certify');
							form.initTabFocusWeb('.choice_comm');
							form.bindingRadioChangeEvent('searchType')

							$("#findIdEmailForm").submit(
									function() {
										var errorList = validatorContact
												.getFormErrorList();
										if (errorList.length != 0) {
											for (var i = 0; errorList[i]; i++) {
												var error = errorList[i];
												form.showError(
														error.element.id,
														error.message);
											}
											errorList[0].element.focus();
											return false;
										}
										return true;
									});
							$("#findIdMobileForm").submit(
									function() {
										var errorList = validatorMobile
												.getFormErrorList();
										if (errorList.length != 0) {
											for (var i = 0; errorList[i]; i++) {
												var error = errorList[i];
												form.showError(
														error.element.id,
														error.message);
											}
											errorList[0].element.focus();
											return false;
										}
										return true;
									});

							$("#findIdNameBirhGenderForm")
									.submit(
											function() {
												var errorList = validatorNameBirthGender
														.getFormErrorList();
												if (errorList.length != 0) {
													for (var i = 0; errorList[i]; i++) {
														var error = errorList[i];
														form
																.showError(
																		error.element.id,
																		error.message);
													}
													errorList[0].element
															.focus();
													form.showError(
															'searchBirthMonth',
															'');
													form.showError(
															'searchGender', '');
													form
															.showError(
																	'searchBirthDay',
																	'이름, 생년월일, 성별을 정확히 입력해주세요.');
													return false;
												}
												return true;
											});

							$("#findIdCorpForm").submit(
									function() {
										var errorList = validatorCorp
												.getFormErrorList();
										if (errorList.length != 0) {
											for (var i = 0; errorList[i]; i++) {
												var error = errorList[i];
												form.showError(
														error.element.id,
														error.message);
											}
											errorList[0].element.focus();
											return false;
										}
										return true;
									});

							var openItem;

							$(document)
									.on(
											"click",
											function(event) {
												if (event.target.id != openItem) {
													if (openItem == "searchBirthMonth") {
														$("#innerBirthMonth")
																.removeClass(
																		"opt_open")
																.removeClass(
																		"opt_on");
														openItem = "";
													} else if (openItem == "searchBirthDay") {
														$("#innerBirthDay")
																.removeClass(
																		"opt_open")
																.removeClass(
																		"opt_on");
														openItem = "";
													} else if (openItem == "searchGender") {
														$("#innerGender")
																.removeClass(
																		"opt_open")
																.removeClass(
																		"opt_on");
														openItem = "";
													}
												}
											});

							$("#selectBirthMonth")
									.on(
											"click",
											function(e) {
												if ($("#innerBirthMonth")
														.hasClass("opt_open")) {
													$("#innerBirthMonth")
															.removeClass(
																	"opt_open")
															.removeClass(
																	"opt_on");
												} else {
													$("#innerBirthMonth")
															.addClass(
																	"opt_open")
															.addClass("opt_on");
													if (openItem != "") {
														$("#innerBirthDay")
																.removeClass(
																		"opt_open")
																.removeClass(
																		"opt_on");
														$("#innerGender")
																.removeClass(
																		"opt_open")
																.removeClass(
																		"opt_on");
														;
													}
													openItem = $(this).attr(
															"id");

												}
											});

							$("#selectBirthDay")
									.on(
											"click",
											function() {
												if ($("#innerBirthDay")
														.hasClass("opt_open")) {
													$("#innerBirthDay")
															.removeClass(
																	"opt_open")
															.removeClass(
																	"opt_on");
												} else {
													$("#innerBirthDay")
															.addClass(
																	"opt_open")
															.addClass("opt_on");
													if (openItem != "") {
														$("#innerBirthMonth")
																.removeClass(
																		"opt_open")
																.removeClass(
																		"opt_on");
														$("#innerGender")
																.removeClass(
																		"opt_open")
																.removeClass(
																		"opt_on");
													}
													openItem = $(this).attr(
															"id");
												}
											});

							$("#selectGender")
									.on(
											"click",
											function() {
												if ($("#innerGender").hasClass(
														"opt_open")) {
													$("#innerGender")
															.removeClass(
																	"opt_open")
															.removeClass(
																	"opt_on");
												} else {
													$("#innerGender").addClass(
															"opt_open")
															.addClass("opt_on");
													if (openItem != "") {
														$("#innerBirthMonth")
																.removeClass(
																		"opt_open")
																.removeClass(
																		"opt_on");
														$("#innerBirthDay")
																.removeClass(
																		"opt_open")
																.removeClass(
																		"opt_on");
													}
													openItem = $(this).attr(
															"id");
												}
											});

							$("#listMonth li").click(
									function() {
										$("#selectBirthMonth").text(
												$(this).text())
										$("#innerBirthMonth").removeClass(
												"opt_open").removeClass(
												"opt_on").addClass("focus_out")
										$("#searchBirthMonth").val(
												$(this).text().substr(0, 2));
										$("#innerBirthMonth").removeClass(
												"input_wrong")
									});

							$("#listDay li").click(
									function() {
										$("#selectBirthDay").text(
												$(this).text())
										$("#innerBirthDay").removeClass(
												"opt_open").removeClass(
												"opt_on").addClass("focus_out")
										$("#searchBirthDay").val(
												$(this).text().substr(0, 2));
										$("#innerBirthDay").removeClass(
												"input_wrong");
									});

							$("#listGender li")
									.click(
											function() {
												$("#selectGender").text(
														$(this).text())
												$("#innerGender").removeClass(
														"opt_open")
														.removeClass("opt_on")
														.addClass("focus_out")
												if ($(this).text().substr(0, 2) === "남자") {
													$("#searchGender").val("M");
												} else {
													$("#searchGender").val("F");
												}
												$("#innerGender").removeClass(
														"input_wrong");
											});
							$(".btn_close, .btn_ok, .btn_numnot").on("click",
									function() {
										form.hideAllLayer();
									});

							var nameChecker = new SirenRealNameCheck("findid");
							$("#sirenSMSBtn").on("click", function() {
								nameChecker.openSMS();
							});
							$("#sirenIpinBtn, #newIpin").on("click",
									function() {
										nameChecker.openIpin();
									});

						});

		function goNextStep(authType, code) {
			if (authType == "SIREN_IPIN") {
				$("#nameCheckResultSearchType").val("ipin")
			} else if (authType == "SIREN_SMS") {
				$("#nameCheckResultSearchType").val("sms")
			}
			$("#nameCheckResultForm").submit();
		}

		$(window).load(
				function() {
					initAutoComplete($(".bg_nation"),
							$("#searchMobileNational"),
							$("#searchMobileNationalCode"));
					setConnLocation();
				});
	</script>
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/jquery-ui-1.10.4.custom.css">
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/jquery-ui-1.10.4.custom.js">
		
	</script>
	<script type="text/javascript">
		var data;
		var connLocation;
		$(document)
				.ready(
						function() {
							data = [
									{
										"countryCode" : "US",
										"phoneCode" : "1",
										"countryName" : "United States",
										"countryNameKo" : "미국",
										"viewOrder" : "1"
									},
									{
										"countryCode" : "CN",
										"phoneCode" : "86",
										"countryName" : "China",
										"countryNameKo" : "중국",
										"viewOrder" : "2"
									},
									{
										"countryCode" : "CA",
										"phoneCode" : "1",
										"countryName" : "Canada",
										"countryNameKo" : "캐나다",
										"viewOrder" : "3"
									},
									{
										"countryCode" : "JP",
										"phoneCode" : "81",
										"countryName" : "Japan",
										"countryNameKo" : "일본",
										"viewOrder" : "4"
									},
									{
										"countryCode" : "AU",
										"phoneCode" : "61",
										"countryName" : "Australia",
										"countryNameKo" : "호주",
										"viewOrder" : "6"
									},
									{
										"countryCode" : "PH",
										"phoneCode" : "63",
										"countryName" : "Philippines",
										"countryNameKo" : "필리핀",
										"viewOrder" : "7"
									},
									{
										"countryCode" : "TH",
										"phoneCode" : "66",
										"countryName" : "Thailand",
										"countryNameKo" : "타이",
										"viewOrder" : "8"
									},
									{
										"countryCode" : "ID",
										"phoneCode" : "62",
										"countryName" : "Indonesia",
										"countryNameKo" : "인도네시아",
										"viewOrder" : "9"
									},
									{
										"countryCode" : "TW",
										"phoneCode" : "886",
										"countryName" : "Taiwan",
										"countryNameKo" : "대만",
										"viewOrder" : "10"
									},
									{
										"countryCode" : "KR",
										"phoneCode" : "82",
										"countryName" : "Korea, Republic of",
										"countryNameKo" : "대한민국",
										"viewOrder" : "11"
									},
									{
										"countryCode" : "GH",
										"phoneCode" : "233",
										"countryName" : "Ghana",
										"countryNameKo" : "가나"
									},
									{
										"countryCode" : "GA",
										"phoneCode" : "241",
										"countryName" : "Gabon",
										"countryNameKo" : "가봉"
									},
									{
										"countryCode" : "GY",
										"phoneCode" : "592",
										"countryName" : "Guyana",
										"countryNameKo" : "가이아나"
									},
									{
										"countryCode" : "GM",
										"phoneCode" : "220",
										"countryName" : "Gambia",
										"countryNameKo" : "감비아"
									},
									{
										"countryCode" : "GP",
										"phoneCode" : "590",
										"countryName" : "Guadeloupe",
										"countryNameKo" : "과들루프"
									},
									{
										"countryCode" : "GT",
										"phoneCode" : "502",
										"countryName" : "Guatemala",
										"countryNameKo" : "과테말라"
									},
									{
										"countryCode" : "GU",
										"phoneCode" : "1671",
										"countryName" : "Guam",
										"countryNameKo" : "괌"
									},
									{
										"countryCode" : "GD",
										"phoneCode" : "1473",
										"countryName" : "Grenada",
										"countryNameKo" : "그레나다"
									},
									{
										"countryCode" : "GR",
										"phoneCode" : "30",
										"countryName" : "Greece",
										"countryNameKo" : "그리스"
									},
									{
										"countryCode" : "GL",
										"phoneCode" : "299",
										"countryName" : "Greenland",
										"countryNameKo" : "그린란드"
									},
									{
										"countryCode" : "GN",
										"phoneCode" : "224",
										"countryName" : "Guinea",
										"countryNameKo" : "기니"
									},
									{
										"countryCode" : "GW",
										"phoneCode" : "245",
										"countryName" : "Guinea-Bissau",
										"countryNameKo" : "기니비사우"
									},
									{
										"countryCode" : "NA",
										"phoneCode" : "264",
										"countryName" : "Namibia",
										"countryNameKo" : "나미비아"
									},
									{
										"countryCode" : "NR",
										"phoneCode" : "674",
										"countryName" : "Nauru",
										"countryNameKo" : "나우루"
									},
									{
										"countryCode" : "NG",
										"phoneCode" : "234",
										"countryName" : "Nigeria",
										"countryNameKo" : "나이지리아"
									},
									{
										"countryCode" : "AQ",
										"phoneCode" : "672",
										"countryName" : "Antarctica",
										"countryNameKo" : "남극"
									},
									{
										"countryCode" : "SS",
										"phoneCode" : "211",
										"countryName" : "South Sudan",
										"countryNameKo" : "남수단"
									},
									{
										"countryCode" : "ZA",
										"phoneCode" : "27",
										"countryName" : "South Africa",
										"countryNameKo" : "남아프리카 공화국"
									},
									{
										"countryCode" : "NL",
										"phoneCode" : "31",
										"countryName" : "Netherlands",
										"countryNameKo" : "네덜란드"
									},
									{
										"countryCode" : "AN",
										"phoneCode" : "599",
										"countryName" : "Netherlands Antilles",
										"countryNameKo" : "네덜란드령 안틸레스"
									},
									{
										"countryCode" : "NP",
										"phoneCode" : "977",
										"countryName" : "Nepal",
										"countryNameKo" : "네팔"
									},
									{
										"countryCode" : "NO",
										"phoneCode" : "47",
										"countryName" : "Norway",
										"countryNameKo" : "노르웨이"
									},
									{
										"countryCode" : "NC",
										"phoneCode" : "687",
										"countryName" : "New Caledonia",
										"countryNameKo" : "누벨칼레도니"
									},
									{
										"countryCode" : "NZ",
										"phoneCode" : "64",
										"countryName" : "New Zealand",
										"countryNameKo" : "뉴질랜드"
									},
									{
										"countryCode" : "NU",
										"phoneCode" : "683",
										"countryName" : "Niue",
										"countryNameKo" : "니우에"
									},
									{
										"countryCode" : "NE",
										"phoneCode" : "227",
										"countryName" : "Niger",
										"countryNameKo" : "니제르"
									},
									{
										"countryCode" : "NI",
										"phoneCode" : "505",
										"countryName" : "Nicaragua",
										"countryNameKo" : "니카라과"
									},
									{
										"countryCode" : "DK",
										"phoneCode" : "45",
										"countryName" : "Denmark",
										"countryNameKo" : "덴마크"
									},
									{
										"countryCode" : "DO",
										"phoneCode" : "1829",
										"countryName" : "Dominican Republic",
										"countryNameKo" : "도미니카 공화국"
									},
									{
										"countryCode" : "DO",
										"phoneCode" : "1809",
										"countryName" : "Dominican Republic",
										"countryNameKo" : "도미니카 공화국"
									},
									{
										"countryCode" : "DO",
										"phoneCode" : "1849",
										"countryName" : "Dominican Republic",
										"countryNameKo" : "도미니카 공화국"
									},
									{
										"countryCode" : "DM",
										"phoneCode" : "1767",
										"countryName" : "Dominica",
										"countryNameKo" : "도미니카 연방"
									},
									{
										"countryCode" : "DE",
										"phoneCode" : "49",
										"countryName" : "Germany",
										"countryNameKo" : "독일"
									},
									{
										"countryCode" : "TP",
										"phoneCode" : "670",
										"countryName" : "East Timor",
										"countryNameKo" : "동티모르"
									},
									{
										"countryCode" : "LA",
										"phoneCode" : "856",
										"countryName" : "Lao People\u0027s Democratic Republic",
										"countryNameKo" : "라오스"
									},
									{
										"countryCode" : "LR",
										"phoneCode" : "231",
										"countryName" : "Liberia",
										"countryNameKo" : "라이베리아"
									},
									{
										"countryCode" : "LV",
										"phoneCode" : "371",
										"countryName" : "Latvia",
										"countryNameKo" : "라트비아"
									},
									{
										"countryCode" : "RU",
										"phoneCode" : "7",
										"countryName" : "Russian Federation",
										"countryNameKo" : "러시아"
									},
									{
										"countryCode" : "LB",
										"phoneCode" : "961",
										"countryName" : "Lebanon",
										"countryNameKo" : "레바논"
									},
									{
										"countryCode" : "LS",
										"phoneCode" : "266",
										"countryName" : "Lesotho",
										"countryNameKo" : "레소토"
									},
									{
										"countryCode" : "RE",
										"phoneCode" : "262",
										"countryName" : "Reunion",
										"countryNameKo" : "레위니옹"
									},
									{
										"countryCode" : "RO",
										"phoneCode" : "40",
										"countryName" : "Romania",
										"countryNameKo" : "루마니아"
									},
									{
										"countryCode" : "LU",
										"phoneCode" : "352",
										"countryName" : "Luxembourg",
										"countryNameKo" : "룩셈부르크"
									},
									{
										"countryCode" : "RW",
										"phoneCode" : "250",
										"countryName" : "Rwanda",
										"countryNameKo" : "르완다"
									},
									{
										"countryCode" : "LY",
										"phoneCode" : "218",
										"countryName" : "Libyan Arab Jamahiriya",
										"countryNameKo" : "리비아"
									},
									{
										"countryCode" : "LT",
										"phoneCode" : "370",
										"countryName" : "Lithuania",
										"countryNameKo" : "리투아니아"
									},
									{
										"countryCode" : "LI",
										"phoneCode" : "423",
										"countryName" : "Liechtenstein",
										"countryNameKo" : "리히텐슈타인"
									},
									{
										"countryCode" : "MG",
										"phoneCode" : "261",
										"countryName" : "Madagascar",
										"countryNameKo" : "마다가스카르"
									},
									{
										"countryCode" : "MQ",
										"phoneCode" : "596",
										"countryName" : "Martinique",
										"countryNameKo" : "마르티니크"
									},
									{
										"countryCode" : "MH",
										"phoneCode" : "692",
										"countryName" : "Marshall Islands",
										"countryNameKo" : "마셜 제도"
									},
									{
										"countryCode" : "YT",
										"phoneCode" : "269",
										"countryName" : "Mayotte",
										"countryNameKo" : "마요트"
									},
									{
										"countryCode" : "MO",
										"phoneCode" : "853",
										"countryName" : "Macau",
										"countryNameKo" : "마카오"
									},
									{
										"countryCode" : "MK",
										"phoneCode" : "389",
										"countryName" : "Macedonia",
										"countryNameKo" : "마케도니아 공화국"
									},
									{
										"countryCode" : "MW",
										"phoneCode" : "265",
										"countryName" : "Malawi",
										"countryNameKo" : "말라위"
									},
									{
										"countryCode" : "MY",
										"phoneCode" : "60",
										"countryName" : "Malaysia",
										"countryNameKo" : "말레이시아"
									},
									{
										"countryCode" : "ML",
										"phoneCode" : "223",
										"countryName" : "Mali",
										"countryNameKo" : "말리"
									},
									{
										"countryCode" : "MX",
										"phoneCode" : "52",
										"countryName" : "Mexico",
										"countryNameKo" : "멕시코"
									},
									{
										"countryCode" : "MC",
										"phoneCode" : "377",
										"countryName" : "Monaco",
										"countryNameKo" : "모나코"
									},
									{
										"countryCode" : "MA",
										"phoneCode" : "212",
										"countryName" : "Morocco",
										"countryNameKo" : "모로코"
									},
									{
										"countryCode" : "MU",
										"phoneCode" : "230",
										"countryName" : "Mauritius",
										"countryNameKo" : "모리셔스"
									},
									{
										"countryCode" : "MR",
										"phoneCode" : "222",
										"countryName" : "Mauritania",
										"countryNameKo" : "모리타니"
									},
									{
										"countryCode" : "MZ",
										"phoneCode" : "258",
										"countryName" : "Mozambique",
										"countryNameKo" : "모잠비크"
									},
									{
										"countryCode" : "ME",
										"phoneCode" : "382",
										"countryName" : "Montenegro",
										"countryNameKo" : "몬테네그로"
									},
									{
										"countryCode" : "MS",
										"phoneCode" : "1664",
										"countryName" : "Montserrat",
										"countryNameKo" : "몬트세랫"
									},
									{
										"countryCode" : "MD",
										"phoneCode" : "373",
										"countryName" : "Moldova, Republic of",
										"countryNameKo" : "몰도바"
									},
									{
										"countryCode" : "MV",
										"phoneCode" : "960",
										"countryName" : "Maldives",
										"countryNameKo" : "몰디브"
									},
									{
										"countryCode" : "MT",
										"phoneCode" : "356",
										"countryName" : "Malta",
										"countryNameKo" : "몰타"
									},
									{
										"countryCode" : "MN",
										"phoneCode" : "976",
										"countryName" : "Mongolia",
										"countryNameKo" : "몽골"
									},
									{
										"countryCode" : "VI",
										"phoneCode" : "1340",
										"countryName" : "Virgin Islands, U.S.",
										"countryNameKo" : "미국령 버진아일랜드"
									},
									{
										"countryCode" : "MM",
										"phoneCode" : "95",
										"countryName" : "Myanmar",
										"countryNameKo" : "미얀마"
									},
									{
										"countryCode" : "FM",
										"phoneCode" : "691",
										"countryName" : "Micronesia, Federated States of",
										"countryNameKo" : "미크로네시아 연방"
									},
									{
										"countryCode" : "VU",
										"phoneCode" : "678",
										"countryName" : "Vanuatu",
										"countryNameKo" : "바누아투"
									},
									{
										"countryCode" : "BH",
										"phoneCode" : "973",
										"countryName" : "Bahrain",
										"countryNameKo" : "바레인"
									},
									{
										"countryCode" : "BB",
										"phoneCode" : "1246",
										"countryName" : "Barbados",
										"countryNameKo" : "바베이도스"
									},
									{
										"countryCode" : "BS",
										"phoneCode" : "1242",
										"countryName" : "Bahamas",
										"countryNameKo" : "바하마"
									},
									{
										"countryCode" : "BD",
										"phoneCode" : "880",
										"countryName" : "Bangladesh",
										"countryNameKo" : "방글라데시"
									},
									{
										"countryCode" : "BM",
										"phoneCode" : "1441",
										"countryName" : "Bermuda",
										"countryNameKo" : "버뮤다"
									},
									{
										"countryCode" : "BJ",
										"phoneCode" : "229",
										"countryName" : "Benin",
										"countryNameKo" : "베냉"
									},
									{
										"countryCode" : "VE",
										"phoneCode" : "58",
										"countryName" : "Venezuela",
										"countryNameKo" : "베네수엘라"
									},
									{
										"countryCode" : "VN",
										"phoneCode" : "84",
										"countryName" : "Vietnam",
										"countryNameKo" : "베트남"
									},
									{
										"countryCode" : "BE",
										"phoneCode" : "32",
										"countryName" : "Belgium",
										"countryNameKo" : "벨기에"
									},
									{
										"countryCode" : "BY",
										"phoneCode" : "375",
										"countryName" : "Belarus",
										"countryNameKo" : "벨라루스"
									},
									{
										"countryCode" : "BZ",
										"phoneCode" : "501",
										"countryName" : "Belize",
										"countryNameKo" : "벨리즈"
									},
									{
										"countryCode" : "BA",
										"phoneCode" : "387",
										"countryName" : "Bosnia and Herzegovina",
										"countryNameKo" : "보스니아 헤르체고비나"
									},
									{
										"countryCode" : "BW",
										"phoneCode" : "267",
										"countryName" : "Botswana",
										"countryNameKo" : "보츠와나"
									},
									{
										"countryCode" : "BO",
										"phoneCode" : "591",
										"countryName" : "Bolivia",
										"countryNameKo" : "볼리비아"
									},
									{
										"countryCode" : "BI",
										"phoneCode" : "257",
										"countryName" : "Burundi",
										"countryNameKo" : "부룬디"
									},
									{
										"countryCode" : "BF",
										"phoneCode" : "226",
										"countryName" : "Burkina Faso",
										"countryNameKo" : "부르키나파소"
									},
									{
										"countryCode" : "BT",
										"phoneCode" : "975",
										"countryName" : "Bhutan",
										"countryNameKo" : "부탄"
									},
									{
										"countryCode" : "MP",
										"phoneCode" : "1670",
										"countryName" : "Northern Mariana Islands",
										"countryNameKo" : "북마리아나 제도"
									},
									{
										"countryCode" : "BG",
										"phoneCode" : "359",
										"countryName" : "Bulgaria",
										"countryNameKo" : "불가리아"
									},
									{
										"countryCode" : "BR",
										"phoneCode" : "55",
										"countryName" : "Brazil",
										"countryNameKo" : "브라질"
									},
									{
										"countryCode" : "BN",
										"phoneCode" : "673",
										"countryName" : "Brunei Darussalam",
										"countryNameKo" : "브루나이"
									},
									{
										"countryCode" : "WS",
										"phoneCode" : "685",
										"countryName" : "Samoa",
										"countryNameKo" : "사모아"
									},
									{
										"countryCode" : "SA",
										"phoneCode" : "966",
										"countryName" : "Saudi Arabia",
										"countryNameKo" : "사우디아라비아"
									},
									{
										"countryCode" : "SM",
										"phoneCode" : "378",
										"countryName" : "San Marino",
										"countryNameKo" : "산마리노"
									},
									{
										"countryCode" : "ST",
										"phoneCode" : "239",
										"countryName" : "Sao Tome and Principe",
										"countryNameKo" : "상투메 프린시페"
									},
									{
										"countryCode" : "PM",
										"phoneCode" : "508",
										"countryName" : "Saint Pierre and Miquelon",
										"countryNameKo" : "생피에르 미클롱"
									},
									{
										"countryCode" : "SN",
										"phoneCode" : "221",
										"countryName" : "Senegal",
										"countryNameKo" : "세네갈"
									},
									{
										"countryCode" : "RS",
										"phoneCode" : "381",
										"countryName" : "Serbia",
										"countryNameKo" : "세르비아"
									},
									{
										"countryCode" : "SC",
										"phoneCode" : "248",
										"countryName" : "Seychelles",
										"countryNameKo" : "세이셸"
									},
									{
										"countryCode" : "LC",
										"phoneCode" : "1758",
										"countryName" : "Saint Lucia",
										"countryNameKo" : "세인트루시아"
									},
									{
										"countryCode" : "VC",
										"phoneCode" : "1784",
										"countryName" : "Saint Vincent and the Grenadines",
										"countryNameKo" : "세인트빈센트 그레나딘"
									},
									{
										"countryCode" : "KN",
										"phoneCode" : "1869",
										"countryName" : "Saint Kitts and Nevis",
										"countryNameKo" : "세인트키츠 네비스"
									},
									{
										"countryCode" : "SH",
										"phoneCode" : "290",
										"countryName" : "Saint Helena",
										"countryNameKo" : "세인트헬레나"
									},
									{
										"countryCode" : "SO",
										"phoneCode" : "252",
										"countryName" : "Somalia",
										"countryNameKo" : "소말리아"
									},
									{
										"countryCode" : "SB",
										"phoneCode" : "677",
										"countryName" : "Solomon Islands",
										"countryNameKo" : "솔로몬 제도"
									},
									{
										"countryCode" : "SD",
										"phoneCode" : "249",
										"countryName" : "Sudan",
										"countryNameKo" : "수단"
									},
									{
										"countryCode" : "SR",
										"phoneCode" : "597",
										"countryName" : "Suriname",
										"countryNameKo" : "수리남"
									},
									{
										"countryCode" : "LK",
										"phoneCode" : "94",
										"countryName" : "Sri Lanka",
										"countryNameKo" : "스리랑카"
									},
									{
										"countryCode" : "SZ",
										"phoneCode" : "268",
										"countryName" : "Swaziland",
										"countryNameKo" : "스와질란드"
									},
									{
										"countryCode" : "SE",
										"phoneCode" : "46",
										"countryName" : "Sweden",
										"countryNameKo" : "스웨덴"
									},
									{
										"countryCode" : "CH",
										"phoneCode" : "41",
										"countryName" : "Switzerland",
										"countryNameKo" : "스위스"
									},
									{
										"countryCode" : "ES",
										"phoneCode" : "34",
										"countryName" : "Spain",
										"countryNameKo" : "스페인"
									},
									{
										"countryCode" : "SK",
										"phoneCode" : "421",
										"countryName" : "Slovakia",
										"countryNameKo" : "슬로바키아"
									},
									{
										"countryCode" : "SI",
										"phoneCode" : "386",
										"countryName" : "Slovenia",
										"countryNameKo" : "슬로베니아"
									},
									{
										"countryCode" : "SY",
										"phoneCode" : "963",
										"countryName" : "Syrian Arab Republic",
										"countryNameKo" : "시리아"
									},
									{
										"countryCode" : "SL",
										"phoneCode" : "232",
										"countryName" : "Sierra Leone",
										"countryNameKo" : "시에라리온"
									},
									{
										"countryCode" : "SX",
										"phoneCode" : "1721",
										"countryName" : "Sint Maarten (Dutch part)",
										"countryNameKo" : "신트마르턴"
									},
									{
										"countryCode" : "SG",
										"phoneCode" : "65",
										"countryName" : "Singapore",
										"countryNameKo" : "싱가포르"
									},
									{
										"countryCode" : "AE",
										"phoneCode" : "971",
										"countryName" : "United Arab Emirates",
										"countryNameKo" : "아랍에미리트"
									},
									{
										"countryCode" : "AW",
										"phoneCode" : "297",
										"countryName" : "Aruba",
										"countryNameKo" : "아루바"
									},
									{
										"countryCode" : "AM",
										"phoneCode" : "374",
										"countryName" : "Armenia",
										"countryNameKo" : "아르메니아"
									},
									{
										"countryCode" : "AR",
										"phoneCode" : "54",
										"countryName" : "Argentina",
										"countryNameKo" : "아르헨티나"
									},
									{
										"countryCode" : "AS",
										"phoneCode" : "1684",
										"countryName" : "American Samoa",
										"countryNameKo" : "아메리칸사모아"
									},
									{
										"countryCode" : "IS",
										"phoneCode" : "354",
										"countryName" : "Iceland",
										"countryNameKo" : "아이슬란드"
									},
									{
										"countryCode" : "HT",
										"phoneCode" : "509",
										"countryName" : "Haiti",
										"countryNameKo" : "아이티"
									},
									{
										"countryCode" : "IE",
										"phoneCode" : "353",
										"countryName" : "Ireland",
										"countryNameKo" : "아일랜드"
									},
									{
										"countryCode" : "AZ",
										"phoneCode" : "994",
										"countryName" : "Azerbaijan",
										"countryNameKo" : "아제르바이잔"
									},
									{
										"countryCode" : "AF",
										"phoneCode" : "93",
										"countryName" : "Afghanistan",
										"countryNameKo" : "아프가니스탄"
									},
									{
										"countryCode" : "AD",
										"phoneCode" : "376",
										"countryName" : "Andorra",
										"countryNameKo" : "안도라"
									},
									{
										"countryCode" : "AL",
										"phoneCode" : "355",
										"countryName" : "Albania",
										"countryNameKo" : "알바니아"
									},
									{
										"countryCode" : "DZ",
										"phoneCode" : "213",
										"countryName" : "Algeria",
										"countryNameKo" : "알제리"
									},
									{
										"countryCode" : "AO",
										"phoneCode" : "244",
										"countryName" : "Angola",
										"countryNameKo" : "앙골라"
									},
									{
										"countryCode" : "AG",
										"phoneCode" : "1268",
										"countryName" : "Antigua and Barbuda",
										"countryNameKo" : "앤티가 바부다"
									},
									{
										"countryCode" : "AI",
										"phoneCode" : "1264",
										"countryName" : "Anguilla",
										"countryNameKo" : "앵귈라"
									},
									{
										"countryCode" : "ER",
										"phoneCode" : "291",
										"countryName" : "Eritrea",
										"countryNameKo" : "에리트레아"
									},
									{
										"countryCode" : "EE",
										"phoneCode" : "372",
										"countryName" : "Estonia",
										"countryNameKo" : "에스토니아"
									},
									{
										"countryCode" : "EC",
										"phoneCode" : "593",
										"countryName" : "Ecuador",
										"countryNameKo" : "에콰도르"
									},
									{
										"countryCode" : "ET",
										"phoneCode" : "251",
										"countryName" : "Ethiopia",
										"countryNameKo" : "에티오피아"
									},
									{
										"countryCode" : "SV",
										"phoneCode" : "503",
										"countryName" : "El Salvador",
										"countryNameKo" : "엘살바도르"
									},
									{
										"countryCode" : "GB",
										"phoneCode" : "44",
										"countryName" : "United Kingdom",
										"countryNameKo" : "영국"
									},
									{
										"countryCode" : "VG",
										"phoneCode" : "1284",
										"countryName" : "Virgin Islands, British",
										"countryNameKo" : "영국령 버진아일랜드"
									},
									{
										"countryCode" : "AC",
										"phoneCode" : "247",
										"countryName" : "Ascension Island",
										"countryNameKo" : "영국령 어센션"
									},
									{
										"countryCode" : "IO",
										"phoneCode" : "246",
										"countryName" : "British Indian Ocean Territory",
										"countryNameKo" : "영국령 인도양 지역"
									},
									{
										"countryCode" : "YE",
										"phoneCode" : "967",
										"countryName" : "Yemen",
										"countryNameKo" : "예멘"
									},
									{
										"countryCode" : "OM",
										"phoneCode" : "968",
										"countryName" : "Oman",
										"countryNameKo" : "오만"
									},
									{
										"countryCode" : "AT",
										"phoneCode" : "43",
										"countryName" : "Austria",
										"countryNameKo" : "오스트리아"
									},
									{
										"countryCode" : "HN",
										"phoneCode" : "504",
										"countryName" : "Honduras",
										"countryNameKo" : "온두라스"
									},
									{
										"countryCode" : "WF",
										"phoneCode" : "681",
										"countryName" : "Wallis and Futuna",
										"countryNameKo" : "왈리스 퓌튀나"
									},
									{
										"countryCode" : "JO",
										"phoneCode" : "962",
										"countryName" : "Jordan",
										"countryNameKo" : "요르단"
									},
									{
										"countryCode" : "UG",
										"phoneCode" : "256",
										"countryName" : "Uganda",
										"countryNameKo" : "우간다"
									},
									{
										"countryCode" : "UY",
										"phoneCode" : "598",
										"countryName" : "Uruguay",
										"countryNameKo" : "우루과이"
									},
									{
										"countryCode" : "UZ",
										"phoneCode" : "998",
										"countryName" : "Uzbekistan",
										"countryNameKo" : "우즈베키스탄"
									},
									{
										"countryCode" : "UA",
										"phoneCode" : "380",
										"countryName" : "Ukraine",
										"countryNameKo" : "우크라이나"
									},
									{
										"countryCode" : "IQ",
										"phoneCode" : "964",
										"countryName" : "Iraq",
										"countryNameKo" : "이라크"
									},
									{
										"countryCode" : "IR",
										"phoneCode" : "98",
										"countryName" : "Iran, Islamic Republic of",
										"countryNameKo" : "이란"
									},
									{
										"countryCode" : "IL",
										"phoneCode" : "972",
										"countryName" : "Israel",
										"countryNameKo" : "이스라엘"
									},
									{
										"countryCode" : "EG",
										"phoneCode" : "20",
										"countryName" : "Egypt",
										"countryNameKo" : "이집트"
									},
									{
										"countryCode" : "IT",
										"phoneCode" : "39",
										"countryName" : "Italy",
										"countryNameKo" : "이탈리아"
									},
									{
										"countryCode" : "IN",
										"phoneCode" : "91",
										"countryName" : "India",
										"countryNameKo" : "인도"
									},
									{
										"countryCode" : "JM",
										"phoneCode" : "1876",
										"countryName" : "Jamaica",
										"countryNameKo" : "자메이카"
									},
									{
										"countryCode" : "ZM",
										"phoneCode" : "260",
										"countryName" : "Zambia",
										"countryNameKo" : "잠비아"
									},
									{
										"countryCode" : "GQ",
										"phoneCode" : "240",
										"countryName" : "Equatorial Guinea",
										"countryNameKo" : "적도 기니"
									},
									{
										"countryCode" : "GE",
										"phoneCode" : "995",
										"countryName" : "Georgia",
										"countryNameKo" : "조지아"
									},
									{
										"countryCode" : "CF",
										"phoneCode" : "236",
										"countryName" : "Central African Republic",
										"countryNameKo" : "중앙아프리카 공화국"
									},
									{
										"countryCode" : "DJ",
										"phoneCode" : "253",
										"countryName" : "Djibouti",
										"countryNameKo" : "지부티"
									},
									{
										"countryCode" : "GI",
										"phoneCode" : "350",
										"countryName" : "Gibraltar",
										"countryNameKo" : "지브롤터"
									},
									{
										"countryCode" : "ZW",
										"phoneCode" : "263",
										"countryName" : "Zimbabwe",
										"countryNameKo" : "짐바브웨"
									},
									{
										"countryCode" : "TD",
										"phoneCode" : "235",
										"countryName" : "Chad",
										"countryNameKo" : "차드"
									},
									{
										"countryCode" : "CZ",
										"phoneCode" : "420",
										"countryName" : "Czech Republic",
										"countryNameKo" : "체코"
									},
									{
										"countryCode" : "CS",
										"phoneCode" : "42",
										"countryName" : "Czechoslovakia",
										"countryNameKo" : "체코슬로바키아"
									},
									{
										"countryCode" : "CL",
										"phoneCode" : "56",
										"countryName" : "Chile",
										"countryNameKo" : "칠레"
									},
									{
										"countryCode" : "CM",
										"phoneCode" : "237",
										"countryName" : "Cameroon",
										"countryNameKo" : "카메룬"
									},
									{
										"countryCode" : "CV",
										"phoneCode" : "238",
										"countryName" : "Cape Verde",
										"countryNameKo" : "카보베르데"
									},
									{
										"countryCode" : "QA",
										"phoneCode" : "974",
										"countryName" : "Qatar",
										"countryNameKo" : "카타르"
									},
									{
										"countryCode" : "KH",
										"phoneCode" : "855",
										"countryName" : "Cambodia",
										"countryNameKo" : "캄보디아"
									},
									{
										"countryCode" : "KE",
										"phoneCode" : "254",
										"countryName" : "Kenya",
										"countryNameKo" : "케냐"
									},
									{
										"countryCode" : "KY",
										"phoneCode" : "1345",
										"countryName" : "Cayman Islands",
										"countryNameKo" : "케이맨 제도"
									},
									{
										"countryCode" : "CR",
										"phoneCode" : "506",
										"countryName" : "Costa Rica",
										"countryNameKo" : "코스타리카"
									},
									{
										"countryCode" : "CI",
										"phoneCode" : "225",
										"countryName" : "Cote D\u0027Ivoire",
										"countryNameKo" : "코트디부아르"
									},
									{
										"countryCode" : "CO",
										"phoneCode" : "57",
										"countryName" : "Colombia",
										"countryNameKo" : "콜롬비아"
									},
									{
										"countryCode" : "CG",
										"phoneCode" : "242",
										"countryName" : "Congo",
										"countryNameKo" : "콩고 공화국"
									},
									{
										"countryCode" : "CD",
										"phoneCode" : "243",
										"countryName" : "Congo, The Democratic Republic of the",
										"countryNameKo" : "콩고 민주 공화국"
									},
									{
										"countryCode" : "CU",
										"phoneCode" : "53",
										"countryName" : "Cuba",
										"countryNameKo" : "쿠바"
									},
									{
										"countryCode" : "KW",
										"phoneCode" : "965",
										"countryName" : "Kuwait",
										"countryNameKo" : "쿠웨이트"
									},
									{
										"countryCode" : "CK",
										"phoneCode" : "682",
										"countryName" : "Cook Islands",
										"countryNameKo" : "쿡 제도"
									},
									{
										"countryCode" : "HR",
										"phoneCode" : "385",
										"countryName" : "Croatia",
										"countryNameKo" : "크로아티아"
									},
									{
										"countryCode" : "KG",
										"phoneCode" : "996",
										"countryName" : "Kyrgyzstan",
										"countryNameKo" : "키르기스스탄"
									},
									{
										"countryCode" : "KI",
										"phoneCode" : "686",
										"countryName" : "Kiribati",
										"countryNameKo" : "키리바시"
									},
									{
										"countryCode" : "CY",
										"phoneCode" : "357",
										"countryName" : "Cyprus",
										"countryNameKo" : "키프로스"
									},
									{
										"countryCode" : "TJ",
										"phoneCode" : "992",
										"countryName" : "Tajikistan",
										"countryNameKo" : "타지키스탄"
									},
									{
										"countryCode" : "TZ",
										"phoneCode" : "255",
										"countryName" : "Tanzania, United Republic of",
										"countryNameKo" : "탄자니아"
									},
									{
										"countryCode" : "TC",
										"phoneCode" : "1649",
										"countryName" : "Turks and Caicos Islands",
										"countryNameKo" : "터크스 케이커스 제도"
									},
									{
										"countryCode" : "TR",
										"phoneCode" : "90",
										"countryName" : "Turkey",
										"countryNameKo" : "터키"
									},
									{
										"countryCode" : "TG",
										"phoneCode" : "228",
										"countryName" : "Togo",
										"countryNameKo" : "토고"
									},
									{
										"countryCode" : "TK",
										"phoneCode" : "690",
										"countryName" : "Tokelau",
										"countryNameKo" : "토켈라우"
									},
									{
										"countryCode" : "TO",
										"phoneCode" : "676",
										"countryName" : "Tonga",
										"countryNameKo" : "통가"
									},
									{
										"countryCode" : "TM",
										"phoneCode" : "993",
										"countryName" : "Turkmenistan",
										"countryNameKo" : "투르크메니스탄"
									},
									{
										"countryCode" : "TN",
										"phoneCode" : "216",
										"countryName" : "Tunisia",
										"countryNameKo" : "튀니지"
									},
									{
										"countryCode" : "TT",
										"phoneCode" : "1868",
										"countryName" : "Trinidad and Tobago",
										"countryNameKo" : "트리니다드 토바고"
									},
									{
										"countryCode" : "PA",
										"phoneCode" : "507",
										"countryName" : "Panama",
										"countryNameKo" : "파나마"
									},
									{
										"countryCode" : "PY",
										"phoneCode" : "595",
										"countryName" : "Paraguay",
										"countryNameKo" : "파라과이"
									},
									{
										"countryCode" : "PK",
										"phoneCode" : "92",
										"countryName" : "Pakistan",
										"countryNameKo" : "파키스탄"
									},
									{
										"countryCode" : "PG",
										"phoneCode" : "675",
										"countryName" : "Papua New Guinea",
										"countryNameKo" : "파푸아 뉴기니"
									},
									{
										"countryCode" : "PW",
										"phoneCode" : "680",
										"countryName" : "Palau",
										"countryNameKo" : "팔라우"
									},
									{
										"countryCode" : "PS",
										"phoneCode" : "970",
										"countryName" : "Palestinian Territory, Occupied",
										"countryNameKo" : "팔레스타인"
									},
									{
										"countryCode" : "FO",
										"phoneCode" : "298",
										"countryName" : "Faroe Islands",
										"countryNameKo" : "페로 제도"
									},
									{
										"countryCode" : "PE",
										"phoneCode" : "51",
										"countryName" : "Peru",
										"countryNameKo" : "페루"
									},
									{
										"countryCode" : "PT",
										"phoneCode" : "351",
										"countryName" : "Portugal",
										"countryNameKo" : "포르투갈"
									},
									{
										"countryCode" : "FK",
										"phoneCode" : "500",
										"countryName" : "Falkland Islands (Malvinas)",
										"countryNameKo" : "포클랜드 제도"
									}, {
										"countryCode" : "PL",
										"phoneCode" : "48",
										"countryName" : "Poland",
										"countryNameKo" : "폴란드"
									}, {
										"countryCode" : "PR",
										"phoneCode" : "1939",
										"countryName" : "Puerto Rico",
										"countryNameKo" : "푸에르토리코"
									}, {
										"countryCode" : "PR",
										"phoneCode" : "1787",
										"countryName" : "Puerto Rico",
										"countryNameKo" : "푸에르토리코"
									}, {
										"countryCode" : "FR",
										"phoneCode" : "33",
										"countryName" : "France",
										"countryNameKo" : "프랑스"
									}, {
										"countryCode" : "GF",
										"phoneCode" : "594",
										"countryName" : "French Guiana",
										"countryNameKo" : "프랑스령 기아나"
									}, {
										"countryCode" : "PF",
										"phoneCode" : "689",
										"countryName" : "French Polynesia",
										"countryNameKo" : "프랑스령 폴리네시아"
									}, {
										"countryCode" : "FJ",
										"phoneCode" : "679",
										"countryName" : "Fiji",
										"countryNameKo" : "피지"
									}, {
										"countryCode" : "FI",
										"phoneCode" : "358",
										"countryName" : "Finland",
										"countryNameKo" : "핀란드"
									}, {
										"countryCode" : "HU",
										"phoneCode" : "36",
										"countryName" : "Hungary",
										"countryNameKo" : "헝가리"
									}, {
										"countryCode" : "HK",
										"phoneCode" : "852",
										"countryName" : "Hong Kong",
										"countryNameKo" : "홍콩"
									} ];
							connLocation = ("KR" != "") ? "KR" : "KR";

							$("#inpNationInfo")
									.autocomplete(
											{
												minLength : 0,
												source : $
														.map(
																data,
																function(item) {
																	return {
																		label : item.countryNameKo
																				+ " / "
																				+ item.countryName,
																		value : item.phoneCode,
																		code : item.countryCode
																	}
																}),
												response : function(event, ui) {
													$(".list_nationinfo")
															.empty();
													if (ui.content.length > 0) {
														$(".list_nationinfo")
																.append(
																		'<ul id="list_nation" class="list_nation"></div');
													} else {
														$(".list_nationinfo")
																.html(
																		'<div class="wrap_nodata"><strong class="tit_nodata">검색 결과가 없습니다.</strong><p class="txt_nodata">검색할 국가명(영문,국문) 또는 국가번호를<br>다시 입력해 주세요.</p></div>');
													}
												},
												open : function(event, ui) {
													$(".ui-autocomplete")
															.hide();
												}

											}).data('uiAutocomplete')._renderItem = function(
									ul, item) {
								var label = item.label;
								if (this.term != "") {
									var re = new RegExp("(" + this.term + ")",
											"gi"), cls = "txt_emph", template = "<span class='" + cls + "'>$1</span>", label = item.label
											.replace(re, template);
								}
								var element = '<a href="javascript:;"  class="item_info"><span class="num_item">(+'
										+ item.value
										+ ')</span>'
										+ label
										+ '</a>';

								return $('<li id="' + item.value + '"></li>')
										.append(element)
										.appendTo(".list_nationinfo")
										.on(
												"click",
												function() {
													$(".link_nationnum").html(
															'+' + item.value);
													countryNo.val(item.value);
													countryCode.val(item.code);
													showObject
															.removeClass("input_on");

												})
										.keyup(
												function(e) {
													if (e.keyCode == 13) {
														$(".link_nationnum")
																.html(
																		'+'
																				+ item.value);
														countryNo
																.val(item.value);
														countryCode
																.val(item.code);
														showObject
																.removeClass("input_on");
													}
												});
							};

							$("#inpNationInfo").autocomplete("search").on(
									"keydown", function(e) {
										if (e.keyCode == 13) {
											return false;
										}
									});

							$(".link_nationnum").on("click", function() {
								showObject.toggleClass("input_on");
							});

							$(document)
									.on(
											"keyup mouseup",
											function(e) {
												if (($('.wrap_nationinfo').has(
														$(e.target)).length == 0)
														&& (e.target.className != 'link_nationnum')) {
													if (showObject
															.hasClass("input_on")) {
														showObject
																.removeClass("input_on");
													}
												}
											});

						});
		var showObject;
		var countryNo;
		var countryCode;

		var initAutoComplete = function(showObj, countryNoObj, countryCodeObj) {
			this.showObject = showObj;
			this.countryNo = countryNoObj;
			this.countryCode = countryCodeObj;
			initConnLocation();
		}

		var initConnLocation = function() {
			$.each(data, function(index, item) {
				if (item.countryCode == connLocation) {
					$('.link_nationinfo').html(
							"(+" + item.phoneCode + ") " + item.countryNameKo
									+ " / " + item.countryName)
							.on(
									"click",
									function() {
										$(".link_nationnum").html(
												'+' + item.phoneCode);
										countryNo.val(item.phoneCode);
										countryCode.val(item.countryCode);
										showObject.removeClass("input_on");

									}).keyup(
									function(e) {
										if (e.keyCode == 13) {
											$(".link_nationnum").html(
													'+' + item.phoneCode);
											countryNo.val(item.phoneCode);
											countryCode.val(item.countryCode);
											showObject.removeClass("input_on");
										}
									});

					$('.link_nationinfo').html(
							"(+" + item.phoneCode + ") " + item.countryNameKo
									+ " / " + item.countryName)
					$(".link_nationnum").html('+' + item.phoneCode);
					countryNo.val(item.phoneCode);
					countryCode.val(item.countryCode);
				}
			});
		}

		var setConnLocation = function(searchCountryNo) {
			if (searchCountryNo == "") {
				return;
			}

			$.each(data, function(index, item) {
				if (item.phoneCode == searchCountryNo) {
					$(".link_nationnum").html('+' + item.phoneCode);
					countryNo.val(item.phoneCode);
					countryCode.val(item.countryCode);
				}
			});
		}
	</script>
</body>


