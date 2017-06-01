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
<title>가입 정보 입력 | HEALTHIN 회원가입 완료</title>
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
<div id="kakaoIndex"> <!-- 웹접근성용 바로가기 링크 모음 -->
    <a href="#kakaoBody">본문 바로가기</a>
</div>

<div id="kakaoWrap" class="join_personal">
    <div id="kakaoHead">
        <div class="inner_head">
            <h1>
                <a href="${pageContext.request.contextPath}/home.do" id="daumServiceLogo" class="ico_join"><span class="ir_wa">HEALTHIN</span></a>
            </h1>
        </div>
    </div>
    <hr class="hide">
<h2 class="screen_out">회원가입 안내 본문</h2>
<div id="kakaoBody" class="cont_personal">
    <div class="paging_step">
        <span class="ico_join ico_paging"></span>
        <span class="ico_join ico_paging"></span>
        <span class="ico_join ico_paging on"></span>
    </div>
    <div class="wrap_tit">
        <h3 class="tit_join">HEALTHIN 회원이 되신 것을 환영합니다.</h3>
    </div>
    <div class="wrap_complete">
        <dl class="info_user">
            <dt>헬쓰인ID</dt>
            <dd>${sessionScope.mvo.id}</dd>
        </dl>
        <dl class="info_user">
            <dt>이름/닉네임</dt>
            <dd>${sessionScope.mvo.name}/${sessionScope.mvo.nickname}</dd>
        </dl>
    </div>
    <div class="wrap_btn">
        <button id="rtnService" type="button" class="btn_comm btn_type1">서비스로 돌아가기</button>
    </div>

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

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js /jquery-1.12.4.min.js"></script>
<script type="text/javascript">
    var _tiq = 'undefined' !== typeof _tiq ? _tiq : [];
    _tiq.push(['__trackPageview']);
    (function(d) {
        var se = d.createElement('script'); se.type = 'text/javascript'; se.async = true;
        se.src = location.protocol + '${pageContext.request.contextPath}/resources/js/td.min.js';
        var s = d.getElementsByTagName('head')[0]; s.appendChild(se);
    })(document);

    $(document).ready(function () {
        $("#rtnService").click(function () {
            location.href = decodeURIComponent('${pageContext.request.contextPath}/home.do');
        });
    });
</script>

</body>
</html>