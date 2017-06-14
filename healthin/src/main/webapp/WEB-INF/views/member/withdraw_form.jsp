<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
  <meta charset="utf-8">
  <title>회원탈퇴 | Health人 내정보</title>
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
				<li ><a href="${pageContext.request.contextPath}/home.do" class="link_gnb link_gnb1"><span class="ir_wa">Health人  홈</span></a></li>
				<li ><a href="${pageContext.request.contextPath}/member/modify_form.do?id=${sessionScope.mvo.id}" class="link_gnb link_gnb2"><span class="ir_wa">내정보 관리</span></a></li>
				<li ><a href="${pageContext.request.contextPath}/passwordSearchform.do" class="link_gnb link_gnb4">
				</a></li>
			</ul>
		</div>
	</div>
</div>

  <hr class="hide" />
    <div id="daumContent" role="main" >    
      <div id="cMain">
        <div id="mArticle">
          <div class="dimmed_layer" style="display:none"></div>
          <h2 id="daumBody" class="screen_out">회원탈퇴 안내동의 본문</h2>
          <div class="myinfo_intro intro_out">
            <span class="bg_intro"></span>
            <div class="cont_intro">
              <h3 class="tit_comm tit_outagree">회원탈퇴에 앞서 유의사항 및 안내를 반드시 읽고 진행해 주세요!</h3>
            </div>
          </div>
          <form action="${pageContext.request.contextPath}/member/withdraw_step2.do?id=${sessionScope.mvo.id}" method="post">

            <div class="info_agree">
              
              <div class="info_user">
                <strong class="tit_agree">Health人  아이디 재사용 및 복구 불가 안내</strong>
                <span class="txt_agree">회원탈퇴 진행 시 본인을 포함한 타인 모두 <em class="emph_g">아이디 재사용이나 복구가 불가능합니다.</em><br>
                신중히 선택하신 후 결정해주세요.</span>
                <span class="check_notice">
                  <input type="checkbox" id="idAgree" name="idAgree" class="tf_check">
                  <label for="idAgree" class="lab_check">
                    <span class="ico_comm ico_check"></span>
                    동의
                  </label>
                </span>
              </div>
              
              <div class="info_user">
                <strong class="tit_agree">내정보 및 맞춤형 서비스 이용 기록 삭제 안내</strong>
                <span class="txt_agree">내정보 및 맞춤형 서비스 이용기록이 모두 삭제되며,<em class="emph_g">삭제된 회원님의 데이터는 복구되지 않습니다.</em><br></span>
                <span class="check_notice">
                  <input type="checkbox" id="serviceAgree" name="serviceAgree" class="tf_check">
                  <label for="serviceAgree" class="lab_check">
                    <span class="ico_comm ico_check"></span>
                    동의
                  </label>
                </span>
              </div>
              
              <div class="info_user">
                <strong class="tit_agree">게시판형 서비스에 등록한 게시글 삭제 불가 안내</strong>
                <span class="txt_agree">삭제를 원하는 게시글이 있다면 반드시 회원탈퇴 전 삭제하시기 바랍니다.<br>탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, <em class="emph_g">게시글을 임의로 삭제해드릴 수 없습니다.</em></span>
                <span class="check_notice">
                  <input type="checkbox" id="boardAgree" name="boardAgree" class="tf_check">
                  <label for="boardAgree" class="lab_check">
                    <span class="ico_comm ico_check"></span>
                    동의
                  </label>
                </span>
              </div>
            </div>
            <div class="wrap_btn">
              <a href="${pageContext.request.contextPath}/home.do" class="btn_comm btn_cancel"><span class="screen_out">탈퇴 취소</span></a>
              <button type="submit" class="btn_comm btn_next"><span class="screen_out">다음 단계</span></button>
            </div>
          </form>
          
          <!-- 회원탈퇴_안내동의 팝업 -->
          <div id="wrongLayer" class="userinfo_layer" style="top:300px;margin-left:-188px;display:none;">
            <div class="inner_myinfo_layer">
              <div class="layer_head">
                <strong class="screen_out">회원탈퇴 안내동의 레이어</strong>
              </div>
              <div class="layer_body">
                <strong class="tit_layer">안내사항을 확인하신 후, 동의해 주세요.</strong>
                <div class="btn_process">
                  <button type="button" class="btn_comm btn_ok"><span class="screen_out">확인</span></button>
                </div>
              </div>
              <div class="layer_foot">
                <button type="button" class="btn_comm btn_close">닫기</button>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.min.js"></script>


<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.form.member.init.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.form.validate.js"></script>


<script type="text/javascript">
$(document).ready(function(){

  var validator = $("form").validate(
    {
      rules: {
        idAgree: "required",
        serviceAgree: "required",
        boardAgree: "required"
      },
      messages: {
        idAgree: "안내사항을 확인하신 후, 동의해 주세요.",
        serviceAgree: "안내사항을 확인하신 후, 동의해 주세요.",
        boardAgree: "안내사항을 확인하신 후, 동의해 주세요."
      }
    }
  );
  
  var form = $("form").getForm();
  form.bindCheckBoxEvent();
  


         
  var submitted = false;
  $("form").submit(function() {
    if(!submitted) {
      submitted = true;
      var errorList = validator.getFormErrorList();
      if(errorList.length !== 0) {
        var errorMsg = "";
        for(var i=0; errorList[i]; i++) {
          errorMsg = errorList[i].message;
        }
        form.showLayer("wrongLayer", errorMsg);
        submitted = false;
        return false;
      }
      return true;
    }
    return false;
  });
  
  $(".btn_close, .btn_ok, .btn_numnot").click(function(){
    form.hideAllLayer();
  });
  
});    
</script>
</body>