<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta property="og:title" content="HealthIn 회원가입">
<meta property="og:type" content="website">
<meta property="og:description" content="여기를 눌러 링크를 확인하세요.">
<title>가입 정보 입력 | HEALTHIN 회원가입</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta http-equiv="Pragma" content="no-cache" />
<meta name="description" content="HEALTHIN 회원가입">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/join_reform.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/join_reform_font.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jquery-ui-1.10.4.custom.css">
</head>
<body>
	<div id="kakaoIndex">
		<!-- 웹접근성용 바로가기 링크 모음 -->
		<a href="#kakaoBody">본문 바로가기</a>
	</div>

	<div id="kakaoWrap" class="join_personal">
		<div id="kakaoHead">
			<div class="inner_head">
				<h1>
					<a href="${pageContext.request.contextPath}/home.do"
						id="daumServiceLogo" class="ico_join"> <span class="ir_wa"></span></a>
				</h1>
			</div>
		</div>
		<hr class="hide">
		<h2 class="screen_out">회원가입 안내 본문</h2>
		<div id="kakaoBody" class="cont_personal">
			<div class="paging_step">
				<span class="ico_join ico_paging"></span> <span
					class="ico_join ico_paging on"></span> <span
					class="ico_join ico_paging"></span>
			</div>
			<div class="wrap_tit">
				<h3 class="tit_join">가입 정보 입력</h3>
				<div class="txt_desc">로그인 정보 및 가입 정보를 입력하세요.</div>
			</div>
			<form id="joinInput" name="joinInput" action="/join/signup"
				method="POST">
				<fieldset class="fld_comm">
					<legend class="screen_out">가입 정보</legend>
					<div class="wrap_info">
						<div class="box_info">
							<dl class="item_info">
								<dt>
									<label for="inpID" class="lab_info">HealthIn 아이디</label>
								</dt>
								<dd>
									<div class="wrap_inp">
										<label for="daumId" class="txt_placeholder ">아이디</label>
										<!-- 텍스트 입력 시 .screen_out  -->
										<input type="text" id="daumId" name="daumId" class="inp_info"
											value="" autocomplete="off" maxlength="15"> <span
											class="txt_fix txt_domain"></span> <span class="mark_valid"
											style="display: none;"><span
											class="ico_join ico_valid"></span><span class="screen_out">유효</span></span>
									</div>
									<p class="txt_message" style="display: none;">이미 사용된
										HealthIn ID 입니다. 다른 아이디를 입력하세요.</p>
								</dd>
							</dl>
							<dl class="item_info_nickname">
								<dt>
									<label for="inpNick" class="lab_info_nickname">HealthIn 닉네임</label>
								</dt>
								<dd>
									<div class="wrap_inp">
										<label for="nick" class="txt_placeholder ">닉네임</label>
										<!-- 텍스트 입력 시 .screen_out  -->
										<input type="text" id="nickname" name="nickname" class="inp_info_nick"
											value="" autocomplete="off" maxlength="15"> <span
											class="txt_fix txt_domain"></span> <span class="mark_valid"
											style="display: none;"><span
											class="ico_join ico_valid"></span><span class="screen_out">유효</span></span>
									</div>
									<p class="txt_message" style="display: none;">이미 사용된
										NickName 입니다. 다른 Nickname를 입력하세요.</p>
								</dd>
							</dl>
							<dl class="item_info info_password">
								<dt>
									<label for="inpPw" class="lab_info">비밀번호</label>
								</dt>
								<dd>
									<div class="wrap_inp">
										<label for="password1" class="txt_placeholder ">비밀번호
											(8자 이상)</label>
										<!-- 텍스트 입력 시 .screen_out  -->
										<input type="password" id="password1" name="password1"
											class="inp_info pw" value="" maxlength="32"> <span
											class="mark_valid" style="display: none;">불가</span>
									</div>
								</dd>
							</dl>
							<dl class="item_info info_password">
								<dt>
									<label for="inpPw2" class="lab_info">비밀번호 재확인</label>
								</dt>
								<dd>
									<div class="wrap_inp">
										<label for="password2" class="txt_placeholder ">비밀번호
											재확인</label>
										<!-- 텍스트 입력 시 .screen_out  -->
										<input type="password" id="password2" name="password2"
											class="inp_info pw" value="" maxlength="32"> <span
											class="mark_valid" style="display: none;">불일치</span>
									</div>
									<p class="txt_message" style="display: none;"></p>
								</dd>
							</dl>



						</div>
						<div class="box_info">
							<dl class="item_info">
								<dt>
									<label for="inpNmae" class="lab_info">이름</label>
								</dt>
								<dd>
									<div class="wrap_inp">
										<label for="name" class="txt_placeholder ">이름</label>
										<!-- 텍스트 입력 시 .screen_out  -->
										<input type="text" id="name" name="name" class="inp_info"
											value="" maxlength="30"> <span class="mark_valid"><span
											class="ico_join ico_valid"></span><span class="screen_out">유효</span></span>
									</div>
									<p class="txt_message" style="display: none;"></p>
								</dd>
							</dl>
							<dl id="countryListContainer" class="item_info info_phone">
								<dt>
									<label for="inpPhone" class="lab_info">휴대폰 번호</label>
								</dt>
								<dd>
									<div class="wrap_inp">
										<label for="inpPhone" class="txt_placeholder">휴대폰 번호</label>
										<!-- 텍스트 입력 시 .screen_out  -->
										<a href="javascript:;" class="num_nation" id="numNation">
											<span class="ico_join"></span> <span class="link_nationnum"></span>
										</a> <input type="hidden" id="mobileNational"
											name="mobileNational" value=""> <input type="hidden"
											id="mobileNationalCode" name="mobileNationalCode" value="">
										<input type="hidden" id="mobileInternationalFormat"
											name="mobileInternationalFormat" value=""> <input
											type="text" id="inpPhone" name="inpPhone" class="inp_info"
											autocomplete="off">
										<button type="button" id="certBtn" class="btn_check disabled">인증</button>
									</div>
									<div class="wrap_nationinfo">
										<div class="box_search">
											<span class="ico_join"></span> <label for="inpNationInfo"
												class="txt_placeholder">국가 검색(국가번호, 국가명)</label>
											<!-- 입력 시 .screen_out -->
											<input id="inpNationInfo" type="text" class="inp_nation">
										</div>
										<a href="javascript:;" class="link_nationinfo"></a>
										<ul class="list_nationinfo"></ul>
									</div>
								</dd>
							</dl>
							<dl class="item_info info_phone">
								<dt>
									<label for="inpCertCode" class="lab_info screen_out">휴대폰
										인증 번호</label>
								</dt>
								<dd>
									<div class="wrap_inp">
										<span class="txt_placeholder">인증번호 (10분 동안 유효)</span>
										<!-- 텍스트 입력 시 .screen_out  -->
										<input type="text" id="inpCertCode" name="inpCertCode"
											class="inp_info" maxlength="6" autocomplete="off" disabled>
										<button type="button" id="confirmBtn"
											class="btn_check disabled">확인</button>
										<span class="mark_valid" id="matchedCertCodeText"
											style="display: none;">일치</span>
										<!-- 입력 완료 시 .disabled 제거 -->
									</div>
									<p class="txt_message" style="display: none;"></p>
								</dd>
							</dl>
							<dl class="item_info info_email">
								<dt>
									<label for="inpEmail" class="lab_info">본인 확인용<br>이메일
										주소
									</label>
								</dt>
								<dd>
									<div class="wrap_inp">
										<span class="txt_placeholder ">본인확인용 이메일</span>
										<!-- 텍스트 입력 시 .screen_out  -->
										<input type="text" id="email" name="email" class="inp_info"
											value="" autocomplete="off"> <span class="mark_valid"><span
											class="ico_join ico_valid"></span><span class="screen_out">유효</span></span>
									</div>
									<p class="txt_message" style="display: none;"></p>
								</dd>
							</dl>

						</div>
					</div>
					<div class="wrap_btn">
						<button type="submit" class="btn_comm btn_type1">다음 단계</button>
					</div>
				</fieldset>
			</form>
		</div>

		<hr class="hide">
		<div id="kakaoFoot" class="footer_comm" role="contentinfo">
			<h2 class="screen_out">서비스 이용정보</h2>
			<a href="${pageContext.request.contextPath}/member" target="_blank"
				class="link_info">서비스 약관</a><span class="txt_bar">|</span> <a
				href="${pageContext.request.contextPath}/member/info_protection"
				target="_blank" class="link_info">개인정보처리방침</a><span class="txt_bar">|</span>
			<a href="${pageContext.request.contextPath}/member/8034.html"
				target="_blank" class="link_info">회원가입 도움말</a>
			<div class="txt_copyright">
				© <a href="${pageContext.request.contextPath}/home.do"
					class="link_daum" target="_blank">OGGIGEMAPZO Corp.</a>
			</div>
		</div>
	</div>

	<script type="text/javascript"
		src="https://s1.daumcdn.net/svc/original/U03/cssjs/jquery/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
		var _tiq = 'undefined' !== typeof _tiq ? _tiq : [];
		_tiq.push([ '__trackPageview' ]);
		(function(d) {
			var se = d.createElement('script');
			se.type = 'text/javascript';
			se.async = true;
			se.src = location.protocol + '//m2.daumcdn.net/tiara/js/td.min.js';
			var s = d.getElementsByTagName('head')[0];
			s.appendChild(se);
		})(document);
	</script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/validation.input.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/validation.methods.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/validation.messages.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/jquery-ui-1.10.4.custom.js">
		
	</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/registration.js"></script>
</body>
</html>