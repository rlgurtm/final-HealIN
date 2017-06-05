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
            <h2 id="daumBody" class="screen_out"> 개인비밀번호 찾기 본문</h2>
            <p class="desc_g"><em class="emph_g">kawai0614</em> 님, 인증 가능한 연락처를 선택한 후, 연락처 전체를 입력해 주세요.<br>개인정보보호를 위해 연락처는 일부분만 보여드리며, * 가 무작위로 표기됩니다.</p>
            <div class="cont_g">
                <div class="info_detail">
                    <form method="post" action="/find/password.do?action=contact-check" id="checkForm">
                        <input type="hidden" id="contact" name="contact"/>
                        <input type="hidden" id="name" name="name"/>
                        <input type="hidden" id="mobileNational" name="mobileNational"/>
                        <input type="hidden" id="mobileNationalCode" name="mobileNationalCode"/>
                        <fieldset>
                            <legend class="screen_out">비밀번호찾기 방법  개인아이디 폼</legend>
                                                        <ul class="list_certify">
                                                                                                                                            <li>
                      <span class="choice_comm">
                        <input type="radio" id="inpSearch1" name="contactType" class="inp_comm" value="smsNum">
                        <label for="inpSearch1" class="lab_comm">
                          <span class="ico_find"></span>내 정보에 등록된 휴대폰 인증 <span class="txt_date">(+82 10-5***-***2)</span>
                        </label>
                      </span>
                                        <div class="desc_involve">
                                            <div class="box_detail">
                                                <div class="bg_find bg_data">
                                                    <div class="bg_find inner_bg">
                                                        <label for="smsNumName" class="screen_out"> 이름 또는 닉네임을 입력해 주세요.</label>
                                                        <input type="text" id="smsNumName" name="smsNumName" class="tf_g" value="">
                                                    </div>
                                                </div>
                                                <p class="desc_add emph_notice" style="display:none"></p>
                                            </div>
                                            <div class="box_detail">
                                                                                                    <div class="bg_find bg_nation input_none">
                                                        <div class="bg_find inner_bg">
                                                            <strong class="screen_out">국가번호 선택 상자</strong>
                                                            <span class="screen_out">선택내용 : </span>
                                                            <a href="javascript:;" class="link_nationnum">+82</a>
                                                            <input type="hidden" value="+000">
                                                        </div>
                                                    </div>
                                                                                                <div class="bg_find bg_data">
                                                    <div class="bg_find inner_bg">
                                                                                                                <label for="smsNum" class="screen_out">휴대폰 번호 전체를 입력해주세요.</label>
                                                        <input type="text" id="smsNum" name="smsNum" class="tf_g " value="">
                                                        <input type="hidden" id="smsNumMobileNational" name="smsNumMobileNational" value="82">
                                                        <input type="hidden" id="smsNumMobileNationalCode" name="smsNumMobileNationalCode" value="KR">
                                                    </div>
                                                </div>
                                                <p class="desc_add emph_notice" style="display:none"></p>
                                                <button type="submit" class="btn_find btn_next">다음단계</button>
                                            </div>
                                        </div>
                                    </li>
                                                                                                                                            <li>
                      <span class="choice_comm">
                        <input type="radio" id="inpSearch2" name="contactType" class="inp_comm" value="otherMail">
                        <label for="inpSearch2" class="lab_comm">
                          <span class="ico_find"></span>내 정보에 등록된 이메일 인증 <span class="txt_date">(dk******@na******.com)</span>
                        </label>
                      </span>
                                        <div class="desc_involve">
                                            <div class="box_detail">
                                                <div class="bg_find bg_data">
                                                    <div class="bg_find inner_bg">
                                                        <label for="otherMailName" class="screen_out"> 이름 또는 닉네임을 입력해 주세요.</label>
                                                        <input type="text" id="otherMailName" name="otherMailName" class="tf_g" value="">
                                                    </div>
                                                </div>
                                                <p class="desc_add emph_notice" style="display:none"></p>
                                            </div>
                                            <div class="box_detail">
                                                                                                <div class="bg_find bg_data">
                                                    <div class="bg_find inner_bg">
                                                                                                                <label for="otherMail" class="screen_out">이메일 주소 전체를 입력해주세요.</label>
                                                        <input type="text" id="otherMail" name="otherMail" class="tf_g " value="">
                                                        <input type="hidden" id="otherMailMobileNational" name="otherMailMobileNational" value="">
                                                        <input type="hidden" id="otherMailMobileNationalCode" name="otherMailMobileNationalCode" value="">
                                                    </div>
                                                </div>
                                                <p class="desc_add emph_notice" style="display:none"></p>
                                                <button type="submit" class="btn_find btn_next">다음단계</button>
                                            </div>
                                        </div>
                                    </li>
                                                                                            </ul>
                        </fieldset>
                    </form>
                </div>
            </div>
                                    <a href="/find/password.do?action=daumid-check" class="btn_find btn_prev">이전으로</a>

            <!-- 인증번호 받기 레이어 -->
            <div id="authSendLayer" class="userinfo_layer" style="top:300px;margin-left:-188px;display:none;">
                <div class="inner_myinfo_layer">
                    <div class="layer_head">
                        <strong class="screen_out">비밀번호 찾기 안내 레이어</strong>
                    </div>
                    <div class="layer_body">
                        <form method="post" action="/find/password.do?action=auth-send">
                            <strong class="tit_layer"><em class="emph_info"> </em>으로<br>인증번호를 받으시겠습니까?</strong>
                            <div class="btn_process">
                                <button type="submit" class="btn_find btn_send"><span class="screen_out">인증번호 발송하기</span></button>
                            </div>
                        </form>
                    </div>
                    <div class="layer_foot">
                        <button type="button" class="btn_find btn_close">닫기</button>
                    </div>
                </div>
            </div>

            <!-- 등록내용 불일치 레이어 -->
            <div id="contactNotMatchLayer" class="userinfo_layer" style="top:300px;margin-left:-188px;display:none;">
                <div class="inner_myinfo_layer">
                    <div class="layer_head">
                        <strong class="screen_out">비밀번호 찾기 안내 레이어</strong>
                    </div>
                    <div class="layer_body">
                        <strong class="tit_layer">입력하신 <em class="emph_info">/</em> 가<br>내 정보에 등록된 연락처와 일치하지 않아<br> 인증번호를 발송할 수 없습니다.</strong>
                        <div class="btn_process">
                            <button type="button" class="btn_find btn_ok"><span class="screen_out">확인</span></button>
                        </div>
                    </div>
                    <div class="layer_foot">
                        <button type="button" class="btn_find btn_close">닫기</button>
                    </div>
                </div>
            </div>

            <!-- 발송실패 레이어 -->
            <div id="sendFailLayer" class="userinfo_layer" style="top:300px;margin-left:-188px;display:none;">
                <div class="inner_myinfo_layer">
                    <div class="layer_head">
                        <strong class="screen_out">발송실패 안내 레이어</strong>
                    </div>
                    <div class="layer_body">
                        <strong class="tit_layer tit_mismatch">인증번호 발송 중 오류가 발생했습니다. 잠시 후 다시 이용해 주세요.</strong>
                        <div class="btn_process">
                            <button type="button" class="btn_find btn_ok"><span class="screen_out">확인</span></button>
                        </div>
                    </div>
                    <div class="layer_foot">
                        <button type="button" class="btn_find btn_close">닫기</button>
                    </div>
                </div>
            </div>
            <div id="collectionLayer" class="userinfo_layer" style="display: none;top:100px;margin-left:-300px"><!-- 임시스타일 -->
                <div class="inner_myinfo_layer inner_myinfo_type1">
                    <div class="layer_head">
                        <strong class="tit_personal">개인정보 수집 및 이용에 대한 동의</strong>
                        <span class="txt_personal">Daum은 아래의 목적으로 개인정보를 수집 및 이용하며, 회원의 개인정보를 안전하게 처리하는데 최선을 다합니다.</span>
                    </div>
                    <div class="layer_body">
                        <div class="info_agreement">
                            <strong class="tit_agreement">[선택] 서비스 이용 및 이용자 식별</strong>
                            <table class="tbl_agreement">
                                <caption class="screen_out">회원식별을 위한 설명 표</caption>
                                <colgroup>
                                    <col style="width:19%">
                                    <col style="">
                                    <col style="width:28%">
                                </colgroup>
                                <thead>
                                <tr>
                                    <th scope="col">목적</th>
                                    <th scope="col">항목</th>
                                    <th scope="col">보유기간</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td scope="row" class="td_top"><strong>서비스 이용 및 이용자 식별</strong></td>
                                    <td class="td_top">휴대폰 번호</td>
                                    <td scope="row" class="lst td_top">연락처 삭제 또는<br>회원 탈퇴 시 지체없이 파기</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <span class="txt_agreement">동의를 거부하시는 경우에도 서비스 이용이 가능합니다.</span>

                        <div class="btn_process">
                            <button type="button" class="btn_ok">확인</button>
                        </div>
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
  <a href="http://policy.daum.net/info/info" class="link_info" target="_blank">서비스 약관/정책</a> |
  <a href="http://policy.daum.net/info_protection/info_protection" class="link_info" target="_blank">개인정보처리방침</a> |
  <a href="https://cs.daum.net/redbell/top.html" class="link_info" target="_blank">권리침해신고</a> | 
  <a href="http://cs.daum.net/faq/59.html" target="_blank" class="link_info">고객센터</a> 
  <address class="txt_copyright">Copyright &#169; <a href="http://www.kakaocorp.com" class="link_daum" style="font-weight: bold">Kakao Corp.</a> All rights reserved.</address>
</div>
  <!-- // daumFoot -->
  <div id="wrapMinidaum"></div>
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
  <script type="text/javascript" src="https://s1.daumcdn.net/svc/original/U03/cssjs/jquery/jquery-1.10.2.min.js"></script>
</div>


<script type="text/javascript" src="/content/js/jquery.form.member.init.js?v=170601010314"></script>
<script type="text/javascript" src="/content/js/jquery.form.validate.js?v=170601010314"></script>
<script type="text/javascript" src="/content/js/namecheck-support.js?v=170601010314"></script>
<script type="text/javascript" src="/content/js/messages.js?v=170601010314"></script>
<script type="text/javascript">
    $(document).ready(function () {
    var require_name_or_regnum =  messages.require_name;
        var validator = $("form").validate(
                {
                    rules: {
                        phoneId: {
                            required: true,
                            mobile: true
                        },
                        phoneIdName: {
                            required: true
                        },
                        emailId: {
                            required: true,
                            findemail: true
                        },
                        emailIdName: {
                            required: true
                        },
                        tsvPhone: {
                            required: true,
                            mobile: true
                        },
                        tsvPhoneName: {
                            required: true
                        },
                        smsNum: {
                            required: true,
                            mobile: true
                        },
                        smsNumName: {
                            required: true
                        },
                        otherMail: {
                            required: true,
                            findemail: true
                        },
                        otherMailName: {
                            required: true
                        }
                    },
                    messages: {
                        phoneId: {
                            required: "폰번호 아이디를 입력해 주세요.",
                            mobile: "폰번호 아이디를 정확히 입력해 주세요."
                        },
                        phoneIdName: {
                            required: require_name_or_regnum
                        },
                        emailId: {
                            required: "이메일 아이디를 입력해 주세요.",
                            findemail: "이메일 아이디를 정확히 입력해 주세요."
                        },
                        emailIdName: {
                            required: require_name_or_regnum
                        },
                        tsvPhone: {
                            required: "휴대폰 번호를 입력해 주세요.",
                            mobile: "잘못된 휴대폰 번호 입니다. 휴대폰 번호를 확인한 후 다시 입력해 주세요."
                        },
                        tsvPhoneName: {
                            required: require_name_or_regnum
                        },
                        smsNum: {
                            required: "휴대폰 번호를 입력해 주세요.",
                            mobile: "잘못된 휴대폰 번호 입니다. 휴대폰 번호를 확인한 후 다시 입력해 주세요."
                        },
                        smsNumName: {
                            required: require_name_or_regnum
                        },
                        otherMail: {
                            required: "이메일 주소를 입력해 주세요.",
                            findemail: "잘못된 이메일 주소 입니다. 이메일 주소를 확인한 다음 다시 입력해 주세요."
                        },
                        otherMailName: {
                            required: require_name_or_regnum
                        }
                    }
                }
        );

        var form = $("#checkForm").getForm();
        form.initWebRow('.box_detail');
        form.initWebRadioRow('.list_certify');
        form.bindCheckBoxEvent();
        form.initTabFocusWeb('.choice_comm');

        
        
                        
        var submitted = false;
        $("#checkForm").submit(function () {
            if (!submitted) {
                submitted = true;
                var contactType = $("input[name=contactType]:checked").val();

                var errorList = validator.getElementErrorList("input[name^='" + contactType + "']");
                if (errorList.length !== 0) {
                    for (var i = 0; errorList[i]; i++) {
                        var error = errorList[i];
                        form.showError(error.element.id, error.message);
                    }
                    errorList[0].element.focus();
                    submitted = false;
                    return false;
                }

                var contact = $("#" + contactType).val();
                var name = $("#" + contactType + "Name").val();
                var mobileNational = $("#" + contactType + "MobileNational").val();
                var mobileNationalCode = $("#" + contactType + "MobileNationalCode").val();

                $("#contact").val(contact);
                $("#name").val(name);
                $("#mobileNational").val(mobileNational);
                $("#mobileNationalCode").val(mobileNationalCode);

                return true;
            }
            return false;
        });

        $("#showCollectionLayer").on("click", function () {
            form.showLayer("collectionLayer");
        });
        var nameChecker = new SirenRealNameCheck("findpw");
        $('#SmsCertButton').click(function (event) {
            nameChecker.openSMS();
        });

        $(".btn_close, .btn_ok, .btn_numnot").click(function () {
            form.hideAllLayer();
        });

    });

    function goNextStep(authType, code) {
        $("#checkForm").submit();
    }
</script>
</body>


