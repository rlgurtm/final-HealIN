<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	#searchType {
		height: 22px;
	}
</style>
<div align="right">
	<c:choose>
		<c:when test="${sessionScope.mvo == null}">
			<a href="${pageContext.request.contextPath}/member/register_step1.do">회원가입</a>&nbsp;&nbsp;
	<a href="${pageContext.request.contextPath}/login_form.do">로그인</a>&nbsp;&nbsp;
	<a href="${pageContext.request.contextPath}/idSearchform.do">아이디 찾기</a>&nbsp;&nbsp;
	</c:when>
		<c:when test="${sessionScope.mvo.istrainer=='admin'}">
	관리자님 로그인 하셨습니다.&nbsp;&nbsp;
	<a href="${pageContext.request.contextPath}/logout.do">로그아웃</a>
		</c:when>
		<c:otherwise>
	${sessionScope.mvo.id}
	${sessionScope.mvo.nickname}님 로그인 하셨습니다.&nbsp;&nbsp;
	<a href="${pageContext.request.contextPath}/member/modify_form.do?id=${sessionScope.mvo.id}">회원정보수정</a>&nbsp;&nbsp;
	<a href="${pageContext.request.contextPath}/logout.do">로그아웃</a>&nbsp;&nbsp;
	<a href="${pageContext.request.contextPath}/withdraw_form.do">Health人 회원탈퇴</a>
		</c:otherwise>
	</c:choose>
	<c:forEach begin="1" end="10">&nbsp;</c:forEach>
</div>
<hr>
<div align="left">
	<c:forEach begin="1" end="20">&nbsp;</c:forEach>
	<a href="${pageContext.request.contextPath}/home.do"><img
		src="${pageContext.request.contextPath}/resources/img/로고.png"
		width="150" height="110"></a>
	<c:forEach begin="1" end="80">&nbsp;</c:forEach>
	<img src="${pageContext.request.contextPath}/resources/img/검색.png"
		width="20" height="20">&nbsp; <select name="searchType" id="searchType">
		<option>---카테고리---</option>
		<option value="qna">QnA</option>
		<option value="tip">Tip</option>
		<option value="vod">동영상</option>
		<option value="tutor">코치리스트</option>
	</select> 
	<input type="text" size="30" id="searchWord" 
	name="searchWord" required="required"
	placeholder="분류/제목/id로 검색됩니다."	>
	<input type="button" value="검색" id="searchBtn">
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$("#searchBtn")
									.click(
											function() {
												var choiceType = $(
														"select[name=searchType]")
														.val();
												var searchWord = $(
														"#searchWord").val();
												
												if(choiceType == '---카테고리---'){
													alert('검색 분류를 선택해주세요');
													return false;
												}

												switch (choiceType) {
												case "qna":
													location.href = '${pageContext.request.contextPath}/pt_qna/search_qna.do?searchWord='+searchWord;
													break;
												case "tip":
													location.href = '${pageContext.request.contextPath}/tip/search_tip.do?searchWord='+searchWord;
													break;
												case "vod":
													location.href = '${pageContext.request.contextPath}/searchVideoList.do?filter=no&searchWord='+searchWord;
													break;
												case "tutor":
													location.href = '${pageContext.request.contextPath}/trainer/trainerSearchList.do?searchWord='+searchWord;
													break;
												}
											});
						})
	</script>
</div>
