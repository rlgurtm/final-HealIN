<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>회원가입</title>
<meta property="og:title" content="HealthIn 회원가입">
<title>개인 가입 약관 동의 | HealthIn 회원가입</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta http-equiv="Pragma" content="no-cache" />
<meta name="description" content="Daum 회원가입">

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
					<a href="${pageContext.request.contextPath}/home.do" id="daumServiceLogo" class="ico_join">
					<img src="${pageContext.request.contextPath}/resources/img/로고.png" height="80" width="200">
					<span class="ir_wa">HEALTHIN</span></a>
				</h1>
			</div>
		</div>
		<hr class="hide">
		<h2 class="screen_out">회원가입 안내 본문</h2>
		<div id="kakaoBody" class="cont_personal">
			<div class="paging_step">
				<span class="ico_join ico_paging on"></span> 
				<span class="ico_join ico_paging"></span> 
				<span class="ico_join ico_paging"></span>
			</div>
			<div class="wrap_tit">
				<h3 class="tit_join">개인 가입 약관 동의</h3>
				<div class="txt_desc">
					서비스 약관 및 개인정보 수집, 이용에 <strong class="txt_emph">동의</strong>해 주세요.
				</div>
			</div>
			<form id="joinTerms" name="joinTerms" action="/join/terms"
				method="post">
				<fieldset class="fld_comm">
					<legend class="screen_out">HEALTHIN 서비스 약관 및 개인정보 수집, 이용에 대한
						동의</legend>
					<div class="box_comm box_terms">
						<h5 class="tit_agreement">HEALTHIN 서비스 약관 동의</h5>
						<div id="termsAgreeContainer" class="cont_agreement">
							<!-- 포커스 시 tabindex=“0” 추가 -->
							<strong class="tit_article">제 1 장 총 칙</strong> <span class="tit">제
								1 조 목적</span>
							<p>본 약관은 서비스 이용자가 주식회사 HEALTHIN(이하 “회사”라 합니다)가 제공하는 온라인상의 인터넷
								서비스(이하 “서비스”라고 하며, 접속 가능한 유∙무선 단말기의 종류와는 상관없이 이용 가능한 “회사”가 제공하는
								모든 “서비스”를 의미합니다. 이하 같습니다)에 회원으로 가입하고 이를 이용함에 있어 회사와 회원(본 약관에
								동의하고 회원등록을 완료한 서비스 이용자를 말합니다. 이하 “회원”이라고 합니다)의 권리•의무 및 책임사항을
								규정함을 목적으로 합니다.</p>
							<span class="tit">제 2 조 (약관의 명시, 효력 및 개정)</span>
							<ol class="list_terms">
								<li><span class="txt_num">①</span>
									<p class="txt_clause">회사는 이 약관의 내용을 회원이 쉽게 알 수 있도록 서비스 초기
										화면에 게시합니다.</p></li>
								<li><span class="txt_num">②</span>
									<p class="txt_clause">회사는 온라인 디지털콘텐츠산업 발전법, 전자상거래 등에서의
										소비자보호에 관한 법률, 약관의 규제에 관한 법률, 소비자기본법 등 관련법을 위배하지 않는 범위에서 이 약관을
										개정할 수 있습니다.</p></li>
								<li><span class="txt_num">③</span>
									<p class="txt_clause">회사가 약관을 개정할 경우에는 기존약관과 개정약관 및 개정약관의
										적용일자와 개정사유를 명시하여 현행약관과 함께 그 적용일자 일십오(15)일 전부터 적용일 이후 상당한 기간
										동안, 개정 내용이 회원에게 불리한 경우에는 그 적용일자 삼십(30)일 전부터 적용일 이후 상당한 기간 동안
										각각 이를 서비스 홈페이지에 공지하고 기존 회원에게는 회사가 부여한 이메일 주소로 개정약관을 발송하여
										고지합니다.</p></li>
								<li><span class="txt_num">④</span>
									<p class="txt_clause">회사가 전항에 따라 회원에게 통지하면서 공지∙고지일로부터 개정약관
										시행일 7일 후까지 거부의사를 표시하지 아니하면 승인한 것으로 본다는 뜻을 명확하게 고지하였음에도 의사표시가
										없는 경우에는 변경된 약관을 승인한 것으로 봅니다. 회원이 개정약관에 동의하지 않을 경우 회원은 제17조
										제1항의 규정에 따라 이용계약을 해지할 수 있습니다.</p></li>
							</ol>
							<strong class="tit_article">제 2 장 회원의 가입 및 관리</strong> <span
								class="tit">제 3 조 (회원가입절차)</span>
							<ol class="list_terms">
								<li><span class="txt_num">①</span>
									<p class="txt_clause">서비스 이용자가 본 약관을 읽고 “동의” 버튼을 누르거나 “확인”
										등에 체크하는 방법을 취한 경우 본 약관에 동의한 것으로 간주합니다.</p></li>
								<li><span class="txt_num">②</span>
									<p class="txt_clause">회사의 서비스 이용을 위한 회원가입은 서비스 이용자가 제1항과 같이
										동의한 후, 회사가 정한 온라인 회원가입 신청서에 회원 ID를 포함한 필수사항을 입력하고, “등록하기” 내지
										“확인” 단추를 누르는 방법으로 합니다. 다만, 회사가 필요하다고 인정하는 경우 회원에게 별도의 서류를
										제출하도록 할 수 있습니다.</p></li>
								<li><span class="txt_num">③</span>
									<p class="txt_clause">법인고객 회원가입의 경우 회원가입 신청서의 제출, 서비스 이용대금의
										납부 이외에 회사가 정하는 추가 서류의 제출이 추가적으로 필요합니다.</p></li>
								<li><span class="txt_num">④</span>
									<p class="txt_clause">법인고객 회원가입의 경우 서비스 이용자와 이용요금 납입자가 다를
										경우 회사는 이를 확인하기 위하여 제 증명을 요구할 수 있습니다.</p></li>
							</ol>
							<span class="tit">제 4 조 (회원등록의 성립과 유보 및 거절)</span>
							<ol class="list_terms">
								<li><span class="txt_num">①</span>
									<p class="txt_clause">회원등록은 제3조에 정한 절차에 의한 서비스 이용자의 회원가입
										신청과 회사의 회원등록 승낙에 의하여 성립합니다. 회사는 회원가입 신청자가 필수사항 등을 성실히 입력하여
										가입신청을 완료하였을 때에는 필요한 사항을 확인한 후 지체 없이 이를 승낙을 하여야 합니다. 단 회원가입 신청서
										제출 이외에 별도의 자료 제출이 요구되는 경우에는 예외로 합니다.</p></li>
								<li><span class="txt_num">②</span>
									<p class="txt_clause">회사는 아래 각 호의 1에 해당하는 경우에는 회원등록의 승낙을
										유보할 수 있습니다.</p>
									<ol class="list_2depth">
										<li>1. 제공서비스 설비용량에 현실적인 여유가 없는 경우</li>
										<li>2. 서비스를 제공하기에는 기술적으로 문제가 있다고 판단되는 경우</li>
										<li>3. 법인 고객으로 가입신청을 하고 제3조 제3항 내지 제4항의 의무를 이행하지 않은 경우</li>
										<li>4. 기타 회사가 재정적, 기술적으로 필요하다고 인정하는 경우</li>
									</ol></li>
								<li><span class="txt_num">③</span>
									<p class="txt_clause">회사는 아래 각 호의 1에 해당하는 경우에는 회원등록을 거절할 수
										있습니다.</p>
									<ol class="list_2depth">
										<li>1. 가입신청서의 내용을 허위로 기재하였거나 허위서류를 첨부하여 가입신청을 하는 경우</li>
										<li>2. 법인 고객으로 가입신청을 하고 회사가 별도로 규정하는 일정한 기간 이내에 제3조 제3항
											내지 제4항의 의무를 이행하지 않은 경우</li>
										<li>3. 14세 미만의 아동이 개인정보제공에 대한 동의를 부모 등 법정대리인으로부터 받지 않은 경우</li>
										<li>4. 기타 회사가 관련법령 등을 기준으로 하여 명백하게 사회질서 및 미풍양속에 반할 우려가
											있음을 인정하는 경우</li>
										<li>5. 제17조 제2항에 의하여 회사가 계약을 해지했던 회원이 다시 회원 신청을 하는 경우</li>
									</ol></li>
							</ol>
							<span class="tit">제 5 조 (회원 ID 등의 관리책임)</span>
							<ol class="list_terms">
								<li><span class="txt_num">①</span>
									<p class="txt_clause">회원은 서비스 이용을 위한 회원 ID, 비밀번호의 관리에 대한
										책임, 본인 ID의 제3자에 의한 부정사용 등 회원의 고의∙과실로 인해 발생하는 모든 불이익에 대한 책임을
										부담합니다. 단, 이것이 회사의 고의∙과실로 인하여 야기된 경우는 회사가 책임을 부담합니다.</p></li>
								<li><span class="txt_num">②</span>
									<p class="txt_clause">회원은 회원 ID, 비밀번호 및 추가정보 등을 도난 당하거나
										제3자가 사용하고 있음을 인지한 경우에는 즉시 본인의 비밀번호를 수정하는 등의 조치를 취하여야 하며 즉시 이를
										회사에 통보하여 회사의 안내를 따라야 합니다.</p></li>
							</ol>
							<span class="tit">제 6 조 (개인정보의 수집 등)</span>
							<p>회사는 서비스를 제공하기 위하여 관련 법령의 규정에 따라 회원으로부터 필요한 개인정보를 수집합니다.</p>
							<span class="tit">제 7 조 (회원정보의 변경)</span>
							<p>회원은 아래 각 호의 1에 해당하는 사항이 변경되었을 경우 즉시 회원정보 관리페이지에서 이를 변경하여야
								합니다. 이 경우 회사는 회원이 회원정보를 변경하지 아니하여 발생한 손해에 대하여 책임을 부담하지 아니하며, 법인
								회원의 경우에는 회사가 별도로 정하는 방법으로 변경할 수 있습니다.</p>
							<ol class="list_2depth">
								<li>1. 생년월일, 거주지역 및 연락처 등</li>
								<li>2. 우편/경품 수신 주소, 취미•관심사 등</li>
								<li>3. 서비스별 뉴스레터 수신 여부 등</li>
								<li>4. 기타 회사가 인정하는 사항</li>
							</ol>
							<strong class="tit_article">제 3 장 서비스의 이용</strong> <span
								class="tit">제 8 조 (서비스 이용)</span>
							<ol class="list_terms">
								<li><span class="txt_num">①</span>
									<p class="txt_clause">서비스 이용은 회사의 서비스 사용승낙 직후부터 가능합니다. 다만,
										유료 서비스의 경우 회사가 요금납입을 확인한 직후부터 가능하게 할 수 있습니다.</p></li>
								<li><span class="txt_num">②</span>
									<p class="txt_clause">민법상 미성년자인 회원이 유료 서비스를 이용할 경우 미성년자인
										회원은 결제 전 법정대리인의 동의를 얻어야 합니다.</p></li>
								<li><span class="txt_num">③</span>
									<p class="txt_clause">서비스 이용시간은 회사의 업무상 또는 기술상 불가능한 경우를
										제외하고는 연중무휴 1일 24시간(00:00-24:00)으로 함을 원칙으로 합니다. 다만, 서비스설비의 정기점검
										등의 사유로 회사가 서비스를 특정범위로 분할하여 별도로 날짜와 시간을 정할 수 있습니다.</p></li>
							</ol>
							<span class="tit">제 9 조 (서비스내용변경 통지 등)</span>
							<ol class="list_terms">
								<li><span class="txt_num">①</span>
									<p class="txt_clause">회사가 서비스 제공을 위해 계약한 CP(Contents
										Provider)와의 계약종료, CP의 변경, 신규서비스의 개시 등의 사유로 서비스 내용이 변경되거나 서비스가
										종료되는 경우 회사는 회원의 등록된 전자우편 주소로 이메일을 통하여 서비스 내용의 변경 사항 또는 종료를 통지할
										수 있습니다.</p></li>
								<li><span class="txt_num">②</span>
									<p class="txt_clause">전항의 경우 불특정 다수인을 상대로 통지를 함에 있어서는 웹사이트
										기타 회사의 공지사항 페이지를 통하여 회원들에게 통지할 수 있습니다. 단, 회원 본인의 거래와 관련하여 중대한
										영향을 미치는 사항은 상당한 기간 동안 게시판을 통해 이를 공지하고 회사가 부여한 이메일 주소로 개별통지
										합니다.</p></li>
								<li><span class="txt_num">③</span>
									<p class="txt_clause">유료 서비스가 종료되는 경우에는 서비스를 이용하는 회원에게 반드시
										제1항의 규정에 따라 이메일을 통하여 이를 고지하며 제16조 제4항의 규정에 따라 환불 처리합니다.</p></li>
							</ol>
							<span class="tit">제 10 조 (권리의 귀속 및 저작물의 이용)</span>
							<ol class="list_terms">
								<li><span class="txt_num">①</span>
									<p class="txt_clause">회원이 서비스 내에 게시한 게시물 등(이하 "게시물 등"이라
										합니다)의 저작권은 해당 게시물의 저작자에게 귀속됩니다.</p></li>
								<li><span class="txt_num">②</span>
									<p class="txt_clause">게시물 등은 회사가 운영하는 인터넷 사이트 및 모바일 어플리케이션을
										통해 노출될 수 있으며, 검색결과 내지 관련 프로모션 등에도 노출될 수 있습니다. 해당 노출을 위해 필요한 범위
										내에서는 일부 수정, 복제, 편집되어 게시될 수 있습니다. 이 경우, 회사는 저작권법 규정을 준수하며, 회원은
										언제든지 고객센터 또는 각 서비스 내 관리기능을 통해 해당 게시물 등에 대해 삭제, 검색결과 제외, 비공개 등의
										조치를 취할 수 있습니다.</p></li>
								<li><span class="txt_num">③</span>
									<p class="txt_clause">회사는 제2항 이외의 방법으로 회원의 게시물 등을 이용하고자 하는
										경우에는 전화, 팩스, 전자우편 등을 통해 사전에 회원의 동의를 얻습니다.</p></li>
							</ol>
							<span class="tit">제 11 조 (서비스 이용의 제한 및 중지)</span>
							<ol class="list_terms">
								<li><span class="txt_num">①</span>
									<p class="txt_clause">회사는 아래 각 호의 1에 해당하는 사유가 발생한 경우에는 회원의
										서비스 이용을 제한하거나 중지시킬 수 있습니다.</p>
									<ol class="list_2depth">
										<li>1. 회원이 회사 서비스의 운영을 고의∙과실로 방해하는 경우</li>
										<li>2. 회원이 제13조의 의무를 위반한 경우</li>
										<li>3. 서비스용 설비 점검, 보수 또는 공사로 인하여 부득이한 경우</li>
										<li>4. 전기통신사업법에 규정된 기간통신사업자가 전기통신 서비스를 중지했을 경우</li>
										<li>5. 국가비상사태, 서비스 설비의 장애 또는 서비스 이용의 폭주 등으로 서비스 이용에 지장이
											있는 때</li>
										<li>6. 기타 중대한 사유로 인하여 회사가 서비스 제공을 지속하는 것이 부적당하다고 인정하는 경우</li>
									</ol></li>
								<li><span class="txt_num">②</span>
									<p class="txt_clause">회사는 전항의 규정에 의하여 서비스의 이용을 제한하거나 중지한
										때에는 그 사유 및 제한기간등을 회원에게 알려야 합니다.</p></li>
								<li><span class="txt_num">③</span>
									<p class="txt_clause">제17조 제2항에 의해 회사가 회원과의 계약을 해지하고 탈퇴시키기로
										결정한 경우 회사는 회원의 탈퇴 처리 전에 이를 통지하고, 회원은 회사의 통지를 받은 날로부터 30일 이내에
										이에 대한 항변의 기회를 가집니다.</p></li>
								<li><span class="txt_num">④</span>
									<p class="txt_clause">회원이 서비스를 이용하는 도중, 연속하여 삼(3)개월 동안 서비스를
										이용하기 위해 log-in한 기록이 없는 경우, 회사는 당해 회원 "한메일넷 서비스"의 전자우편 수신을 제한할
										수 있습니다.</p></li>
								<li><span class="txt_num">⑤</span>
									<p class="txt_clause">정보통신망 이용촉진 및 정보보호 등에 관한 법률(이하
										“정보통신망법”이라 합니다)의 규정에 의해 다른 회원의 공개된 게시물 등이 본인의 사생활을 침해하거나 명예를
										훼손하는 등 권리를 침해 받은 회원 또는 제3자(이하 “삭제 등 신청인”이라 합니다)는 그 침해사실을 소명하여
										회사에 해당 게시물 등의 삭제 또는 반박 내용의 게재를 요청할 수 있습니다. 이 경우 회사는 해당 게시물 등의
										권리 침해 여부를 판단할 수 없거나 당사자 간의 다툼이 예상되는 경우 해당 게시물 등에 대한 접근을 임시적으로
										차단하는 조치(이하 “임시조치”라 합니다)를 최장 30일까지 취합니다.</p></li>
								<li><span class="txt_num">⑥</span>
									<p class="txt_clause">제5항에 의해 본인의 게시물 등이 임시조치된 회원(이하 “게시자”라
										합니다)은 임시조치기간 중 회사에 해당 게시물 등을 복원해 줄 것을 요청(이하 “재게시 청구”라 합니다)할 수
										있으며, 회사는 임시조치된 게시물의 명예훼손 등 판단에 대한 방송통신심의위원회 심의 요청에 대한 게시자 및 삭제
										등 신청인의 동의가 있는 경우 게시자 및 삭제 등 신청인을 대리하여 이를 요청하고 동의가 없는 경우 회사가 이를
										판단하여 게시물 등의 복원 여부를 결정합니다. 게시자의 재게시 청구가 있는 경우 임시조치 기간 내에
										방송통신심의위원회 또는 회사의 결정이 있으면 그 결정에 따르고 그 결정이 임시조치 기간 내에 있지 않는 경우
										해당 게시물 등은 임시조치 만료일 이후 복원됩니다. 재게시 청구가 없는 경우 해당 게시물 등은 임시조치 기간
										만료 이후 삭제됩니다.</p></li>
								<li><span class="txt_num">⑦</span>
									<p class="txt_clause">회사는 서비스 내에 게시된 게시물 등이 사생활 침해 또는 명예훼손
										등 제3자의 권리를 침해한다고 인정하는 경우 제5항에 따른 회원 또는 제3자의 신고가 없는 경우에도
										임시조치(이하 “임의의 임시조치”라 합니다)를 취할 수 있습니다. 임의의 임시조치된 게시물의 처리 절차는 제5항
										후단 및 제6항의 규정에 따릅니다.</p></li>
								<li><span class="txt_num">⑧</span>
									<p class="txt_clause">회원의 게시물 등으로 인한 법률상 이익 침해를 근거로, 다른 회원
										또는 제3자가 회원 또는 회사를 대상으로 하여 민형사상의 법적 조치(예: 형사고소, 가처분 신청∙손해배상청구 등
										민사소송의 제기)를 취하는 경우, 회사는 동 법적 조치의 결과인 법원의 확정판결이 있을 때까지 관련 게시물 등에
										대한 접근을 잠정적으로 제한할 수 있습니다. 게시물 등의 접근 제한과 관련한 법적 조치의 소명, 법원의 확정
										판결에 대한 소명 책임은 게시물 등에 대한 조치를 요청하는 자가 부담합니다.</p></li>
							</ol>
							<span class="tit">제 12 조 (회사의 의무)</span>
							<ol class="list_terms">
								<li><span class="txt_num">①</span>
									<p class="txt_clause">회사는 회사의 서비스 제공 및 보안과 관련된 설비를 지속적이고
										안정적인 서비스 제공에 적합하도록 유지, 점검 또는 복구 등의 조치를 성실히 이행하여야 합니다.</p></li>
								<li><span class="txt_num">②</span>
									<p class="txt_clause">회사는 회원이 수신 동의를 하지 않은 영리 목적의 광고성 전자우편,
										SMS 문자메시지 등을 발송하지 아니합니다.</p></li>
								<li><span class="txt_num">③</span>
									<p class="txt_clause">회사는 서비스의 제공과 관련하여 알게 된 회원의 개인정보를 본인의
										승낙 없이 제3자에게 누설, 배포하지 않고, 이를 보호하기 위하여 노력합니다. 회원의 개인정보보호에 관한 기타의
										사항은 정보통신망법 및 회사가 별도로 정한 “개인정보관리지침”에 따릅니다.</p></li>
								<li><span class="txt_num">④</span>
									<p class="txt_clause">회사가 제3자와의 서비스 제공계약 등을 체결하여 회원에게 서비스를
										제공하는 경우 회사는 각 개별서비스에서 서비스의 제공을 위하여 제3자에게 제공되는 회원의 구체적인 회원정보를
										명시하고 회원의 개별적이고 명시적인 동의를 받은 후 동의의 범위 내에서 해당 서비스의 제공 기간 동안에 한하여
										회원의 개인정보를 제3자와 공유하는 등 관련 법령을 준수합니다.</p></li>
							</ol>
							<span class="tit">제 13 조 (회원의 의무)</span>
							<ol class="list_terms">
								<li><span class="txt_num">①</span>
									<p class="txt_clause">회원은 아래 각 호의 1에 해당하는 행위를 하여서는 아니 됩니다.</p>
									<ol class="list_2depth">
										<li>1. 회원가입신청 또는 변경 시 허위내용을 등록하는 행위</li>
										<li>2. 회사의 서비스에 게시된 정보를 변경하거나 서비스를 이용하여 얻은 정보를 회사의 사전 승낙
											없이 영리 또는 비영리의 목적으로 복제, 출판, 방송 등에 사용하거나 제3자에게 제공하는 행위</li>
										<li>3. 회사가 제공하는 서비스를 이용하여 제3자에게 본인을 홍보할 기회를 제공 하거나 제3자의
											홍보를 대행하는 등의 방법으로 금전을 수수하거나 서비스를 이용할 권리를 양도하고 이를 대가로 금전을 수수하는
											행위</li>
										<li>4. 회사 기타 제3자에 대한 허위의 사실을 게재하거나 지적재산권을 침해하는 등 회사나 제3자의
											권리를 침해하는 행위</li>
										<li>5. 다른 회원의 ID 및 비밀번호를 도용하여 부당하게 서비스를 이용하는 행위</li>
										<li>6. 타인의 계좌번호 및 신용카드번호 등 타인의 허락 없이 타인의 결제정보를 이용하여 회사의
											유료서비스를 이용하는 행위</li>
										<li>7. 정크메일(junk mail), 스팸메일(spam mail), 행운의 편지(chain
											letters), 피라미드 조직에 가입할 것을 권유하는 메일, 외설 또는 폭력적인 메시지•화상•음성 등이 담긴
											메일을 보내거나 기타 공서양속에 반하는 정보를 공개 또는 게시하는 행위</li>
										<li>8. 정보통신망법 등 관련 법령에 의하여 그 전송 또는 게시가 금지되는 정보(컴퓨터 프로그램
											등)를 전송하거나 게시하는 행위</li>
										<li>9. 청소년보호법에서 규정하는 청소년유해매체물을 게시하는 행위</li>
										<li>10. 공공질서 또는 미풍양속에 위배되는 내용의 정보, 문장, 도형, 음성 등을 유포하는 행위</li>
										<li>11. 회사의 직원이나 서비스의 관리자를 가장하거나 사칭하여 또는 타인의 명의를 모용하여 글을
											게시하거나 메일을 발송하는 행위</li>
										<li>12. 컴퓨터 소프트웨어, 하드웨어, 전기통신 장비의 정상적인 가동을 방해, 파괴할 목적으로
											고안된 소프트웨어 바이러스, 기타 다른 컴퓨터 코드, 파일, 프로그램을 포함하고 있는 자료를 게시하거나
											전자우편으로 발송하는 행위</li>
										<li>13. 스토킹(stalking), 욕설, 채팅글 도배 등 다른 회원의 서비스 이용을 방해하는
											행위</li>
										<li>14. 다른 회원의 개인정보를 그 동의 없이 수집, 저장, 공개하는 행위</li>
										<li>15. 불특정 다수의 회원을 대상으로 하여 광고 또는 선전을 게시하거나 스팸메일을 전송할
											목적으로 회사에서 제공하는 프리미엄 메일 기타 서비스를 이용하여 영리활동을 하는 행위</li>
										<li>16. 회사가 제공하는 소프트웨어 등을 개작하거나 리버스 엔지니어링, 디컴파일, 디스어셈블 하는
											행위</li>
										<li>17. 현행 법령, 회사가 제공하는 서비스에 정한 약관 기타 서비스 이용에 관한 규정을 위반하는
											행위</li>
									</ol></li>
								<li><span class="txt_num">②</span>
									<p class="txt_clause">회사는 회원이 제1항의 행위를 하는 경우 해당 게시물 등을 삭제
										또는 임시삭제할 수 있고 서비스의 이용을 제한하거나 일방적으로 본 계약을 해지할 수 있습니다.</p></li>
								<li><span class="txt_num">③</span>
									<p class="txt_clause">회사가 제공하는 서비스 중 관련 법령 등의 규정에 의하여 성인인증이
										필요한 경우 회원은 해당 서비스를 이용하기 위하여 회사가 제공하는 방법에 따라 실명정보를 회사에 제공하여야
										합니다.</p></li>
							</ol>
							<span class="tit">제 14 조 (양도금지)</span>
							<p>회원의 서비스 받을 권리는 이를 양도 내지 증여하거나 질권의 목적으로 사용할 수 없습니다.</p>
							<span class="tit">제 15 조 (이용요금의 납입)</span>
							<ol class="list_terms">
								<li><span class="txt_num">①</span>
									<p class="txt_clause">회원은 회사가 제공하는 서비스 중 유료서비스를 이용하는 경우
										이용대금을 납부한 후 서비스를 이용하는 것을 원칙으로 합니다.</p></li>
								<li><span class="txt_num">②</span>
									<p class="txt_clause">회사가 제공하는 유료서비스에 대한 이용요금의 결제 방법은
										핸드폰결제, 신용카드결제, 일반전화결제, 계좌이체, 무통장입금, Daum캐쉬 결제 등이 있으며 각 유료서비스마다
										결제 방법의 차이가 있을 수 있습니다.</p></li>
								<li><span class="txt_num">③</span>
									<p class="txt_clause">매월 정기적인 결제가 이루어지는 서비스의 경우 회원이 해당 서비스의
										이용을 중단하고 정기 결제의 취소를 요청하지 않는 한 매월 결제가 이루어집니다.</p></li>
								<li><span class="txt_num">④</span>
									<p class="txt_clause">회사는 결제의 이행을 위하여 반드시 필요한 회원의 개인정보를
										추가적으로 요구할 수 있으며, 회원은 회사가 요구하는 개인정보를 정확하게 제공하여야 합니다. 회사는 회원이
										허위로 또는 부정확하게 제공한 개인정보로 인하여 회원에게 발생하는 손해에 대하여 회사의 고의∙과실이 없는 한
										회원의 손해를 배상할 책임을 부담하지 않습니다.</p></li>
							</ol>
							<span class="tit">제 16 조 (이용요금의 환불 및 이의제기)</span>
							<ol class="list_terms">
								<li><span class="txt_num">①</span>
									<p class="txt_clause">회원이 과오 납입한 요금에 대하여는 회사는 그 요금을 환불하여야
										합니다.</p></li>
								<li><span class="txt_num">②</span>
									<p class="txt_clause">회원의 귀책사유로 이용요금을 환불하는 경우 일반적인 방법은 아래와
										같습니다.</p>
									<ol class="list_2depth">
										<li>회사가 제공하는 유료서비스가 결제 후 1회의 이용만으로 서비스의 이용이나 구매가 완료되는
											서비스인 경우 해당 서비스를 이용한 후에는 환불이 불가능합니다. 단, 1회의 구매 완료 후 그 사용기한이
											무제한인 아바타, 배경음악, 스킨 등의 서비스는 구매 완료일로부터 1년 이내에만 환불이 가능하며 환불금액은
											구입금액*(365-사용일수/365)로 합니다.</li>
										<li>회사가 제공하는 유료서비스가 결제 후 1개월(결제 기준) 이하로 지속되는 서비스인 경우
											해지일로부터 이용일수에 해당하는 금액을 제외한 나머지 금액을 환불합니다. 본 항의 규정은 일(1)개월 단위로
											매월 결제되는 서비스의 경우에도 적용됩니다.</li>
										<li>회사가 제공하는 유료서비스가 결제 후 1개월(결제 기준)을 초과하여 지속되는 서비스인 경우
											해지일로부터 이용일수에 해당하는 금액과 총 남은 이용일수의 10%를 제외한 금액을 환불합니다. 단, 유료
											서비스 이용 개시일로부터 7일 이내에 해지를 요구하는 경우 이용일수에 해당하는 금액만을 제외하고 환불합니다.</li>
									</ol></li>
								<li><span class="txt_num">③</span>
									<p class="txt_clause">제2항의 규정에도 불구하고 아래 각 호의 경우에는 회원이 결제한
										전액을 환불합니다.</p>
									<ol class="list_2depth">
										<li>1. 회원이 결제를 완료한 후 서비스를 이용한 내역이 없는 경우</li>
										<li>2. 서비스 장애 또는 회사가 제시한 최소한의 기술사양을 충족하였음에도 불구하고 회사의
											귀책사유로 서비스를 이용하지 못한 경우</li>
										<li>3. 회원이 구매한 서비스가 제공되지 않은 경우</li>
										<li>4. 제공되는 서비스가 표시∙광고 등과 상이하거나 현저한 차이가 있는 경우</li>
										<li>5. 제공되는 서비스의 결함으로 서비스의 정상적인 이용이 현저히 불가능한 경우</li>
									</ol></li>
								<li><span class="txt_num">④</span>
									<p class="txt_clause">제3항 제2호의 사유 또는 서비스의 중단 등 회사의 귀책사유로
										이용요금을 환불하는 경우 회사는 남은 유료서비스 이용일수에 해당하는 금액과 그 금액의 10%에 해당하는 금액을
										추가적으로 회원에게 환불합니다. 단, 1회의 구매 완료 후 그 사용기한이 무제한인 아바타, 배경음악, 스킨 등의
										서비스는 구매 완료일로부터 1년 이내일 경우에만 환불합니다.</p></li>
								<li><span class="txt_num">⑤</span>
									<p class="txt_clause">회원은 이용요금에 대하여 이의를 제기할 수 있습니다. 단,
										이용요금에 관한 이의는 그 사유 발생을 안 날로부터 1월, 그 사유가 발생한 날로부터 3월 이내에 제기하여야
										합니다.</p></li>
								<li><span class="txt_num">⑥</span>
									<p class="txt_clause">회원이 제13조의 규정을 위반하여 회사가 회원의 서비스 이용을
										제한하거나 일방적으로 본 계약을 해지하는 경우 회사는 회원에게 대하여 일체의 환불을 하지 않습니다.</p></li>
								<li><span class="txt_num">⑦</span>
									<p class="txt_clause">전액 환불의 경우 회원이 해당 서비스의 이용을 위하여 이용한
										결제수단으로 환불하는 것을 원칙으로 하나 이것이 불가능 하거나 서비스의 중도해지로 인한 부분 환불 등의 경우에는
										회사가 정하는 별도의 방법으로 환불합니다.</p></li>
								<li><span class="txt_num">⑧</span>
									<p class="txt_clause">본 조의 규정에 의한 환불은 환불 의무가 발생한 날로부터 3영업일
										이내에 하는 것으로 하며 환불이 지연되는 경우 지연이자율은 연리 11%로 합니다. 단, 환불에 회원의 협조가
										필요한 경우에 회원의 귀책사유로 인한 환불 지연에 대해서는 지연이자를 지급하지 않습니다.</p></li>
								<li><span class="txt_num">⑨</span>
									<p class="txt_clause">환불에 소요되는 비용은 회원의 귀책사유로 인한 환불의 경우에는
										회원이, 회사의 귀책사유로 인한 환불의 경우에는 회사가 각각 부담합니다.</p></li>
							</ol>
							<span class="tit">제 17 조 (이용계약의 해지)</span>
							<ol class="list_terms">
								<li><span class="txt_num">①</span>
									<p class="txt_clause">회원이 서비스 이용계약을 해지하고자 하는 때에는 언제든지
										회원정보관리에서 회사가 정한 절차에 따라 회원의 ID를 삭제하고 탈퇴할 수 있습니다.</p></li>
								<li><span class="txt_num">②</span>
									<p class="txt_clause">회원이 제13조의 규정을 위반한 경우 회사는 일방적으로 본 계약을
										해지할 수 있고, 이로 인하여 서비스 운영에 손해가 발생한 경우 이에 대한 민, 형사상 책임도 물을 수
										있습니다.</p></li>
								<li><span class="txt_num">③</span>
									<p class="txt_clause">회원이 서비스를 이용하는 도중, 연속하여 일(1)년 동안 서비스를
										이용하기 위해 회사의 서비스에 log-in한 기록이 없는 경우 회사는 회원의 회원자격을 상실시킬 수 있습니다.</p>
								</li>
								<li><span class="txt_num">④</span>
									<p class="txt_clause">유료서비스 이용계약의 해지는 회원의 서비스 해지신청 및 회사의
										승낙에 의해 성립합니다. 회사가 승낙한 시점에 해지의 효과는 발생하며 환불할 금액이 있는 경우 환불도 이루어지게
										됩니다. 환불에 대해서는 제16조의 규정을 따릅니다.</p></li>
								<li><span class="txt_num">⑤</span>
									<p class="txt_clause">각 개별 유료서비스에서 제4항의 규정과 다른 계약해지의 방법 및
										효과를 개별 약관에서 규정하고 있는 경우 각 개별 유료서비스의 계약해지에 관해서는 당해 개별약관의 규정을
										따릅니다.</p></li>
								<li><span class="txt_num">⑥</span>
									<p class="txt_clause">본 이용 계약이 해지된 경우 회원의 “게시물 등” 중 메일, 블로그
										등과 같이 본인 계정에 등록된 ‘게시물 등’ 일체는 삭제됩니다만 다른 회원에 의해 스크랩되어 게시되거나 공용
										게시판에 등록된 ‘게시물 등’은 삭제되지 않습니다.</p></li>
							</ol>
							<strong class="tit_article">제 4 장 기타</strong> <span class="tit">제
								18 조 (청소년 보호)</span>
							<p>회사는 모든 연령대가 자유롭게 이용할 수 있는 공간으로써 유해 정보로부터 청소년을 보호하고 청소년의
								안전한 인터넷 사용을 돕기 위해 정보통신망법에서 정한 청소년보호정책을 별도로 시행하고 있으며, 구체적인 내용은
								서비스 초기 화면 등에서 확인할 수 있습니다.</p>
							<span class="tit">제 19 조 (게시판 이용 상거래)</span>
							<ol class="list_terms">
								<li><span class="txt_num">①</span>
									<p class="txt_clause">서비스 내 게시판을 이용하여 상거래(판매 및 중개 포함)를 업으로
										하는 회원(이하 "게시판 이용 통신판매업자등 회원")의 경우 전자상거래 등에서의 소비자보호에 관한 법률(이하
										"전자상거래법")에 따른 통신판매업자 및 통신판매중개업자의 의무사항을 준수하여야 합니다.</p></li>
								<li><span class="txt_num">②</span>
									<p class="txt_clause">"게시판 이용 통신판매업자등 회원"은 전자상거래법에서 요구하는
										일정한 신원정보(동법 제13조 제1항 제1호 및 제2호)를 관련 게시판 서비스 내에서 제공하는 입력 기능을
										이용하여 표시하며, 해당 신원정보를 회사에 제공해야 합니다.</p></li>
								<li><span class="txt_num">③</span>
									<p class="txt_clause">회원과 "게시판 이용 통신판매업자등 회원" 사이에 상거래 관련
										분쟁이 발생하는 경우 회사는 전항에 따라 확인된 "게시판 이용 통신판매업자등 회원"의 신원정보를 다음 각 호의
										어느 하나에 해당하는 자의 요청이 있는 경우 제공할 수 있습니다.</p>
									<ul class="list_2depth">
										<li>1. 전자상거래법 제33조에 따른 소비자피해 분쟁조정기구</li>
										<li>2. 공정거래위원회</li>
										<li>3. 시·도지사 또는 시장·군수·구청장</li>
									</ul></li>
								<li><span class="txt_num">④</span>
									<p class="txt_clause">"게시판 이용 통신판매업자등 회원"으로부터 피해를 입은 회원은
										고객센터 페이지를 통하여 전항 1호에서 정한 소비자피해 분쟁조정기구에 피해구제신청을 할 수 있으며, 회사는 해당
										신청을 대행하여 처리합니다.</p></li>
							</ol>
							<span class="tit">제 20 조 (면책)</span>
							<ol class="list_terms">
								<li><span class="txt_num">①</span>
									<p class="txt_clause">회사는 다음 각 호의 경우로 서비스를 제공할 수 없는 경우 이로
										인하여 회원에게 발생한 손해에 대해서는 책임을 부담하지 않습니다.</p>
									<ol class="list_2depth">
										<li>1. 천재지변 또는 이에 준하는 불가항력의 상태가 있는 경우</li>
										<li>2. 서비스 제공을 위하여 회사와 서비스 제휴계약을 체결한 제3자의 고의적인 서비스 방해가 있는
											경우</li>
										<li>3. 회원의 귀책사유로 서비스 이용에 장애가 있는 경우</li>
										<li>4. 제1호 내지 제3호를 제외한 기타 회사의 고의∙과실이 없는 사유로 인한 경우</li>
									</ol></li>
								<li><span class="txt_num">②</span>
									<p class="txt_clause">회사는 CP가 제공하거나 회원이 작성하는 등의 방법으로 서비스에
										게재된 정보, 자료, 사실의 신뢰도, 정확성 등에 대해서는 보증을 하지 않으며 이로 인해 발생한 회원의 손해에
										대하여는 책임을 부담하지 아니합니다.</p></li>
							</ol>
							<span class="tit">제 21 조 (분쟁의 해결)</span>
							<p>본 약관은 대한민국법령에 의하여 규정되고 이행되며, 서비스 이용과 관련하여 회사와 회원간에 발생한 분쟁에
								대해서는 민사소송법상의 주소지를 관할하는 법원을 합의관할로 합니다.</p>
							<span class="tit">제 22 조 (규정의 준용)</span>
							<p>본 약관에 명시되지 않은 사항에 대해서는 관련법령에 의하고, 법에 명시되지 않은 부분에 대하여는 관습에
								의합니다.</p>
							<span class="tit">부칙</span>
							<p>본 약관은 2017년 5월 7일부터 적용됩니다. 단, 본 약관의 공지 시점으로부터 적용일 전일까지 기간
								동안에 가입한 신규회원에 대해서는 회원 가입시부터 본 약관이 적용됩니다.</p>
						</div>
						<div class="wrap_check">
							<input id="termsAgree" name="termsAgree" type="checkbox"
								class="input_check"> <label for="termsAgree"
								class="ico_join ico_check">HEALTHIN 서비스 약관에 동의합니다.</label>
							<!-- focus 시 .focus 추가 -->
						</div>
					</div>

					<div class="box_comm box_terms">
						<h5 class="tit_agreement">HEALTHIN 개인정보 수집 및 이용 동의</h5>
						<div id="policyAgreeContainer" class="cont_agreement">
							<!-- 포커스 시 tabindex=“0” 추가 -->
							<strong class="tit_article tit_article2">(주)카카오는 아래의
								목적으로 개인정보를 수집 및 이용하며, 회원의 개인정보를 안전하게 취급하는데 최선을 다합니다.</strong> <span
								class="tit">1. 수집목적</span> • 이용자 식별, 원활한 의사소통, 부정이용 시 제재 및 기록 <br>
							• 회원제 서비스 제공, 문의사항 또는 불만 처리, 공지사항 전달 <br> • 유료 서비스 이용 시 요금
							정산 <br> • 신규 서비스 개발, 이벤트 행사 시 정보 전달, 마케팅 및 광고 등에 활용 <br>
							• 서비스 이용 기록 및 통계 분석을 통한 서비스 개선 및 맞춤형 서비스 제공 <br> • 프라이버시 보호
							측면의 서비스 환경 구축 <br> <span class="tit">2. 수집항목</span> (필수)
							아이디, 비밀번호, 이름, 연락처(휴대폰번호 또는 이메일 주소 중 1개 선택) <br> <span
								class="tit">3. 보유기간</span> 수집된 정보는 회원탈퇴 후 지체없이 파기됩니다.<br> <br>서비스
							제공을 위해 필요한 최소한의 개인정보이므로 동의를 해 주셔야 서비스 이용이 가능합니다. <br>더 자세한
							내용에 대해서는 <a
								href="http://policy.daum.net/info_protection/info_protection"
								target="_blank" class="link_privacy">개인정보처리방침</a>을 참고하시기 바랍니다.
						</div>
						<div class="wrap_check">
							<input id="policyAgree" name="policyAgree" type="checkbox"
								class="input_check"> <label for="policyAgree"
								class="ico_join ico_check">HEALTHIN 개인정보 수집 및 이용 약관에 동의합니다.</label>
							<!-- focus 시 .focus 추가 -->
						</div>
					</div>

					<div class="wrap_btn">
						<button type="button" class="link_back">
							<span class="ico_join_pre"><img src="${pageContext.request.contextPath}/resources/img/pre.png"></span>이전으로
						</button>
						<button type="submit" id="nextBtn"
							class="btn_comm btn_type1 disabled">동의하기</button>
						<!-- 전체 동의 체크 후 .disabled 제거 -->
						<a
							href="${pageContext.request.contextPath}/register_form.do?type=n"
							class="btn_type2">일반 사용자 계정으로 가입하기<span class="ico_join"></span></a>
						<a href="${pageContext.request.contextPath}/register_form.do?type=y"
							class="btn_type2">Trainer 계정으로  가입하기<span class="ico_join"></span></a>
					</div>
				</fieldset>
			</form>
		</div>

		<hr class="hide">
		<div id="kakaoFoot" class="footer_comm" role="contentinfo">
			<h2 class="screen_out">서비스 이용정보</h2>
			<a href="http://policy.daum.net/info/info" target="_blank"
				class="link_info">서비스 약관</a><span class="txt_bar">|</span> <a
				href="http://policy.daum.net/info_protection/info_protection"
				target="_blank" class="link_info">개인정보처리방침</a><span class="txt_bar">|</span>
			<a href="http://cs.daum.net/faq/59/8034.html" target="_blank"
				class="link_info">회원가입 도움말</a>
			<div class="txt_copyright">
				© <a href="http://www.kakaocorp.com/main" class="link_daum"
					target="_blank">OGGIGEMAPZO Corp.</a>
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


	<script type="text/javascript">
		$(document).ready(function() {
			$('input:checkbox').prop('checked', false);

			$("#termsAgree, #policyAgree").focus(function() {
				$(this).siblings().addClass("focus");

			}).blur(function() {
				$(this).siblings().removeClass("focus");
			}).click(function() {
				$(this).siblings().toggleClass("on");
				checkAgreeState();
			});

			addTabFocusEvent();
		});

		function addTabFocusEvent() {
			$(
					"#daumServiceLogo, #termsAgree, #termsAgreeContainer, #policyAgree, #policyAgreeContainer")
					.on(
							"keydown",
							function(event) {
								if (event.shiftKey && event.which == 9)
									return;
								if (event.which == 9) {
									var targetId = $(this).attr("id");

									if (targetId === "daumServiceLogo") {
										$("#termsAgree").focus();
									} else if (targetId === "termsAgree") {
										$("#termsAgreeContainer").attr(
												"tabindex", 0).focus();
									} else if (targetId === "termsAgreeContainer") {
										$(this).removeAttr("tabindex");
										$("#policyAgree").focus();
									} else if (targetId === "policyAgree") {
										$("#policyAgreeContainer").attr(
												"tabindex", 0).focus();
									} else if (targetId === "policyAgreeContainer") {
										$(this).removeAttr("tabindex");
										$("#prevBtn").focus();
									} else {
										return;
									}
								} else {
									return true;
								}
								return false;
							});
		}

		function checkAgreeState() {
			if ($("#termsAgree").is(":checked")
					&& $("#policyAgree").is(":checked")) {
				$("#nextBtn").removeClass("disabled").focus();
			} else {
				$("#nextBtn").addClass("disabled");
			}
		}

		$("#nextBtn").click(
				function() {
					if ($("#termsAgree").prop("checked")
							&& $("#policyAgree").prop("checked")) {
						return true;
					} else {
						alert("서비스 약관과 개인정보 수집 및 이용에 대해 모두 동의해 주세요.");
						return false;
					}
				});

		$(".link_back").click(function() {
			var prev = "http://www.daum.net"
			if ("" != "") {
				prev = "";
			}
			location.href = decodeURIComponent(prev);
		});
	</script>
</body>

