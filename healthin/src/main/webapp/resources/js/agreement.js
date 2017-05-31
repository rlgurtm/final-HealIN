var _tiq = 'undefined' !== typeof _tiq ? _tiq : [];
_tiq.push([ '__trackPageview' ]);
(function(d) {
	var se = d.createElement('script');
	se.type = 'text/javascript';
	se.async = true;
	se.src = '${pageContext.request.contextPath}/resources/js/td.min.js';
	var s = d.getElementsByTagName('head')[0];
	s.appendChild(se);
})(document);

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
			"#ServiceLogo, #termsAgree, #termsAgreeContainer, #policyAgree, #policyAgreeContainer")
			.on("keydown", function(event) {
				if (event.shiftKey && event.which == 9)
					return;
				if (event.which == 9) {
					var targetId = $(this).attr("id");

					if (targetId === "ServiceLogo") {
						$("#termsAgree").focus();
					} else if (targetId === "termsAgree") {
						$("#termsAgreeContainer").attr("tabindex", 0).focus();
					} else if (targetId === "termsAgreeContainer") {
						$(this).removeAttr("tabindex");
						$("#policyAgree").focus();
					} else if (targetId === "policyAgree") {
						$("#policyAgreeContainer").attr("tabindex", 0).focus();
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
	if ($("#termsAgree").is(":checked") && $("#policyAgree").is(":checked")) {
		$("#nextBtn").removeClass("disabled").focus();
	} else {
		$("#nextBtn").addClass("disabled");
	}
}

$("#nextBtn").click(function() {
	if ($("#termsAgree").prop("checked") && $("#policyAgree").prop("checked")) {
		alert('아래 두개의 버튼 중 하나를 선택해주세요.');
		return true;
	} else {
		alert("서비스 약관과 개인정보 수집 및 이용에 대해 모두 동의해 주세요.");
		return false;
	}
});

$(".link_back").click(function() {
	var prev = "../home.do";
	if ("" != "") {
		prev = "";
	}
	location.href = decodeURIComponent(prev);
});