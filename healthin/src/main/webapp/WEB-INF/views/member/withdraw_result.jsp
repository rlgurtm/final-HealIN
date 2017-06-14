<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <title>회원탈퇴 | 비밀번호 인증</title>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/my.css" />

<body>
<div id="daumWrap" class="">

<div id="daumHead" role="banner">
	<div class="inner_head">
		<h1>
			<a href="${pageContext.request.contextPath}/member/modify_form.do?id=${sessionScope.mvo.id}" id="daumServiceLogo"><span class="ir_wa">내정보</span></a>
		</h1>		
		
		<!-- PC 웹 내정보 GNB -->
		<div id="daumGnb" role="navigation">
			<h2 class="screen_out">내정보 메인메뉴</h2>
			<ul class="gnb_comm">
				<li ><a href="/home.daum" class="link_gnb link_gnb1"><span class="ir_wa">내정보 홈</span></a></li>
				<li ><a href="/my/basic.daum" class="link_gnb link_gnb2"><span class="ir_wa">내정보 관리</span></a></li>
				<li ><a href="/security/basic.daum" class="link_gnb link_gnb3"><span class="ir_wa">내정보 보호</span></a></li>
				<li ><a href="/change/password.daum" class="link_gnb link_gnb4"><span class="ir_wa">비밀번호 변경</span></a></li>
			</ul>
			<ul class="gnb_with">
				<li class="on"><a href="/withdraw.daum" class="link_gnb link_gnb1"><span class="ir_wa">회원탈퇴</span></a></li>
			</ul>
		</div>
	</div>
</div>

        <hr class="hide" />
    <div id="daumContent" role="main" >    
      <div id="cMain">
        <div id="mArticle">
          <h2 id="daumBody" class="screen_out">회원탈퇴 별도해지서비스 본문</h2>
          <div class="myinfo_intro intro_out">
            <span class="bg_intro"></span>
            <div class="cont_intro">
              <h3 class="tit_comm tit_outpw">안전한 회원탈퇴를 위해, 비밀번호를 확인해 주세요.</h3>
              <p class="desc_g">
			비밀번호 확인 후 아이디는 즉시 탈퇴됩니다.<br>
			탈퇴 후에는 동일 아이디로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없으니 신중하게 선택해 주세요.
              </p>
            </div>
          </div>
          <form action="${pageContext.request.contextPath}/member/withdraw.do?action=agree-check&id=${sessionScope.mvo.id}" method="post">
            <fieldset class="fld_comm">
              <legend class="screen_out">비밀번호 재확인 입력 폼</legend>
              <div class="info_comm">
                <div class="info_detail info_daumid">
                  <div class="tit_detail tit_space">
                    <strong class="txt_comm txt_id">아이디</strong>
                  </div>
                  <div class="input_info input_daumid">${sessionScope.mvo.id }</div>
                </div>
                <div class="info_detail info_pwreconfirm">
                  <div class="tit_detail">
                    <strong class="txt_comm txt_pwreconfirm">비밀번호</strong>
                  </div>
                  <div class="input_info">
                    <div class="bg_user bg_basic">
                      <label for="reconfirmPassword" class="lab_g">비밀번호 입력</label>
                      <input type="password" id="reconfirmPassword" name="reconfirmPassword" class="tf_g" >
                      <input type="text" id="textReconfirmPassword" style="display:none;" name="textReconfirmPassword" class="tf_g" >
                    </div>
                    <p class="desc_add emph_notice" style="display:none;"></p>
                  </div>
                </div>
              </div>
              <div class="wrap_btn">
                <a href="/home.daum" class="btn_comm btn_cancel"><span class="screen_out">탈퇴 취소</span></a>
                <button type="submit" class="btn_comm btn_confirm"><span class="screen_out">확인</span></button>
              </div>
            </fieldset>
          </form>
        </div><!--// mArticle -->
      </div><!-- // cMain -->    
    </div> 
  <!-- // daumContent -->
<hr class="hide">
<div id="daumFoot" class="footer_comm" role="contentinfo">
    <h2 class="screen_out">서비스 이용정보</h2>
    <a href="http://policy.daum.net/info/info" target="_blank" class="link_info">서비스 약관/정책</a> | <a href="http://policy.daum.net/info_protection/info_protection" target="_blank" class="link_info">개인정보처리방침</a> | <a href="https://cs.daum.net/redbell/top.html" target="_blank" class="link_info">권리침해신고</a> | <a href="http://cs.daum.net/faq/59.html" target="_blank" class="link_info">고객센터</a>
    <small class="txt_copyright">Copyright &#169; <a href="http://www.kakaocorp.com" class="link_daum" style="font-weight: bold">Kakao Corp.</a> All rights reserved.</small>
</div>	<!-- // daumFoot -->

</div>
<script type="text/javascript">
    var _tiq = 'undefined' !== typeof _tiq ? _tiq : []; // Global Variables
</script>
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


<script type="text/javascript" src="/content/js/jquery.form.member.init.js?v=170601010314"></script>
<script type="text/javascript" src="/content/js/jquery.form.validate.js?v=170601010314"></script>
<script type="text/javascript">
$(document).ready(function(){

  var validator = $("form").validate(
    {
      rules: {
        reconfirmPassword: "required"
      },
      messages: {
        reconfirmPassword: "비밀번호를 입력해 주세요."
      }
    }
  );
  
  var form = $("form").getForm(
    {
      getElementForShowError : function (element) {
        return $(element).parent();
      }
    }
  );
  
  form.initWebRow('.info_detail');
  form.bindPasswordEvent('reconfirmPassword');
  
          
  var submitted = false;
  $("form").submit(function() {
    if(!submitted) {
      submitted = true;
      var errorList = validator.getFormErrorList();
      if(errorList.length !== 0) {
        for(var i=0; errorList[i]; i++) {
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
</script>
</body>