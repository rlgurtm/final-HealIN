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
<!-- Bootstrap Core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom CSS -->
<link href="css/modern-business.css" rel="stylesheet">
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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#id").keydown(function() {
			$.ajax({
				type : "get",
				url : "${pageContext.request.contextPath}/findById.do",
				data : "id=" + $("#id").val(),
				success : function(data) {
					if(data == ($("#id").val())){
						console.log('XXXX');
						$(".id_message").html(
								"중복id입니다.다른 아이디를 입력해주세요.").show();
					}else{
						console.log('OOOO');
						$(".id_message").html(
						"사용가능한 id입니다.").show();
					}
				},error: function () {
					 console.log("Request Fail!!");
				}
			});//ajax
			

		});

	})
</script>
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
						id="ServiceLogo" class="ico_join"> <span class="ir_wa"></span></a>
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
			<form
				action="${pageContext.request.contextPath}/register_step3.do?type=${param.type}"
				method="post" enctype="multipart/form-data" id="joinInput"
				name="joinInput">
				<fieldset class="fld_comm">
					<legend class="screen_out">가입 정보</legend>
					<div class="wrap_info">
						<div class="box_info">
							<dl class="item_info">
								<dt>
									<label for="inpID" class="lab_info">아이디</label>
								</dt>
								<dd>
									<div class="wrap_inp">
										<label for="name" class="txt_placeholder "></label>
										<!-- 텍스트 입력 시 .screen_out  -->
										<input type="text" id="id" name="id" class="inp_info" value=""
											maxlength="30" placeholder="아이디" required="required">
										<span class="mark_valid"><span
											class="ico_join ico_valid"></span><span class="screen_out">유효</span></span>
									</div>
									<p class="id_message" ></p>
								</dd>
							</dl>
							<dl class="item_info">
								<dt>
									<label for="inpID" class="lab_info"> 닉네임</label>
								</dt>
								<dd>
									<div class="wrap_inp">
										<label for="id" class="txt_placeholder "></label>
										<!-- 텍스트 입력 시 .screen_out  -->
										<input type="text" id="nickname" name="nickname"
											class="inp_info" value="" autocomplete="off" maxlength="15"
											placeholder="닉네임" required="required"> <span
											class="txt_fix txt_domain"></span> <span class="mark_valid"
											style="display: none;"><span
											class="ico_join ico_valid"></span><span class="screen_out">유효</span></span>
									</div>
									<p class="txt_message" id="nickname_msg" style="display: none;">이미
										사용된 닉네임 입니다. 다른 아이디를 입력하세요.</p>
								</dd>
							</dl>
							<dl class="item_info info_password">
								<dt>
									<label for="inpPw" class="lab_info">비밀번호</label>
								</dt>
								<dd>
									<div class="wrap_inp">
										<label for="password1" class="txt_placeholder "></label>
										<!-- 텍스트 입력 시 .screen_out  -->
										<input type="password" id="password1" name="password1"
											class="inp_info pw" value="" maxlength="32"
											placeholder="비밀번호 
											(8자 이상)" required="required">
										<span class="mark_valid" style="display: none;">불가</span>
									</div>
								</dd>
							</dl>
							<dl class="item_info info_password">
								<dt>
									<label for="inpPw2" class="lab_info">비밀번호 재확인</label>
								</dt>
								<dd>
									<div class="wrap_inp">
										<label for="password2" class="txt_placeholder "></label>
										<!-- 텍스트 입력 시 .screen_out  -->
										<input type="password" id="password2" name="password2"
											class="inp_info pw" value="" maxlength="32"
											placeholder="비밀번호
											재확인" required="required">
										<span class="mark_valid" style="display: none;">불일치</span>
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
										<label for="name" class="txt_placeholder "></label>
										<!-- 텍스트 입력 시 .screen_out  -->
										<input type="text" id="name" name="name" class="inp_info"
											value="" maxlength="30" placeholder="이름" required="required">
										<span class="mark_valid"><span
											class="ico_join ico_valid"></span><span class="screen_out">유효</span></span>
									</div>
									<p class="txt_message" style="display: none;"></p>
								</dd>
							</dl>

							<dl class="item_info">
								<dt>
									<label for="inpNmae" class="lab_info">생년월일</label>
								</dt>
								<dd>
									<div class="wrap_inp">
										<label for="name" class="txt_placeholder "></label>
										<!-- 텍스트 입력 시 .screen_out  -->
										<input type="text" id="birthdate" name="birthdate"
											class="inp_info" value="" maxlength="8"
											placeholder="20051230" required="required"> <span
											class="mark_valid"><span class="ico_join ico_valid"></span><span
											class="screen_out">유효</span></span>
									</div>
									<p class="txt_message" style="display: none;"></p>
								</dd>
							</dl>

							<dl class="item_info">
								<dt>
									<label for="Inputgender" class="lab_info">성별</label>
								</dt>
								<dd>
									<!-- 텍스트 입력 시 .screen_out  -->
									<input type="radio" name="gender" value="female"
										checked="checked">여자 &nbsp;&nbsp; <input type="radio"
										name="gender" value="male">남자
									<p class="txt_message" style="display: none;"></p>
								</dd>
							</dl>

							<dl class="item_info info_email">
								<dt>
									<label for="inpTel" class="lab_info">핸드폰 번호 </label>
								</dt>
								<dd>
									<div class="wrap_inp">
										<span class="txt_placeholder "></span>
										<!-- 텍스트 입력 시 .screen_out  -->
										<input type="text" id="mobile" name="mobile" class="inp_info"
											value="" autocomplete="off" maxlength="11"
											placeholder="0101234568" required="required"> <span
											class="mark_valid"> <span class="ico_join ico_valid"></span><span
											class="screen_out">유효</span></span>
									</div>
									<p class="txt_message" style="display: none;"></p>
								</dd>
							</dl>
							<dl class="item_info info_email">
								<dt>
									<label for="inpEmail" class="lab_info">이메일 주소 </label>
								</dt>
								<dd>
									<div class="wrap_inp">
										<span class="txt_placeholder "></span>
										<!-- 텍스트 입력 시 .screen_out  -->
										<input type="text" id="email" name="email" class="inp_info"
											value="" autocomplete="off" placeholder="이메일"
											required="required"> <span class="mark_valid"><span
											class="ico_join ico_valid"></span><span class="screen_out">유효</span></span>
									</div>
									<p class="txt_message" style="display: none;"></p>
								</dd>
							</dl>


							<dl class="item_info">
								<dt>
									<label for="inpNmae" class="lab_info">집주소</label>
								</dt>
								<dd>
									<div class="wrap_inp">
										<label for="name" class="txt_placeholder "></label>
										<!-- 텍스트 입력 시 .screen_out  -->
										<input type="text" id="address" name="address"
											class="inp_info" value="" maxlength="50" placeholder="집주소"
											required="required"> <span class="mark_valid"><span
											class="ico_join ico_valid"></span><span class="screen_out">유효</span></span>
									</div>
									<p class="txt_message" style="display: none;"></p>
								</dd>
							</dl>
							<!--  
							istrainer : trainer/ user
					 	-->

							<c:choose>
								<c:when test="${param.type == 'y'}">
									<input type="hidden" value="trainer" name="istrainer"
										id="istrainer">
								</c:when>
								<c:otherwise>
									<input type="hidden" value="user" name="istrainer"
										id="istrainer">
								</c:otherwise>
							</c:choose>
							<input type="hidden" value="N" name="withdrawal">
						</div>
					</div>


					<c:if test="${param.type == 'y'}">
							[ Trainer 추가 입력 ]
									<div class="box_info">
							<dl class="item_info">
								<dt>
									<label for="inpNmae" class="lab_info">상세경력</label>
								</dt>
								<dd>
									<div class="wrap_inp">
										<label for="name" class="txt_placeholder "></label>
										<!-- 텍스트 입력 시 .screen_out  -->
										<input type="text" id="career" name="career" class="inp_info"
											value="" maxlength="30" placeholder="상세경력"
											required="required"> <span class="mark_valid"><span
											class="ico_join ico_valid"></span><span class="screen_out">유효</span></span>
									</div>
									<p class="txt_message" style="display: none;"></p>
								</dd>
							</dl>
							<input type="hidden" value="0" name="rank">
							<dl class="item_info">
								<dt>
									<label for="inpNmae" class="lab_info">근무지 위치</label>
								</dt>
								<dd>
									<select id="location" name="location" required="required">
										<option value="강남구">강남구</option>
										<option value="노원구">노원구</option>
										<option value="서초구">서초구</option>
										<option value="용산구">용산구</option>
										<option value="은평구">은평구</option>
										<option value="성남시">성남시</option>
										<option value="안양시">안양시</option>
										<option value="양평군">양평군</option>
										<option value="용인시">용인시</option>
										<option value="의정부시">의정부시</option>
									</select>


									<p class="txt_message" style="display: none;"></p>
								</dd>
							</dl>
							<dl class="item_info">
								<dt>
									<label for="inpNmae" class="lab_info">사진 upload</label>
								</dt>
								<dd>
									<!-- 텍스트 입력 시 .screen_out  -->
									<input type="file" name="uploadfile" id="uploadfile"
										required="required"> <span class="mark_valid"><span
										class="ico_join ico_valid"></span><span class="screen_out">유효</span></span>
									<p class="txt_message" style="display: none;"></p>
								</dd>
							</dl>
						</div>
					</c:if>



					<div class="wrap_btn">
						<button type="submit" class="btn_comm btn_type2" id="nextstepBtn">다음
							단계</button>
						&nbsp;&nbsp;&nbsp;
						<button type="reset" class="btn_comm btn_type2">초기화</button>
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
		src="${pageContext.request.contextPath}/resources/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
		var _tiq = 'undefined' !== typeof _tiq ? _tiq : [];
		_tiq.push([ '__trackPageview' ]);
		(function(d) {
			var se = d.createElement('script');
			se.type = 'text/javascript';
			se.async = true;
			se.src = '${pageContext.request.contextPath}/resources/js/td.min.js';
			var s = d.getElementsByTagName('head')[0];
			s.appendChild(se);
		})(document);
	</script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/validation.input.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/validation.methods.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/validation.messages.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/jquery-ui-1.10.4.custom.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/validation.value.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/registration.js"></script>
</body>
</html>