<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- Page Content -->
    <div class="container">

        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">FAQ
                    <small>Health 人 이용안내</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/home.do">Home</a>
                    </li>
                    <li class="active">FAQ</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->

        <!-- Content Row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel-group" id="accordion">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">회원정보 수정은 어떻게 하나요?</a>
                            </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse">
                            <div class="panel-body">
                             "우측 상단의 회원정보 수정에서 변경 가능"<br>
                             우측 상단의 회원정보 수정 클릭 -> 수정할 내용을 수정할 공간에 입력 후 '확인' 클릭 <br>
                             ex)비밀번호 수정시 비밀번호 란에 비밀번호 입력
                             	<br>※아이디는 변경할 수 없습니다.
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">회원의 종류가 어떻게 되나요?</a>
                            </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse">
                            <div class="panel-body">
                                "일반 회원과 트레이너 회원"<br>
                                Health 人 은 이용만을 목적으로 하는 일반회원과, <br>
                                동영상 게시 및 회원의 PT를 할 수 있는 트레이너 회원으로 구분됩니다.
                                
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFour">비밀번호가 기억나지 않아요.</a>
                            </h4>
                        </div>
                        <div id="collapseFour" class="panel-collapse collapse">
                            <div class="panel-body">
                                "본인 인증후 비밀번호 변경 가능"<br>
                                비밀번호가 기억나지 않을 경우 본인인증 찾기를 통해 찾으실 수 있습니다.<br>
                                로그인 버튼 클릭-> 비밀번호 찾기 클릭 -> 인증수단 선택 (가입시 입력한 핸드폰 번호 혹은 이메일 주소)<br>
                                새 비밀번호를 입력후 이용합니다.
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFive">아이디가 기억나지 않아요.</a>
                            </h4>
                        </div>
                        <div id="collapseFive" class="panel-collapse collapse">
                            <div class="panel-body">
                                "본인인증 후 아이디 조회 가능"<br>
                                아이디가 기억나지 않을 경우 본인인증 찾기를 통해 찾으실 수 있습니다.<br>
                                로그인 버튼 클릭-> 아이디 찾기 클릭 -> 인증수단 선택 (가입시 입력한 핸드폰 번호 혹은 이메일 주소)<br>
                                조회된 아이디로 로그인 후 이용합니다.
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseSix">트레이너 님께 PT를 받고 싶어요.</a>
                            </h4>
                        </div>
                        <div id="collapseSix" class="panel-collapse collapse">
                            <div class="panel-body">
                                "트레이너 - 회원 맞팔 후 이용가능"<br>
                                메뉴바  PT강사 -> PT 강사진 ->원하는 강사님의 프로필 조회 -> 하트클릭 <br>
                                하트가 클릭되어 빨강색이 되면 팔로잉 신청이 됩니다.<br>
                                강사님이 맞팔 해주시면 매칭신청이 가능합니다. <br>                 
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">PT 결제를 하면 어떤 혜택이 있나요?</a>
                            </h4>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse">
                            <div class="panel-body">
                                "트레이너의 PT 및 식단관리"<br>
                                트레이너 님이 회원님의 식단을 조회하고 관리합니다.<br>
                                또한,트레이너 님이 운동 내역을 조회하고 관리합니다.<br>
                          PT결제시 트레이너님의 모든 동영상을 조회하고 운동할 수 있습니다.<br>
                                트레이너 님께 1:1로 멘토링을 받을 수 있습니다.
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseSeven">PT 이용 금액이 얼마인가요?</a>
                            </h4>
                        </div>
                        <div id="collapseSeven" class="panel-collapse collapse">
                            <div class="panel-body">
                                "월 1만원에 이용가능"<br>
                                모든 강사님들의 PT 이용금액은 동일하게 월 1만원에 이용할 수 있습니다.
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseEight">트레이너 회원 페이지에 "지금은 사용할 수 없습니다" 라고 나옵니다.</a>
                            </h4>
                        </div>
                        <div id="collapseEight" class="panel-collapse collapse">
                            <div class="panel-body">
                                "트레이너 등급 미 충족시 이용불가"<br>
                                가입 직후에는 트레이너 분들의 등급이 낮아서 이용이 불가합니다.<br>
                                트레이너 등급은 헬스 人에 문의하여 주세요. 
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseNine">유저 마이페이지 이용은 어떻게하나요?</a>
                            </h4>
                        </div>
                        <div id="collapseNine" class="panel-collapse collapse">
                            <div class="panel-body">
                                "캘린더, 기간조회,BMI 기능이 있습니다"<br>
                                캘린더의 날짜를 선택하여 섭취 혹은 소비 칼로리를 입력하고<br>
                                입력된 데이터를 기간별로 조회할 수 있습니다.<br>
                                본인의 비만도를 측정하고 싶으면 BMI 메뉴에 신장과 몸무게를 입력하여 측정할 수 있습니다.
                                
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.panel-group -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->