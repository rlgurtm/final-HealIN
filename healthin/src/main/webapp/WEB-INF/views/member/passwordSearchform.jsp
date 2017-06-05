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
<meta property="og:title" content="비밀번호찾기 홈 | Health 비밀번호 찾기">
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
        <a href="/find/password.do" id="daumServiceLogo" class="link_findpw"><span class="ir_wa">비밀번호찾기</span></a>
      </h1>
    </div>
    <!-- // daumHead -->
    <hr class="hide">
<div id="daumContent" role="main">
    <div id="cMain">
        <div id="mArticle">
            <div class="dimmed_layer" style="display:none"></div>
            <h2 id="daumBody" class="screen_out">비밀번호찾기 홈</h2>

            <p class="desc_g">
            <strong>비밀번호가 기억나지 않아 답답하셨나요?</strong><br>
            <strong><font color="#008000">아이디 입력 후 Enter Key를 눌러주세요.</font></strong><br>

            <div class="cont_g cont_type3">
                <div class="info_detail">
                    <form method="post" action="${pageContext.request.contextPath}/findByIdLostPassword.do">
                        <input type="hidden" id="searchIdType" name="searchIdType" value="daumId"/>
                        <fieldset>
                            <legend class="screen_out">비밀번호찾기 입력 폼</legend>
                                    <p class="basic_txt_message" id="id_message" >아이디 입력 후 Enter Key를 눌러주세요.</p>
                            <div class="box_detail">
                                <div class="bg_find bg_data">
                                    <div class="bg_find inner_bg"> 
                                        <label for="searchId" class="screen_out">아이디를 입력해 주세요.</label>
                                        <input type="text" id="searchId" name="searchId" class="tf_g" value="">
                                    </div>
                                    <p class="txt_message" id="id_message" ></p>
                                </div>
                                <p class="desc_add emph_notice" style="display:none;"></p>
                                <button type="submit" class="btn_find btn_next" id="nextBtn" disabled="disabled">다음단계</button>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
            <ul class="list_method">
                <li>
                    아이디를 모르시나요?<a href="${pageContext.request.contextPath}/idSearchform.do" class="link_tip">아이디 찾기</a><span class="ico_find ico_more"></span>
                </li>
                <li>
                    폰번호 아이디 또는 이메일 아이디로 찾고 싶으시다면!<a href="${pageContext.request.contextPath}/mobileAndEmailSearchform.do" class="link_tip">폰번호, 이메일 아이디 찾기</a><span class="ico_find ico_more"></span>
                </li>
            </ul>

            <!-- 없는 아이디 레이어 -->
            <div id="notExistLayer" class="userinfo_layer" style="top:300px;margin-left:-188px;display:none;">
                <div class="inner_myinfo_layer">
                    <div class="layer_head">
                        <strong class="screen_out">비밀번호 찾기 안내 레이어</strong>
                    </div>
                    <div class="layer_body">
                        <strong class="tit_layer">입력해주신 <em class="emph_info"></em> 는 없는 아이디 입니다.<br> 다시 한번 아이디를 정확히 입력해 주세요.</strong>

                        <div class="btn_process">
                            <button type="button" class="btn_find btn_ok"><span class="screen_out">확인</span></button>
                        </div>
                    </div>
                    <div class="layer_foot">
                        <button type="button" class="btn_find btn_close">닫기</button>
                    </div>
                </div>
            </div>

            <!-- shutdown member 레이어 -->
            <div id="blockMemberLayer" class="userinfo_layer" style="top:300px;margin-left:-188px;display:none;">
                <div class="inner_myinfo_layer">
                    <div class="layer_head">
                        <strong class="screen_out">비밀번호 찾기 안내 레이어</strong>
                    </div>
                    <div class="layer_body">
                        <strong class="tit_layer">보호조치 중인 아이디입니다.<br/>로그인하시려면 고객센터로 문의해주시기 바랍니다.</strong>

                        <div class="btn_process">
                            <button type="button" class="btn_find btn_ok"><span class="screen_out">확인</span></button>
                        </div>
                    </div>
                    <div class="layer_foot">
                        <button type="button" class="btn_find btn_close">닫기</button>
                    </div>
                </div>
            </div>

            <div id="dormancyMember" class="userinfo_layer" style="top:300px;margin-left:-188px;display:none;">
                <div class="inner_myinfo_layer">
                    <div class="layer_head">
                        <strong class="screen_out">비밀번호 찾기 안내 레이어</strong>
                    </div>
                    <div class="layer_foot">
                        <button type="button" class="btn_find btn_close">닫기</button>
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
  <div id="daumFoot" class="footer_comm" role="contentinfo">
  <h2 class="screen_out">서비스 이용정보</h2>
  <a href="http://policy.daum.net/info/info" class="link_info" target="_blank">서비스 약관/정책</a> |
  <a href="http://policy.daum.net/info_protection/info_protection" class="link_info" target="_blank">개인정보처리방침</a> |
  <a href="https://cs.daum.net/redbell/top.html" class="link_info" target="_blank">권리침해신고</a> | 
  <a href="http://cs.daum.net/faq/59.html" target="_blank" class="link_info">고객센터</a> 
  <address class="txt_copyright">Copyright &#169; <a href="http://www.kakaocorp.com" class="link_daum" style="font-weight: bold">OgigeMapGo Corp.</a> All rights reserved.</address>
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
  <script src="https://go.daum.net/jsa_minidaum_pc.daum" charset="utf-8" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.min.js"></script>
    <!--   script type="text/javascript" src="https://s1.daumcdn.net/svc/original/U03/cssjs/jquery/jquery-1.10.2.min.js"></script>
    -->
</div>


<script type="text/javascript" src="/content/js/jquery.form.member.init.js?v=170601010314"></script>
<script type="text/javascript" src="/content/js/jquery.form.validate.js?v=170601010314"></script>

<script type="text/javascript">
    $(document).ready(function () {
    	$("#nextBtn").hide();
    	$("#id_message").html(
		"아이디를 입력하고 enter key 눌러주세요.").show();
    	
		$("#searchId").keydown(function() {
			console.log('아이디>>>>>'+ $("#searchId").val());
			$.ajax({
				type : "get",
				url : "${pageContext.request.contextPath}/findById.do",
				data : "id=" + $("#searchId").val(),
				success : function(data) {
					if(data == ($("#searchId").val())){
						console.log('OOOO');
						$("#id_message").html(
								"아이디를 맞게 입력하셨습니다").show();
						$("#nextBtn").removeAttr("disabled");
						$("#nextBtn").attr("disabled",false);
						$("#nextBtn").show();
						
					}else{
						console.log('XXXX');

						$("#id_message").html(
						"없는 id입니다.").show();
						$("#nextBtn").attr("disabled",true);
						$("#nextBtn").hide();
					}
				},error: function () {
					 console.log("Request Fail!!");
				}
			});//ajax

		});

        var validator = $("form").validate(
                {
                    rules: {
                        searchId: {
                            required: true,
                            existdaumidinvalid: true
                        }
                    },
                    messages: {
                        searchId: {
                            required: "Daum 아이디를 입력해 주세요.",
                            existdaumidinvalid: "Daum 아이디를 정확히 입력해 주세요."
                        }
                    }
                }
        );

        var form = $("form").getForm();
        form.initWebRow('.box_detail');
                        
        $(".btn_close, .btn_ok").click(function () {
            form.hideAllLayer();
        });

        var submitted = false;
        $("form").submit(function () {
            if (!submitted) {
                submitted = true;
                var errorList = validator.getFormErrorList();
                if (errorList.length !== 0) {
                    for (var i = 0; errorList[i]; i++) {
                        var error = errorList[i];
                        form.showError(error.element.id, error.message);
                    }
                    errorList[0].element.focus();
                    submitted = false;
                    return false;
                }
                return true;
            }
            return false;
        });

    });

    function gotoKakaoFindPw() {
        var findpw = "https://accounts.kakao.com/weblogin/find_password?continue=%s";
        window.open(findpw.replace('%s', 'http://www.daum.net'), "_blank");
    }
</script>
</body>


