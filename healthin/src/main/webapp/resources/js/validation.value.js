$(document)
		.ready(
				function() {
					var isPassPW = false;

					$("form")
							.initValidation(
									{
										inputEvent : "keydown focus",
										validationEvent : "blur",
										name : {
											rules : {
												required : true,
												strTrim : true,
												onlydigits : true,
												minKoreanNameLength : true,
												maxKoreanNameLength : true,
												nameenglishnamelength : true,
												koreannamelength : true,
												englishnamelength : true,
												nameinvalid : true
											}
										},
										address : {
											rules : {
												required : true
											}
										},
										career : {
											rules : {
												required : true
											}
										},
										location : {
											rules : {
												required : true
											}
										},
										uploadfile : {
											rules : {
												required : true
											}
										},
										birthdate : {
											rules : {
												required : true,
												mustdigits : true,
												rangelength : [ 8, 8 ],
												birthdate : true
											}
										},
										mobile : {
											rules : {
												required : true,
												strTrim : true,
												rangelength : [ 11, 11 ],
												startNumber : true,
												onlyNumber : true
											}
										},
										email : {
											nullable : true,
											rules : {
												strTrim : true,
												notUpperCase : true,
												email : true
											},
											errorListener : function(input,
													result) {
												if (result.extra !== undefined) {
													var activeEmailCheckError = result.extra['activeEmail'];
													if (activeEmailCheckError != undefined
															&& activeEmailCheckError.responseCode == "403") {
														redirectFirstPageForError(result.message);
														return;
													}
												}
												if ($.trim(input.val()) == "") {
													$(input).val("");
													formReset(input);
												} else {
													formError(input, result);
												}
											}
										},
										password1 : {
											inputEvent : "focus",
											validationEvent : "blur keyup",
											rules : {
												pwValid : function() {
													return {
														id : "#id"
													}
												}
											},
											errorListener : function(input,
													result) {
												if (GlobalValidationInfo.currEventType == "keyup"
														&& input.val() == "") {
													return true;
												}
												isPassPW = false;
												setInputError(input,
														result.message);
												showValidIcon(input).text("불가");
												checkPwReconfirm(input,$("#password2"));
											},
											inputListener : function(input) {
												if (isPassPW) {
													showTypingBox(input);
													hideErrorMessage($("#password2"));
												}
											},
											successListener : function(input,
													result) {
												isPassPW = true;
												setInputSuccess(input);
												if (result !== undefined
														&& result['pwValid'].extra !== undefined
														&& result['pwValid'].extra.isStrong === true) {
													showValidIcon(input)
															.addClass(
																	"txt_strong")
															.text("강력");
												} else {
													showValidIcon(input)
															.removeClass(
																	"txt_strong")
															.text("안전");
												}
												checkPwReconfirm(input,
														$("#password2"));
											}
										},
										password2 : {
											inputEvent : "focus",
											resultCaching : false,
											rules : {
												isSameValue : $("#password1")
											},
											errorListener : function(input,
													result) {
												if (isPassPW) {
													passwordNotMatched(input);
												} else {
													hideTypingBox(input);
												}
											},
											successListener : function(input) {
												if (isPassPW) {
													passwordMatched(input);
												} else {
													hideTypingBox(input);
												}
											},
											inputListener : function(input) {
												if (isPassPW) {
													setInputFocus(input);
													hideValidIcon(input);
												}
											}
										},
										errorListener : formError,
										resetListener : formReset,
										inputListener : formInput,
										successListener : formSuccess
									});

					function formError(input, result) {
						setInputError(input, result.message);
						hideValidIcon(input);
					}

					function formReset(input) {
						setInputReset(input);
						hideValidIcon(input);
					}

					function formInput(input) {
						setInputFocus(input);
						hideValidIcon(input);
					}

					function formSuccess(input) {
						setInputSuccess(input);
						showValidIcon(input);
					}

					function setInputError(input, message) {
						showErrorBox(input);
						showErrorMessage(getProperErrorMessageTarget(input),
								message);
					}

					function setInputReset(input) {
						resetBox(input);
					}

					function setInputSuccess(input) {
						if (GlobalValidationInfo.currEventType == "keyup") {
							showTypingBox(input);
						} else {
							showSuccessBox(input);
						}
						hideErrorMessage(getProperErrorMessageTarget(input));
					}

					function setInputFocus(input) {
						showTypingBox(input);
						hideErrorMessage(getProperErrorMessageTarget(input));
					}

					function showValidIcon(input) {
						var target = $(input).siblings(".mark_valid");
						if (target.length > 0) {
							target.show();
						}
						return target;
					}

					function hideValidIcon(input) {
						var target = $(input).siblings(".mark_valid");
						if (target.length > 0) {
							target.hide();
						}
						return target;
					}

					function setInputErrorCert(input, message) {
						showErrorBox(input);
						showErrorMessage(getProperErrorMessageTarget(input),
								message);
					}

					$("form input:text, form input:password").focus(function() {
						offPlaceHolder(this);
					}).blur(function() {
						onPlaceHolder(this);
					}).on("keyup keypress", function(e) {
						return e.which !== 13;
					});

					function offPlaceHolder(input) {
						$(input).siblings(".txt_placeholder").addClass(
								"screen_out");
					}

					function onPlaceHolder(input) {
						if ($(input).val() == "") {
							$(input).siblings(".txt_placeholder").removeClass(
									"screen_out");
						}
					}

					$("#joinInput")
							.submit(
									function() {
										var errorCnt = 0;

										if (!$("form").valid()) {
											errorCnt++;
										}
										if (errorCnt != 0) {
											alert('에러있다-----'+errorCnt);
											return false;
										}
										
										return true;
									});

					$("#joinInput")
							.keydown(
									function(event) {
										var activeElement = document.activeElement;
										if (event.keyCode === 13
												&& (activeElement.nodeName == 'INPUT' || $(
														activeElement).attr(
														'type') == 'submit')) {
											$(activeElement).blur();
											if (errorCnt == 0) {
												$("form").submit();
											}else{
												$("#submitBtn").attr("disabled",true);
												alert('오류있다');
												return;
											}
										}
									});

					var changeToRecommendId = function() {
						hideRecommendIds()
						$("#id").val($(this).children(".txt_other").text())
						$("#id").blur();
						$("#password1").focus();
					};

					function checkPwReconfirm(pw1, pw2) {
						if (pw2.val() == "" || !isPassPW) {
							setInputReset(pw2);
							hideValidIcon(pw2);
						} else {
							if (pw1.val() == pw2.val()) {
								passwordMatched(pw2);
							} else {
								passwordNotMatched(pw2);
							}
						}
					}

					function passwordMatched(input) {
						setInputSuccess(input);
						showValidIcon(input).text("일치");
					}

					function passwordNotMatched(input) {
						setInputError(input, $.fn.messages.passwordNotMatched);
						showValidIcon(input).text("불일치");
					}


					function showErrorBox(input) {
						$(input).parent().addClass("info_error").removeClass(
								"wrap_valid").removeClass("wrap_typing");
					}

					function showErrorMessage(input, message) {
						if (message !== undefined && message != "") {
							$(input).parent().siblings(".txt_message").html(
									message).show();
						}
					}

					function hideErrorMessage(input) {
						$(input).parent().siblings(".txt_message").hide();
					}

					function resetBox(input) {
						$(input).parent().removeClass("info_error")
								.removeClass("wrap_valid").removeClass(
										"wrap_typing");
					}

					function hideTypingBox(input) {
						$(input).parent().removeClass("info_error")
								.removeClass("wrap_typing");
					}

					function showTypingBox(input) {
						$(input).parent().removeClass("info_error").addClass(
								"wrap_valid").addClass("wrap_typing");
					}


					function showSuccessBox(input) {
						$(input).parent().removeClass("info_error").addClass(
								"wrap_valid").removeClass("wrap_typing");
					}

					function existErrorMessage(input) {
						return $(input).parent().siblings(".txt_message").length > 0;
					}

					function getProperErrorMessageTarget(input) {
						var target;
						var id = $(input).attr("id");
						if ("inpPhone" == id) {
							target = $("#inpCertCode");
						} else if ("password1" == id) {
							target = $("#password2");
						} else {
							target = input;
						}
						return target;
					}

					$(".link_back")
							.click(
									function() {
										var prev = "${pageContext.request.contextPath}/member/register_step1.do"
										if ("" != "") {
											prev = prev + "?rtnUrl=";
										}
										location.href = prev;
									});

				});

function redirectFirstPageForError(message) {
	alert(message);
	location.href = "${pageContext.request.contextPath}/member/register_step1.do";
}