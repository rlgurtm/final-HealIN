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

<script>
	$(document).ready(function() {
		$("#btn-login").click(function() {
			$("#loginFrm").submit();
		});
	});
</script>
<meta charset="UTF-8">
</head>
<body>
  <div id="daumIndex"> <!-- 웹접근성용 바로가기 링크 모음 -->
    <a href="#daumBody">본문 바로가기</a>
    <a href="#daumGnb">메뉴 바로가기</a>
  </div>
  <div id="daumWrap" >
    <div id="daumHead">
      <h1>
        <a href="#" id="daumServiceLogo" class="link_findpw"><span class="ir_wa">비밀번호찾기</span></a>
      </h1>
    </div>
    <!-- // daumHead -->
    <hr class="hide">

    <div id="daumContent" role="main" >    
      <div id="cMain">
        <div id="mArticle">
          <h2 id="daumBody" class="screen_out">비밀번호찾기 안내 본문</h2>
          <div class="cont_g cont_type1">
            <div class="info_detail">
              <div class="info_result">
                <strong class="tit_result">회원 님의 아이디는 <em class="emph_g">${sessionScope.id}</em> 입니다.</strong>
                <span class="txt_result">찾은 ID로  HealthIn 서비스를 맘껏 이용해 주세요.</span>
                <br><br><br>
                <a href="${pageContext.request.contextPath}/login_form.do">
                <img src="${pageContext.request.contextPath}/resources/img/로고.png" /></a>
               
              </div>
            </div>
          </div>
        </div><!--// mArticle -->
      </div><!-- // cMain -->    
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
        bgType: "white",
        enableLogoutRetun: false,
        returnUrl: '',
        disableHotissue: false,
        disableLogo: false,
        disableTracker: false,
        enableShield: false
    }
  </script>
  		<script type="text/javascript"
			src="${pageContext.request.contextPath}/resources/js/ogigemapgo.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.min.js"></script>
</div>

</body>


