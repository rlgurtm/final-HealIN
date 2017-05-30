<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>회원가입</title>
<meta property="og:title" content="HealthIn 회원가입">
<title>개인 가입 약관 동의 | HealthIn 회원가입</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta http-equiv="Pragma" content="no-cache" />
<meta name="description" content="HEALTHIN 회원정보수정">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>회원정보 수정</title>
<script type="text/javascript">
$(document).ready(function () {
	$("modifyBtn").click(function () {
		$("#modifyFrm").submit(); 
	});//회원정보 수정
});//ready
</script>

<!-- Bootstrap -->
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<!-- font awesome -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" media="screen"
	title="no title" charset="utf-8">
<!-- Custom style -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" media="screen"
	title="no title" charset="utf-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/join_reform.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/join_reform_font.css">
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
			<form  id="modifyFrm" action="${pageContext.request.contextPath}/modify.do"
			 enctype="multipart/form-data" id="joinInput" name="joinInput">

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
										<label for="daumId" class="txt_placeholder ">${sessionScope.mvo.id }</label>
										<!-- 텍스트 입력 시 .screen_out  -->
										<input type="text"  value="${sessionScope.mvo.id }"   name="id" placeholder="${sessionScope.mvo.id }" readonly="readonly" class="inp_info" 
											autocomplete="off" maxlength="15"> <span
											class="txt_fix txt_domain"></span> <span class="mark_valid"
											style="display: none;"><span
											class="ico_join ico_valid"></span></span>
									</div>
								</dd>
							</dl>
							<dl class="item_info">
								<dt>
									<label for="inpNick" class="lab_info_nickname">HealthIn
										닉네임</label>
								</dt>
								<dd>
									<div class="wrap_inp">
										<!-- 텍스트 입력 시 .screen_out  -->
										<input type="text" id="nickname" name="nickname"
											class="inp_info pw" value="${sessionScope.mvo.nickname }" maxlength="32"> <span
											class="mark_valid" style="display: none;">불가</span>
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
										<!-- 텍스트 입력 시 .screen_out  -->
										<input type="text" id="password1" name="password"
											class="inp_info pw" value="${sessionScope.mvo.password }" maxlength="32"> <span
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
										<!-- 텍스트 입력 시 .screen_out  -->
										<input type="text" id="password2" name="password2"
											class="inp_info pw" value="${sessionScope.mvo.password }" maxlength="32"> <span
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
										<!-- 텍스트 입력 시 .screen_out  -->
										<input type="text" id="name" name="name" class="inp_info"
											value="${sessionScope.mvo.name }" maxlength="30"> <span class="mark_valid"><span
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
										<!-- 텍스트 입력 시 .screen_out  -->
										<input type="text" id="birthdate" name="birthdate"
											class="inp_info" value="${sessionScope.mvo.birthdate }" maxlength="30"> <span
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
									<label for="inpEmail" class="lab_info">핸드폰 번호 </label>
								</dt>
								<dd>
									<div class="wrap_inp">
										<!-- 텍스트 입력 시 .screen_out  -->
										<input type="text" id="tel" name="tel" class="inp_info"
											value="${sessionScope.mvo.tel }"" autocomplete="off"> <span class="mark_valid"><span
											class="ico_join ico_valid"></span><span class="screen_out">유효</span></span>
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
										<!-- 텍스트 입력 시 .screen_out  -->
										<input type="text" id="email" name="email" class="inp_info"
											value="${sessionScope.mvo.email }" autocomplete="off"> <span class="mark_valid"><span
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
										<!-- 텍스트 입력 시 .screen_out  -->
										<input type="text" id="address" name="address"
											class="inp_info" value="${sessionScope.mvo.address }" maxlength="30"> <span
											class="mark_valid"><span class="ico_join ico_valid"></span><span
											class="screen_out">유효</span></span>
									</div>
									<p class="txt_message" style="display: none;"></p>
								</dd>
							</dl>
							<!--  
							istrainer : trainer/ user
					 	-->
							<input type="hidden" value="trainer" name="istrainer"> 
							<input 	type="hidden" value="N" name="withdrawal">
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
							<label for="name" class="txt_placeholder ">상세경력</label>
							<!-- 텍스트 입력 시 .screen_out  -->
							<input type="text" id="career" name="career" class="inp_info"
								value="" maxlength="30"> <span class="mark_valid"><span
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
						<div class="wrap_inp">
							<label for="name" class="txt_placeholder ">서초구/강남구/,,,</label>
							<!-- 텍스트 입력 시 .screen_out  -->
							<input type="text" id="location" name="location" class="inp_info"
								value="" maxlength="30"> <span class="mark_valid"><span
								class="ico_join ico_valid"></span><span class="screen_out">유효</span></span>
						</div>
						<p class="txt_message" style="display: none;"></p>
					</dd>
				</dl>
				<dl class="item_info">
					<dt>
						<label for="inpNmae" class="lab_info">사진 upload</label>
					</dt>
					<dd>
							<!-- 텍스트 입력 시 .screen_out  -->
							<input type="file" name="uploadfile" required="required">
                           <span class="mark_valid"><span class="ico_join ico_valid"></span><span
								class="screen_out">유효</span></span>
						<p class="txt_message" style="display: none;"></p>
					</dd>
				</dl>
			</div>
		</c:if>



		<div class="wrap_btn">
			<button type="submit" class="btn_comm btn_type1">회원정보수정</button>
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
		
		
</body>
</html>

